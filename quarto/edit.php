<?php
	require_once('functions.php');
	edit();
?>

<?php include(HEADER_TEMPLATE_INTERNAL); ?>

<h2>Editar Quarto</h2>
<form class="container" action="edit.php?NUM_QUARTO=<?php echo $quarto['NUM_QUARTO']; ?>" method="post">
	<input type="number" name="quarto['VALOR_QUARTO']" <?php echo $quarto['VALOR_QUARTO']; ?> placeholder="Valor">
	<input type="text" name="quarto['COD_TIP_QUARTO']" <?php echo $quarto['COD_TIP_QUARTO']; ?>  placeholder="Tipo do quarto">
	<input type="number" name="quarto['QTD_PESSOAS']" <?php echo $quarto['QTD_PESSOAS']; ?>  placeholder="Quantidade de pessoas">
	<label for="form-quarto__label--frigobar">Quarto com frigobar?</label>
	<select id="form-quarto__label--frigobar" name="quarto['FRIGOBAR']">
		<option value="S">SIM</option>
		<option value="N">NÃO</option>
	</select>
	<label for="form-quarto__label--banheiro">Quarto com banheiro?</label>
	<select id="form-quarto__label--banheiro" name="quarto['BANHEIRO']" placeholder="Quarto com banheiro?">
		<option value="S">SIM</option>
		<option value="N">NÃO</option>
	</select>
		<button class="btn btn-primary" type="submit">Atualizar</button>
</form>

<?php include(FOOTER_TEMPLATE); ?>