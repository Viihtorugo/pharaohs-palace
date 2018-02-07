<?php
	require_once('functions.php');
	view($_GET['COD_FUNC']);
?>

<?php include(HEADER_TEMPLATE_INTERNAL); ?>

<?php if ($funcionario) : ?>
	<h2>Nome: <?php echo $funcionario['NOME']; ?></h2>
	<h2>Login: <?php echo $funcionario['LOGIN']; ?></h2>
<?php endif; ?>

<?php include(FOOTER_TEMPLATE); ?>