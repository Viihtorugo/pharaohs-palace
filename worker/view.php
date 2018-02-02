<?php  
	
	require_once('functions.php');

	view($_GET["user"], $_GET['pass']);
?>

<?php include HEADER_TEMPLATE; ?>

<?php if ($worker) { ?>
	<p><?php echo $worker["NOME"]; ?></p>

<?php 
	} else {
		header('Location: '. BASEURL);
	}
?>

<?php include FOOTER_TEMPLATE; ?>