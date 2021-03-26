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

  $result = $mysqli->query('select title, description, release_year 
    from film where film_id = '.$_GET['film_id']);
  $row = $result->fetch_assoc();
  echo $row['title'];
  echo '<br/><br/>';
  echo $row['description'];
  echo '<br/><br/>';
  echo $row['release_year'];

  // close the database connection
  $mysqli->close();
?>