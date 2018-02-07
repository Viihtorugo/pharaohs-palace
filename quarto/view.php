<?php
	require_once('functions.php');
	view($_GET['NUM_QUARTO']);
?>

<?php include(HEADER_TEMPLATE_INTERNAL); ?>

<?php if ($quarto) : ?>
	<h2>Numero do quarto: <?php echo $quarto['NUM_QUARTO']; ?></h2>
	<h2>Valor: <?php echo $quarto['VALOR_QUARTO']; ?></h2>
	<h2>Tipo: <?php echo $quarto['COD_TIP_QUARTO']; ?></h2>
	<h2>Pessoas hospedadas: <?php echo $quarto['QTD_PESSOAS']; ?></h2>
	<h2>Frigobar: <?php echo $quarto['FRIGOBAR']; ?></h2>
	<h2>Banheiro: <?php echo $quarto['BANHEIRO']; ?></h2>
<?php endif; ?>

<?php include(FOOTER_TEMPLATE); ?>