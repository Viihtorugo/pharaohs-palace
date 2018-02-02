<?php
	require_once('functions.php');
	viewQuarto($_GET['NUM_QUARTO']);
	viewTipQuarto($_GET['COD_TIP_QUARTO']);
?>

<?php include(HEADER_TEMPLATE); ?>

<?php if ($quarto) : ?>
	<h2><?php echo $quarto['NUM_QUARTO']; ?></h2>
	<h2><?php echo $quarto['VALOR_QUARTO']; ?></h2>
	<h2><?php echo $quarto['COD_TIP_QUARTO']; ?></h2>
	<h2><?php echo $quarto['QTD_PESSOAS']; ?></h2>
	<h2><?php echo $quarto['FRIGOBAR']; ?></h2>
	<h2><?php echo $quarto['BANHEIRO']; ?></h2>
<?php endif; ?>

<?php include(FOOTER_TEMPLATE); ?>