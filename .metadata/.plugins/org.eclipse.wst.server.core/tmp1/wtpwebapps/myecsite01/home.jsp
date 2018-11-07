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
	<title>Home画面</title>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

	 <script>
    $(document).ready(function(){
      $('.abc').bxSlider({
       auto: true,
       mode: 'fade',
       pause: 5000,
       speed: 2000,
       controls: false
                         });
    });
 	</script>


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
	height:800px;
	text-align:center;
	}

	.abc img{
	display: block;
	margin: 0 auto;

	}

	.bx-wrapper {
  	margin-bottom: 30;
  	-moz-box-shadow: none;
  	-webkit-box-shadow: none;
  	box-shadow: none;
  	border: none;
  	background: none;

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

	#text-center{
	display:inline-block;
	text-align:center;
	}

	</style>
</head>
<body>
			<h1 STYLE="color:black; margin:0 auto; font-size:50px;">Ocha</h1>
	<div id="header">

			<ul>
				<li><a href='<s:url action="GoHomeAction"/>'>ホーム</a></li>
				<li><a href='<s:url action="HomeAction"/>'>商品一覧</a></li>
				<li>カート</li>
				<li><a href='<s:url action="MyPageAction"/>'>購入履歴</a></li>
				<li>お問い合わせ</li>
				<li><a href='<s:url action="LoginAction"/>'>ログイン</a></li>
				<li><s:if test="#session.id != null"><a href='<s:url action="LogoutAction"/>'>ログアウト</a></s:if></li>
			</ul>

		<div id="pr">
		</div>
	</div>
	<div id="main">
		<div id="top"><p>Home</p></div>
	    <div><ul class="abc">
	      <li><img src="Home2.jpg" width=650></li>
	      <li><img src="Home3.jpg" width=650></li>
	      <li><img src="Home.jpg"  width=650></li>
	      <li><img src="Home4.jpg" width=650></li>
	      <li><img src="Home5.jpg" width=650></li>
	   </ul>
	   </div>
		<div id="text-center">
		<p>ようこそ「Ocha」へ。<br>このサイトは全国から選りすぐられた日本茶を販売しております。<br>お茶はおいしいですよね、日本の心です。一杯どうぞ。<br>え？いらない？そんなこといわずにぜひ寄ってらしてください。</p>
			<s:form action="HomeAction">
				<s:submit value="商品一覧へ"/>
			</s:form>
			<s:if test="#session.id != null">
				<p>ログアウトする場合は
				<a href='<s:url action="LogoutAction"/>'>こちら</a>
				</p>
			</s:if>
		</div>
	</div>
	<div id="footer">
		<div id="pr"> Copyright © 2018 MYECSITE01. All Rights Reserved. </div>
	</div>

</body>
</html>