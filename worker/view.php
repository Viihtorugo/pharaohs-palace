<?php  
	
	require_once('functions.php');

	view($_GET["user"], $_GET['pass']);
?>

<?php include HEADER_TEMPLATE_INTERNAL; ?>

<?php if ($worker) { ?>
	<p><h1>Funcionário: <?php echo $worker["NOME"]; ?></h1></p>
		<a class="link-next-page" href="<?php echo BASEURL; ?>quarto/">Cadastrar Quartos</a>
<?php 
	} else {
		header('Location: '. BASEURL);
	}
?>

<?php include FOOTER_TEMPLATE; ?>