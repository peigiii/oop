<?php
// Fetch all saved submissions
$files = glob("submissions/*.json");

$results = [];

foreach ($files as $file) {
    $content = json_decode(file_get_contents($file), true);
    if ($content) {
        $results[] = $content;
    }
}

header('Content-Type: application/json');
echo json_encode($results);
?>
