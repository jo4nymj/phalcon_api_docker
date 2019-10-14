<?php
// Instantiate the class responsible for implementing a micro application
$app = new \Phalcon\Mvc\Micro();

// TODO Define routes
$app->get('/say/date', 'currentDate');
$app->get('/say/hello/{name}', 'greeting');

// TODO Code route handler functions
function currentDate() {
  echo date('Y-m-d');
}

function greeting($name) {
  echo "Hello " . $name;
}

$app->notFound('notFound');

function notFound() {
    // Access to the global var $app
    global $app;
    
    $app->response->setStatusCode(404, "Not Found")->sendHeaders();
    echo 'Oops, Not Found!!';
}

// Handle the request
$app->handle();
?>
