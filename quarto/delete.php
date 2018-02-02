<?php
	require_once('functions.php');
	$id = $_GET['NUM_QUARTO'];

	if (isset($id)) delete($id);
?>