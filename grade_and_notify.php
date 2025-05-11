<?php
include 'send_result_email.php';

$correct_answers = [
    "b", "a", "a", "b", "b", "b", "b", "b", "a", "a" // Example keys
];

$submissions = glob("submissions/*.json");

foreach ($submissions as $file) {
    $data = json_decode(file_get_contents($file), true);
    if (!isset($data['answers'])) continue;

    $score = 0;
    $total = count($correct_answers);

    foreach ($data['answers'] as $i => $ans) {
        if (isset($correct_answers[$i]) && strtolower(trim($ans['answer'])) === $correct_answers[$i]) {
            $score++;
        }
    }

    // simulate email attached to submission (extend this logic for real user system)
    $email = $data['email'] ?? 'user@example.com';

    // Save notification
    $notif = [
        "title" => "Quiz Result Available",
        "message" => "You scored $score out of $total.",
        "date" => date("Y-m-d H:i:s")
    ];
    $userNotifPath = "notifications/" . md5($email) . ".json";
    $userNotices = file_exists($userNotifPath) ? json_decode(file_get_contents($userNotifPath), true) : [];
    $userNotices[] = $notif;
    file_put_contents($userNotifPath, json_encode($userNotices, JSON_PRETTY_PRINT));

    // Send mail
    sendResultEmail($email, $score, $total);
}
echo "Grading completed and notifications sent.";
?>
