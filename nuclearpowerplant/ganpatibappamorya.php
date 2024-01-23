
<?php
echo "Welcome, let's get started";
$servername ="localhost";
$username = "root";
$password ="";
$dbname ="nuclear_power_plant_management";
$conn= $mysql( $servername,$username,$password,$dbname); 
if(!$conn)
{ die ("connection failed:".$conn->connect_error());}
?>