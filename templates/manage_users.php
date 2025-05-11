<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// 确认是否为管理员
$stmt = $pdo->prepare("SELECT role FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
if ($user['role'] !== 'admin') {
    echo "Access denied.";
    exit;
}

// 查询所有用户及其视频数量
$stmt = $pdo->query("SELECT u.id, u.username, u.email, u.role, u.status, u.created_at, u.last_login_at, u.admin_note,
                            COUNT(v.id) AS video_count
                     FROM users u
                     LEFT JOIN videos v ON u.id = v.user_id
                     GROUP BY u.id
                     ORDER BY u.id DESC");
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <?php include 'adminnav.php'; ?>
    <style>
        table {
            border-collapse: collapse;
            width: 95%;
            margin: 30px auto;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        textarea {
            width: 100%;
            resize: vertical;
            padding: 6px;
            border-radius: 6px;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            margin-bottom: 4px;
        }

        .btn-update { background-color: #4CAF50; color: white; }
        .btn-delete { background-color: #f44336; color: white; }
        .btn-info   { background-color: #3498db; color: white; }
        .btn-note   { background-color: #f39c12; color: white; }
        .btn-gray   { background-color: #7f8c8d; color: white; }

        .actions {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">👥 User Management</h2>
<table>
    <tr>
        <th>ID</th><th>Username</th><th>Email</th><th>Role</th><th>Status</th><th>Videos</th>
        <th>Registered</th><th>Last Login</th><th>Note</th><th>Actions</th>
    </tr>
    <?php foreach ($users as $u): ?>
    <tr>
        <td><?= $u['id'] ?></td>
        <td><?= htmlspecialchars($u['username']) ?></td>
        <td><?= htmlspecialchars($u['email']) ?></td>

        <!-- 角色切换 -->
        <td>
            <form method="POST" action="admin_actions.php">
                <input type="hidden" name="user_id" value="<?= $u['id'] ?>">
                <select name="role">
                    <option value="user" <?= $u['role'] === 'user' ? 'selected' : '' ?>>user</option>
                    <option value="admin" <?= $u['role'] === 'admin' ? 'selected' : '' ?>>admin</option>
                </select>
                <button type="submit" name="update_role" class="btn btn-update">✓</button>
            </form>
        </td>

        <td><?= $u['status'] ?></td>
        <td><?= $u['video_count'] ?></td>
        <td><?= $u['created_at'] ?></td>
        <td><?= $u['last_login_at'] ?: '—' ?></td>

        <!-- 备注 -->
        <td>
            <form method="POST" action="admin_actions.php">
                <input type="hidden" name="user_id" value="<?= $u['id'] ?>">
                <textarea name="admin_note" rows="2"><?= htmlspecialchars($u['admin_note']) ?></textarea>
                <button type="submit" name="update_note" class="btn btn-note">Save</button>
            </form>
        </td>

        <!-- 操作 -->
        <td>
            <?php if ($_SESSION['user_id'] != $u['id']): ?>
            <div class="actions">
                <a href="admin_actions.php?toggle=<?= $u['id'] ?>" class="btn btn-update"
                   onclick="return confirm('Toggle account status?')">
                    <?= $u['status'] === 'active' ? 'Deactivate' : 'Activate' ?>
                </a>
                <a href="admin_actions.php?delete=<?= $u['id'] ?>" class="btn btn-delete"
                   onclick="return confirm('Delete this user?')">Delete</a>
                <a href="user_detail.php?id=<?= $u['id'] ?>" class="btn btn-info">Details</a>
                <a href="send_message.php?to=<?= $u['id'] ?>" class="btn btn-note">Message</a>
                <a href="reset_password.php?user=<?= $u['id'] ?>" class="btn btn-gray">Reset PW</a>
            </div>
            <?php else: ?>
                <span style="color:gray;">Self</span>
            <?php endif; ?>
        </td>
    </tr>
    <?php endforeach; ?>
</table>

</body>
</html>
