<html>

<head>
    <title>Query</title>
</head>

<body style="padding: 40px">
    <h1 style="">OhMySQL</h1>

        <form action="query.php" method="get">
            <textarea name="query" cols="60" rows="8" style="border: dotted 2px; position: relative"></textarea>
            <input type="submit" value="Submit" style="background-color: #E7E7E7; padding: 47px 24px; position: absolute">
        </form>
    <?php

     $query = $_GET["query"];
     if (!empty($query) && $query != "Enter Query Here")
     {
        print "<h1>Result: </h1>";
        $db_connection = mysql_connect("localhost", "cs143", "");
        mysql_select_db("CS143", $db_connection);
        $result = mysql_query($query, $db_connection);
        if (!$result) {
            die('Query failed: ' . mysql_error());
        }

         echo "<table border='1'>";

//      get column names
        $i=0;
        while ($i < mysql_num_fields($result)) {

            $col = mysql_fetch_field($result, $i);
            if (!$col) {
                echo "No information available<br />\n";
            }
            echo "<th>" . $col->name . "</th>" ;
            $i++;
        }

//      get row values
        while($row = mysql_fetch_row($result)) {
            echo "<tr>";
                for ($i=0; $i<mysql_num_fields($result); $i++) {
                    if ($row[$i]=== NULL) {
                        echo "<td>N/A</td>";
                    }
                    else {
                        echo "<td>$row[$i]</td>";
                    }
                }
            echo "</tr>";
        }
        echo "</table>";

        mysql_close($db_connection);
    }

    else
    {
        print "Please Enter a Query";
    }
    ?>

</body>


</html>
