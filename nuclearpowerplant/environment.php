<?php
 session_start();
 if(isset($_SESSION['user']))
 {

 }
 else{
  echo"<script>location.href='login.html'</script>";
 }
?>
<html>
    <head>
        <title>Environment</title>
        <style>
            body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background: #484848;
}
.topnav {
  overflow: hidden;
  background-color:#8d2663;
  height: 70px;
  border: 3px solid #b40a70;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 35px;
  font-weight: bold;
}

.topnav-right {
  float: right;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    outline:#b40a70 solid 5px;
    width: 100%;
    margin:5px ;
    background: #FAFAFA;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
th{
  background-color:#8d2663;
}



.custombutton{
  margin:25px;
  
}input[type=text] {
    width: 15%;
    padding: 12px 20px;
    margin:8px ;
    border: 2px solid red;
    background:transparent;
    color:#000000;        
}


</style>    
</head>
<body>
<div class="topnav">
            <a class="active" href="home.html"><img src="My project.png"></a>
            <a href="environment.php">Environment</a>
            <div class="topnav-right">
              <a href="logout.php">logout</a>
            </div>
          </div>
    <?php
   
$con = mysqli_connect("localhost","root","","nuclear_power_plant_management");
if(!$con)
{ 
die("could not connect".mysql_error());
}
$var=mysqli_query($con,"select * from environment");
echo "<table border size=10>";
echo "<tr>
<th>Date</th>
<th>Temperature of core (Celsius)</th>
<th>Radiation level</th>
</tr>";
if(mysqli_num_rows($var)>0){
    while($arr=mysqli_fetch_row($var))
    { echo "<tr>
    <td>$arr[0]</td>
    <td>$arr[1]</td>
    <td>$arr[2]</td>
    </tr>";}
    echo "</table>";
    mysqli_free_result($var);
}

mysqli_close($con);
    
    
?>

</body>
</html>