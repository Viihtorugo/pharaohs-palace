<?php
	require_once('functions.php');
	add();
?>

<?php include(HEADER_TEMPLATE_INTERNAL); ?>

<h2>+ Cadastro de funcionario</h2>
<form class="container" action="add.php" method="post">
	<input type="text" name="funcionario['NOME']" placeholder="Nome">
	<input type="text" name="funcionario['LOGIN']" placeholder="Login">
	<input type="password" name="funcionario['SENHA']" placeholder="Senha">
	<button class="btn btn-primary" type="submit">Salvar</button>
</form>

<?php include(FOOTER_TEMPLATE); ?>