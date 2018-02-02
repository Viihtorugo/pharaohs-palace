<?php
	require_once('functions.php');
	index();
?>

<?php include(HEADER_TEMPLATE); ?>

<h2>Funcionários registrados</h2>

<?php if ($funcionarios) : ?>
	<?php foreach ($funcionarios as $funcionario) : ?>
		<div class="container data-item">	
			<h3><?php echo $funcionario['NOME']; ?></h3>
			<div>
				<a class="btn btn-danger" href="delete.php?COD_FUNC=<?php echo $funcionario['COD_FUNC']; ?>">Excluir</a>
			</div>
		</div>
	<?php endforeach; ?>
<?php else : ?>
	<p>Nenhum registro encontrado.</p>
<?php endif; ?>

<a class="link-next-page" href="add.php">+ Adicionar funcionário</a>

<?php include(FOOTER_TEMPLATE);