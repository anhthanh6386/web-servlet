<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style4 {
	color: #003333;
	font-weight: bold;
}
-->
</style>
</head>

<body>
	<div>
		<video src="localhost:8080/Asm4/F:\Video\test.mp4" controls></video>
	</div>
	<b>${pageContext.request.contextPath }</b>

	<!-- <embed type="application/x-mplayer2"
		pluginspage="http://www.microsoft.com/Windows/MediaPlayer/"
		name="mediaplayer1" ShowStatusBar="true" EnableContextMenu="false"
		autostart="false" width="320" height="240" loop="false"
		src="localhost:8080/Asm4/F:\Video\test.mp4" />
 -->

</body>
</html>

