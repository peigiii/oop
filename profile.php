<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

require 'db.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $phone   = $_POST['phone'] ?? '';
    $country = $_POST['country'] ?? '';
    $state   = $_POST['state'] ?? '';
    $city    = $_POST['city'] ?? '';
    $race    = $_POST['race'] ?? '';
    $avatar_path = null;

    if (!empty($_FILES['avatar']['name']) && $_FILES['avatar']['error'] === UPLOAD_ERR_OK) {
        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        if (!in_array($_FILES['avatar']['type'], $allowed_types)) {
            echo "Only JPG, PNG and GIF files are allowed.";
            exit;
        }

        $upload_dir = 'uploads/';
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0755, true);
        }

        $filename = time() . '_' . basename($_FILES['avatar']['name']);
        $target_path = $upload_dir . $filename;

        if (move_uploaded_file($_FILES['avatar']['tmp_name'], $target_path)) {
            $avatar_path = $target_path;
        }
    }

    $sql = "UPDATE users SET phone = ?, country = ?, state = ?, city = ?, race = ?";
    $params = [$phone, $country, $state, $city, $race];

    if ($avatar_path) {
        $sql .= ", avatar = ?";
        $params[] = $avatar_path;
    }

    $sql .= " WHERE id = ?";
    $params[] = $_SESSION['user_id'];

    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);

    $_SESSION['flash_message'] = "Profile updated successfully!";
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

$stmt = $pdo->prepare("SELECT username, email, phone, country, state, city, race, avatar FROM users WHERE id = ?");
$stmt->execute([$_SESSION['user_id']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <?php include 'nav.php'; ?>
    
    <style>
        
        h2 {
        margin-top: 80px;
        font-size: 24px;}

        .success-message {
            max-width: 800px;
            margin: 10px auto;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            opacity: 1;
        }
        .profile-container {
            max-width: 900px;
            margin: auto;
            display: flex;
            gap: 40px;
            align-items: flex-start;
        }
        .avatar-block {
            position: relative;
            width: 100px;
            height: 100px;
        }
        .avatar-block label {
            display: block;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }
        .avatar-block img {
            border-radius: 50%;
            width: 100%;
            height: 100%;
            object-fit: cover;
            border: 2px solid #ccc;
        }
        .avatar-block input[type="file"] {
            display: none;
        }
        .avatar-block::after {
            content: "\f030";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            position: absolute;
            bottom: 0;
            right: 0;
            background: #000;
            color: #fff;
            border-radius: 50%;
            padding: 6px;
            font-size: 14px;
        }
        .info-form {
            flex: 1;
        }
        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-row label {
            width: 150px;
            font-style: italic;
        }
        .form-row input,
        .form-row select {
            flex: 1;
            padding: 8px;
            border: none;
            border-bottom: 2px solid #e6a89b;
            background-color: #f9d6cd;
            border-radius: 5px;
        }
        .buttons {
            margin-top: 30px;
            display: flex;
            gap: 20px;
            justify-content: flex-end;
        }
        .buttons button,
        .buttons a {
            padding: 10px 20px;
            border-radius: 20px;
            border: none;
            background-color: #ccd9c6;
            color: #fff;
            font-style: italic;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<?php if (!empty($_SESSION['flash_message'])): ?>
    <div class="success-message" id="flashMessage">
        <?php echo $_SESSION['flash_message']; unset($_SESSION['flash_message']); ?>
    </div>
<?php endif; ?>

<h2>User Profile</h2>

<form class="profile-container" method="POST" enctype="multipart/form-data">
    <div class="avatar-block">
        <label for="avatarInput">
            <img src="<?php echo !empty($user['avatar']) && file_exists($user['avatar']) ? htmlspecialchars($user['avatar']) : 'https://cdn-icons-png.flaticon.com/512/847/847969.png'; ?>" alt="Avatar">
            <input type="file" name="avatar" id="avatarInput" accept="image/*">
        </label>
    </div>

    <div class="info-form">
        <div class="form-row">
            <label>Name:</label>
            <input type="text" value="<?php echo htmlspecialchars($user['username']); ?>" disabled>
        </div>
        <div class="form-row">
            <label>Email:</label>
            <input type="email" value="<?php echo htmlspecialchars($user['email']); ?>" disabled>
        </div>
        <div class="form-row">
            <label>Phone number:</label>
            <input type="text" name="phone" value="<?php echo htmlspecialchars($user['phone'] ?? ''); ?>">
        </div>
        <div class="form-row">
            <label>Country:</label>
            <select name="country" id="country" onchange="updateStateOptions()">
                <option value="Malaysia" <?php echo ($user['country'] ?? '') === 'Malaysia' ? 'selected' : ''; ?>>Malaysia</option>
                <option value="Singapore" <?php echo ($user['country'] ?? '') === 'Singapore' ? 'selected' : ''; ?>>Singapore</option>
            </select>
        </div>
        <div class="form-row">
            <label>State:</label>
            <select name="state" id="state"></select>
        </div>
        <div class="form-row">
            <label>City:</label>
            <input type="text" name="city" value="<?php echo htmlspecialchars($user['city'] ?? ''); ?>">
        </div>
        <div class="form-row">
            <label>Race:</label>
            <input type="text" name="race" value="<?php echo htmlspecialchars($user['race'] ?? ''); ?>">
        </div>

        <div class="buttons">
            <button type="submit">Save</button>
            <a href="logout.php">Logout</a>
        </div>
    </div>
</form>

<script>
const stateData = {
    Malaysia: ["Johor", "Kedah", "Kelantan", "Kuala Lumpur", "Labuan", "Malacca", "Negeri Sembilan", "Pahang", "Penang", "Perak", "Perlis", "Putrajaya", "Sabah", "Sarawak", "Selangor", "Terengganu"],
    Singapore: ["Singapore"]
};

function updateStateOptions() {
    const country = document.getElementById("country").value;
    const stateSelect = document.getElementById("state");
    stateSelect.innerHTML = "";
    if (stateData[country]) {
        stateData[country].forEach(state => {
            const option = document.createElement("option");
            option.value = state;
            option.textContent = state;
            if ("<?php echo $user['state'] ?? ''; ?>" === state) {
                option.selected = true;
            }
            stateSelect.appendChild(option);
        });
    }
}

window.addEventListener("DOMContentLoaded", function () {
    updateStateOptions();

    const flash = document.getElementById("flashMessage");
    if (flash) {
        setTimeout(() => {
            flash.style.transition = "opacity 0.5s ease-out";
            flash.style.opacity = "0";
            setTimeout(() => flash.remove(), 500);
        }, 3000);
    }
});

document.getElementById('avatarInput').addEventListener('change', function (e) {
    const file = e.target.files[0];
    if (file && file.type.startsWith('image/')) {
        const reader = new FileReader();
        reader.onload = function (event) {
            const avatarImg = document.querySelector('.avatar-block img');
            avatarImg.src = event.target.result;
        };
        reader.readAsDataURL(file);
    }
});
</script>

</body>
</html>
