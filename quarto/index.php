<?php
	require_once('functions.php');
	index();
?>

<?php include(HEADER_TEMPLATE); ?>

<h2>Quartos</h2>

<?php if ($quartos) : ?>
	<?php foreach ($quartos as $quarto) : ?>
		<div class="container data-item">	
			<h3>O numero do quarto é:<?php echo $quarto['NUM_QUARTO'] ; ?></h3>
			<div>
				<a class="btn btn-primary" href="view.php?NUM_QUARTO=<?php echo $quarto['NUM_QUARTO']; ?>">Visualizar</a>
				<a class="btn btn-warning" href="edit.php?NUM_QUARTO=<?php echo $quarto['NUM_QUARTO']; ?>">Editar</a>
				<a class="btn btn-danger" href="delete.php?NUM_QUARTO=<?php echo $quarto['NUM_QUARTO']; ?>">Excluir</a>
			</div>
		</div>
	<?php endforeach; ?>
<?php else : ?>
	<p>Nenhum registro encontrado.</p>
<?php endif; ?>

<a class="link-next-page" href="add.php">+ Adicionar quarto</a>

<?php include(FOOTER_TEMPLATE);