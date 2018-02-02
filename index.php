<<<<<<< HEAD
<?php require_once('config.php'); ?>
<?php require_once('inc/database.php'); ?>

<?php include HEADER_TEMPLATE; ?>

<p><h1>Login</h1></p>
<form action="<?php echo BASEURL; ?>worker/view.php" method="get">
	<input type="text" name="user" placeholder="Usuário do funcionário" required>
	<input type="password" min="6" max="15" name="pass" placeholder="*********" required>
	<input type="submit" value="Entrar">
</form>

<?php include FOOTER_TEMPLATE; ?>