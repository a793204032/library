<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="data.JDBCTest" %>
<%@ page import="Info.Books"%>
<%@ page import="Info.Author" %>
<%@ page import="com.mystruts.action.UserAction" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书馆</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        body { padding-top: 50px; }
    </style>
</head>
<body>
<nav  class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid" >
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="col-md-2"></div>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">图书馆</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">好书推荐</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"  >发现好书<span class="caret" ></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li ><a href="#">排行</a></li>
                        <li class="divider"></li>
                        <li><a href="#">作者</a></li>
                        <li class="divider"></li>
                        <li><a href="#">新书上架</a></li>
                    </ul>
                </li>
                <li><a href="#">我的收藏</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            </ul>
            <form action="search" class="navbar-form navbar-right">
				<div class="input-group">
                    <input type="text" class="form-control" name="Name" value="<s:property value="Name"/>" placeholder="书名/作者">
                      <span class="input-group-btn">
                          <button class="btn btn-default" type="submit">查询</button>
                      </span>
                </div>
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
   <table class="table table-striped">
	<s:iterator value="#request.BOOKLITE" var="item">
			<tr  align="center">
			<td>
			    <s:param name="BookName" value="#item"/>
			    <s:property value="item"/>
		   </td>
			    <td><form action=show>
			    <button type="submit" class="btn btn-info"  name="BookName" value=<s:property value="item"/>>书本信息</button>
			    </form></td>
			    <td><form action=showWriter>
			    <button type="submit" class="btn btn-success" name="Name" value=<s:property value="Name"/>>作者信息</button>
			    </form></td>
			    <td><form action=delete>
			    <button type="submit" class="btn btn-danger" name="BookName" value=<s:property value="item"/>>删除</button>
			    </form></td>
		  </tr>
	</s:iterator>
   </table>
  </body>
</html>