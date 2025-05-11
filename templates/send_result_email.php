<?php
function sendResultEmail($email, $score, $total) {
    $subject = "Your SkillSphere Quiz Result";
    $message = "Dear user,\n\nThank you for completing the quiz.\nYour score: $score / $total\n\nYou can view more details in your SkillSphere account.\n\nRegards,\nSkillSphere Team";
    $headers = "From: no-reply@skillsphere.com\r\nContent-Type: text/plain; charset=UTF-8";
    mail($email, $subject, $message, $headers);
}
?>
