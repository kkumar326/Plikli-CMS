﻿{config_load file=send_announcement_lang_conf}

{php}	
	function announcement()
	{
		global $db;
		$email = $db->get_col('SELECT user_email FROM ' . table_users . ';');
	
		if ($email)
		{
			foreach($email as $to) 
			{
				$from = SENDER;
				$message = $_POST['msg'];
				$subject = $_POST['sub'];
				mail($to, $subject, $message, "From: $from");
			}
		}
	}
	
	if(isset($_POST['submit']))
	{
		define('SENDER', $this->_confs['Plikli_Send_Announcemet_Email']);		// put the e-mail id that you want to see in from address
		announcement();
		{/php}
		<div class="alert fade in">
			<a class="close" data-dismiss="alert" href="#">&times;</a>
			<h4 class="alert-heading">{#Plikli_Send_Announcemet#}</h4>
			{#Plikli_Send_Announcement_Sent#}
		</div>
		{php}
	} else {
{/php}
	<legend>{#Plikli_Send_Announcemet#}</legend>
	
	<p>{#Plikli_Send_Announcemet_Description#}</p>
	
	<form name="frm" action="" onSubmit="return errorCheck();" method="post">
		{#Plikli_Send_Announcement_Subject#}:<br /><input type="text" name="sub" value="" class="col-md-9" /><br /><br />
		{#Plikli_Send_Announcement_Message#}:<br /><textarea name="msg" id="message" rows="10" class="col-md-9"></textarea><br />
		<br /><input type="submit" name="submit" value="{#Plikli_Send_Announcement_Submit#}" class="btn btn-primary" />
	</form>

	{literal}
	<script type="text/javascript">
	{	
		function errorCheck()
		{
			var subject=document.forms['frm'].elements['sub'].value;
			var mess=document.forms['frm'].elements['msg'].value;
			if(subject=="")
			{
				alert("Please enter the subject!");//("{#Plikli_Send_Announcement_Subject_Error#}");
				return false;
			}
			if(mess=="")
			{
				alert ("Please enter the Message!");//("{#Plikli_Send_Announcement_Message_Error#}");
				return false;
			}
			return true;
		}
	}	
	</script>
	{/literal}
{php}
}
{/php}

{config_load file=send_announcement_plikli_lang_conf}