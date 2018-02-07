<?php

	require_once('../config.php');
	require_once(DBAPI);

	$funcionarios = null;
	$funcionario = null;

	function index() {
		global $funcionarios;
		$funcionarios = find_all_func('t_funcionario');
	}

	function view($idf) {
		global $funcionario;
		$funcionario = find_func('t_funcionario', $idf);
	}

	function add() {
		if (isset($_POST['funcionario'])) {
			save('t_funcionario', $_POST['funcionario']);
			header('location: index.php');
		}
	}

	function edit() {
		if (isset($_GET['COD_FUNC'])) {
			$idf = $_GET['COD_FUNC'];
			
			if (isset($_POST['funcionario'])) {
				$funcionario = $_POST['funcionario'];

				update_func('t_funcionario', $idf, $funcionario);
				header('location: index.php');
			} else {
				view($idf);
			}
		}
	}

	function delete($idf) {
		remove_func('t_funcionario', $idf, true);
		header('location: indexEdit.php');
	}