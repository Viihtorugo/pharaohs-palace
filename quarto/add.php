<?php
	require_once('functions.php');
	addQuarto();
	addTipQuarto();
?>

<?php include(HEADER_TEMPLATE); ?>

<h2>+ Adicionar quarto</h2>
<form class="container" action="add.php" method="post">
	<input type="number" name="quarto['VALOR_QUARTO']" placeholder="Valor"></textarea>
	<input type="text" name="Tquarto['COD_TIP_QUARTO']" placeholder="Tipo do quarto">
	<input type="number" name="Tquarto['QTD_PESSOAS']" placeholder="Quantidade de pessoas">
	<label for="form-quarto__label--frigobar">Quarto com frigobar?</label>
	<select id="form-quarto__label--frigobar" name="Tquarto['FRIGOBAR']">
		<option value="S">SIM</option>
		<option value="N">NÃO</option>
	</select>
	<label for="form-quarto__label--banheiro">Quarto com banheiro?</label>
	<select id="form-quarto__label--banheiro" name="Tquarto['BANHEIRO']" placeholder="Quarto com banheiro?">
		<option value="S">SIM</option>
		<option value="N">NÃO</option>
	</select>
	<button class="btn btn-primary" type="submit">Salvar</button>
</form>

<?php include(FOOTER_TEMPLATE); ?>