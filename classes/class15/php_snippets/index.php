<?php
  $db_host = 'localhost';
  $db_user = 'root';
  $db_password = <your password here>;
  $db_db = 'sakila';
  $db_port = 8889;

  // open the database connection
  $mysqli = new mysqli(
    $db_host,
    $db_user,
    $db_password,
    $db_db
  );

  $result = $mysqli->query("select film_id, title from film");
  if ($result) {
    while ($row = $result->fetch_assoc()) {
        echo '<a href="film_detail.php?film_id='.$row['film_id'].'">'.$row['title'].'</a>';
        echo '<br/>';
    }
  }

  // close the database connection
  $mysqli->close();
?>