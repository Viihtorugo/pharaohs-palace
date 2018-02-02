<?php
	require_once('../config.php');
	require_once('../inc/database.php');

	$worker = null;

	function view($user, $pass){
		global $worker;
		$worker = find_login('t_funcionario', $user, $pass);
	}

 ?>