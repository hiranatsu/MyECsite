<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="itemtoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<title>UserCreateComplete画面</title>

	<style type="text/css">
	body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing:1px;
	font-family:Verdana,Helvetica,sans-serif;
	font-size:12px;
	color:#333;
	background-image:url("haikei1.jpg");
	}

	table{
	text-align:center;
	margin:0 auto;
	}

	#top{
	width:780px;
	margin:30px auto;
	border:1px solid #333;

	}

	#header{
	height:30px;
	padding:10px;
	background-color:#CCCCCC;
	}

	#header ul{
	float:left;
	line-height:10px;
	}

	#header ul li{
	float:left;
	list-style:none;
	font-size:12px;
	color:black;
	padding-right:15px;
	}
	#main{
	width:100%;
	height:600px;
	text-align:center;
	}

	#footer{
	width:100%;
	height:50px;
	background-color:#CCCCCC;
	text-align:center;
	line-height:50px;
	font-size:10px;
	color:white;
	clear:both;
	}

	</style>
</head>
<body>

			<h1 STYLE="color:black; margin:0 auto; font-size:50px;">Ocha</h1>
	<div id="header">

			<ul>
				<li><a href='<s:url action="HomeAction"/>'>商品一覧</a></li>
				<li>カート</li>
				<li>マイページ</li>
				<li>ログイン</li>
				<li>ログアウト</li>
			</ul>

		<div id="pr">
		</div>
	</div>
	<div id="main">
		<div id="top"><p>UserCreateComplete</p></div>
		<div>
			<h3>ユーザーの登録が完了致しました。</h3>
			<div><a href='<s:url action="HomeAction"/>'>ログインへ</a></div>
		</div>
	</div>
	<div id="footer">
		<div id="pr"> Copyright © 2018 MYECSITE01. All Rights Reserved. </div>
	</div>

</body>
</html>