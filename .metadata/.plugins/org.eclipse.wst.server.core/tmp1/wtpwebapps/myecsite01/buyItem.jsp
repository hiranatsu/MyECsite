<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="itemtoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<title>BuyItem画面</title>

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
		<div id="top">
			<p>BuyItem -商品一覧-</p>
		</div>
		<div>

			<s:form action="BuyItemAction">
			<table>
			<tbody>
				<tr>
					<th>商品ID</th>
					<th>商品名</th>
					<th>値段</th>
					<th>個数</th>
				</tr>

				<s:iterator value="session.buyItemList" >
				<tr>
					<td><s:property value="id"/></td>
					<td><s:property value="itemName"/></td>
					<td class="int"><s:property value="itemPrice"/><span>円</span></td>
					<td class="int">
						<select name="count">
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
				</tr>
				</s:iterator>

				<tr>
					<td>
						<input type="radio" name="pay" value="1" checked="checked">現金払い
						<input type="radio" name="pay" value="2">クレジットカード
					</td>
				</tr>
				<tr>
					<td><s:submit value="購入"/></td>
				</tr>

			</tbody>
			</table>


			</s:form>
			<div>
				<p>前画面に戻る場合は<a href='<s:url action="GoHomeAction"/>'>こちら</a></p>
				<p>マイページは<a href='<s:url action="MyPageAction"/>'>こちら</a></p>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="pr"> Copyright © 2018 MYECSITE01. All Rights Reserved. </div>
	</div>

</body>
</html>