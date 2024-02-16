<?php
echo "Hello World!\n";

// $argv contains the command-line arguments
$args = array_slice($argv, 1); // We slice the first element

echo 'Command-line arguments: ';
print_r($args);
exit(0);
?>