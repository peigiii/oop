<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

try {
    $jsonFile = __DIR__ . '/questions.json';
    if (!file_exists($jsonFile)) {
        throw new Exception('Questions file not found');
    }
    
    $jsonContent = file_get_contents($jsonFile);
    if ($jsonContent === false) {
        throw new Exception('Failed to read questions file');
    }
    
    // Validate JSON
    $data = json_decode($jsonContent, true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Invalid JSON format: ' . json_last_error_msg());
    }
    
    // Transform the data structure
    $transformedData = [];
    foreach ($data as $level) {
        $levelKey = 'java level ' . $level['level'];
        $transformedData[$levelKey] = $level['questions'];
    }
    
    echo json_encode($transformedData);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>
