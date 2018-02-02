<?php
	require_once('functions.php');
	$id = $_GET['COD_FUNC'];
	if (isset($id)) delete($id);
?>