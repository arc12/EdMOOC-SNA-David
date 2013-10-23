<?php

$con=mysqli_connect("localhost","KingKongRoot","CarBoot","aiplangen");
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

// should use PDO with prepared statements etc, who cares

$result = mysqli_query($con,'SELECT *  from users WHERE last_access_ip != ""');

echo "<table>";

//worst way of doing this ever
while($row = mysqli_fetch_array($result))
  {
  
  $longip = sprintf('%u',ip2long($row['last_access_ip']));
  $query = "SELECT locId FROM blocks WHERE $longip BETWEEN startIpNum AND endIpNum LIMIT 1";
  $result2 = mysqli_query($con, $query);
  $row2 = $result2->fetch_assoc();
  $locId = $row2['locId'];
  
  $query = "SELECT * FROM location WHERE id = \"$locId\" LIMIT 1";
  $result3 = mysqli_query($con, $query);
  $row3 = $result3->fetch_assoc();

 $country=$row3['country'];
 $region=$row3['region'];
 $city=$row3['city'];
 $lat=$row3['latitude'];
 $long=$row3['longitude'];
 $ip=$row['last_access_ip'];

 $query = "UPDATE users SET ip_country=\"$country\", ip_country=\"$country\", ip_region=\"$region\", ip_city=\"$city\", ip_lat=\"$lat\", ip_long=\"$long\" WHERE last_access_ip = \"$ip\";";  
  $result4 = mysqli_query($con, $query);
   echo "<tr>";
   echo "<td>" . $row['last_access_ip'] . "</td>";
   echo "</tr>";
   
 
  }
  
echo "</table>";
mysqli_close($con);
?>