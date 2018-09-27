<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="itemtoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<title>MyPage画面</title>

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

	#text-right{
	display:inline-block;
	text-align:right;
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
		<div id="top">
			<p>MyPage -購入履歴-</p>
		</div>
		<div>
		<s:if test="mpList == null">
			<h3>ご購入情報はありません。</h3>
		</s:if>
		<s:elseif test="message == null">
			<h3>ご購入情報は以下になります。</h3>
			<table border="1">
			<tr>
				<th>商品名</th>
				<th>単価</th>
				<th>購入個数</th>
				<th>合計金額</th>
				<th>支払い方法</th>
				<th>購入日</th>
			</tr>
			<s:iterator value="mpList">
				<tr>
					<td><s:property value="itemName"/></td>
					<td><s:property value="unitPrice"/><span>円</span></td>
					<td><s:property value="totalCount"/><span>個</span></td>
					<td><s:property value="totalPrice"/><span>円</span></td>
					<td><s:property value="payment"/></td>
					<td><s:property value="insert_date"/></td>
				</tr>
			</s:iterator>
			</table>
			<s:form action="MyPageAction">
				<input type="hidden" name="deleteFlg" value="1">
				<s:submit value="削除" method="delete"/>
			</s:form>
		</s:elseif>
		<s:if test="message != null">
			<h3><s:property value="message"/></h3>
		</s:if>
		<div id="text-right">
			<p>Homeへ戻る場合は<a href='<s:url action="GoHomeAction"/>'>こちら</a></p>
			<p>ログアウトする場合は<a href='<s:url action="LogoutAction"/>'>こちら</a></p>
		</div>
		</div>
	</div>
	<div id="footer">
		<div id="pr"> Copyright © 2018 MYECSITE01. All Rights Reserved. </div>
	</div>

</body>
</html>