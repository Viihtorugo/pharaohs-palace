<?php
	require_once('functions.php');
	$idf = $_GET['COD_FUNC'];
	if (isset($idf)) delete($idf);
?>