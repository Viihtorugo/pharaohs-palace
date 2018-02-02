<?php
	require_once('functions.php');
	view($_GET['COD_FUNC']);
?>

<?php include(HEADER_TEMPLATE); ?>

<?php if ($funcionario) : ?>
	<h2>Nome: <?php echo $funcionario['NOME']; ?></h2>
	<h2>Login: <?php echo $funcionario['LOGIN']; ?></h2>
	<a class="link-next-page" href="../quartos/index.php?COD_FUNC=<?php echo $funcionario['COD_FUNC']; ?>">Quartos ></a>
<?php endif; ?>

<?php include(FOOTER_TEMPLATE); ?>