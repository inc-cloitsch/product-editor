<?php

global $db;

$tablename = "fdata_ingredient";
$sort_by = " ORDER BY sort_nb ";

if($_GET["type"]=="enthalt") {
    $tablename = "fdata_ingredient_enthalt";
    $sort_by = "";
} else if($_GET["type"]=="gering") {
    $tablename = "fdata_ingredient_gering";
    $sort_by = "";
}

if($_GET["ingredient_connection"]=="get") {

    $stmt = $db->prepare("SELECT * FROM $tablename WHERE fdata_id= :fdata_id " . $sort_by);
    $stmt->bindValue(":fdata_id",$_REQUEST["fdata_id"]);
    $stmt->execute();
    echo json_encode($stmt->fetchAll()); die;
    
} else if ($_GET["ingredient_connection"] == "update-sort-nb") {
    $stmt = $db->prepare("UPDATE $tablename SET sort_nb=:sort_nb WHERE fdata_id=:fdata_id AND ingredient_id=:ingredient_id");
    $stmt->bindValue(":fdata_id",$_REQUEST["fdata_id"]);
    $stmt->bindValue(":ingredient_id",$_REQUEST["ingredient_id"]);
    $stmt->bindValue(":sort_nb",$_REQUEST["sort_nb"]);
    $stmt->execute();

    if(!$stmt->execute()) {
        echo "SQL Failure: ".$db->errorInfo()[2]; die;
    }
    echo "success"; die;
} else {

    $dbstr = "";

    if($_GET["ingredient_connection"]=="create") {
        $dbstr = "INSERT INTO $tablename (fdata_id,ingredient_id) VALUES (:fdata_id,:ingredient_id)";
    } else if($_GET["ingredient_connection"]=="delete") {
        $dbstr = "DELETE FROM $tablename WHERE fdata_id = :fdata_id AND ingredient_id = :ingredient_id";
    } else {
        echo "API Failure"; die;
    }

    $stmt = $db->prepare($dbstr);

    $stmt->bindValue(":fdata_id",$_REQUEST["fdata_id"]);
    $stmt->bindValue(":ingredient_id",$_REQUEST["ingredient_id"]);

    if(!$stmt->execute()) {
        echo "SQL Failure: ".$db->errorInfo()[2]; die;
    }

    echo "success"; die;
}