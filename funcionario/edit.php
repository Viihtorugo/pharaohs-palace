<?php
	require_once('functions.php');
	edit();
?>

<?php include(HEADER_TEMPLATE_INTERNAL); ?>

<h2>Editar funcionário</h2>
<form class="container" action="edit.php?COD_FUNC=<?php echo $funcionario['COD_FUNC']; ?>" method="post">
	<input type="text" name="funcionario['NOME']" value="<?php echo $funcionario['NOME']; ?>" placeholder="Nome">
	<input type="text" name="funcionario['LOGIN']" value="<?php echo $funcionario['LOGIN']; ?>" placeholder="Login">
	<input type="password" name="funcionario['SENHA']" value="<?php echo $funcionario['SENHA']; ?>" placeholder="Senha">
	<button class="btn btn-primary" type="submit">Atualizar</button>
</form>

<?php include(FOOTER_TEMPLATE); ?>