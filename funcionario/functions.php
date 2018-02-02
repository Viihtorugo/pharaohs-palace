<?php

	require_once('../config.php');
	require_once(DBAPI);

	$funcionarios = null;
	$funcionario = null;

	function index() {
		global $funcionarios;
		$funcionarios = find_all('t_funcionario');
	}

	function view($id) {
		global $funcionario;
		$funcionario = find('t_funcionario', $id);
	}

	function add() {
		if (isset($_POST['funcionario'])) {
			save('t_funcionario', $_POST['funcionario']);
			header('location: index.php');
		}
	}

	function edit() {
		if (isset($_GET['COD_FUNC'])) {
			$id = $_GET['COD_FUNC'];
			
			if (isset($_POST['funcionario'])) {
				$funcionario = $_POST['funcionario'];

				update('t_funcionario', $id, $funcionario);
				header('location: index.php');
			} else {
				view($id);
			}
		}
	}

	function delete($id) {
		removefUNC('t_funcionario', $id, true);
		header('location: index.php');
	}