<?php

	require_once('../config.php');
	require_once(DBAPI);

	$quartos = null;
	$quarto = null;

	function index() {
		global $quartos;
		$quartos = find_all('t_quarto');
	}

	function viewQuarto($id) {
		global $quarto;
		$quarto = find('t_quarto', $id);
	}
	function viewTipQuarto($id) {
		global $quarto;
		$quarto = find('t_tipo_quarto', $id);
	}

	function addQuarto() {
		if (isset($_POST['quarto'])) {
			save('t_quarto', $_POST['quarto']);
			header('location: index.php');
		}
	}

	function addTipQuarto() {
		if (isset($_POST['Tquarto'])) {
			save('t_tipo_quarto', $_POST['Tquarto']);
			header('location: index.php');
		}
	}

	function editQuarto() {
		if (isset($_GET['NUM_QUARTO'])) {
			$id = $_GET['NUM_QUARTO'];
			
			if (isset($_POST['quarto'])) {
				$quarto = $_POST['quarto'];

				update('t_quarto', $id, $quarto);
				header('location: index.php');
			} else {
				
			}
		}
	}
	function editTipQuarto() {
		if (isset($_GET['NUM_QUARTO'])) {
			$id = $_GET['NUM_QUARTO'];
			
			if (isset($_POST['Tquarto'])) {
				$quarto = $_POST['Tquarto'];

				update('t_tipo_quarto', $id, $quarto);
				header('location: index.php');
			} else {
			
			}
		}
	}

	function delete($id) {
		removeQUART('t_quarto', $id);
		header('location: index.php');
	}