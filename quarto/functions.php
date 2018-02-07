<?php

	require_once('../config.php');
	require_once(DBAPI);

	$quartos = null;
	$quarto = null;

	function index() {
		global $quartos;
		$quartos = find_all_quartos('t_quarto');
	}

	function view($id) {
		global $quarto;
		$quarto = find_quarto('t_quarto', $id);
	}


	function add() {
		if (isset($_POST['quarto'])) {
			save('t_quarto', $_POST['quarto']);
			header('location: index.php');
		}
	}

	function edit() {
		if (isset($_GET['NUM_QUARTO'])) {
			$id = $_GET['NUM_QUARTO'];
			
			if (isset($_POST['quarto'])) {
				$quarto = $_POST['quarto'];

				update_quarto('t_quarto', $id, $quarto);
				header('location: index.php');
			} else {
				
			}
		}
	}

	function delete($id) {
		remove_quarto('t_quarto', $id);
		header('location: index.php');
	}