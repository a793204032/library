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
            <form action="search" method="post" class="navbar-form navbar-right">
				<div class="input-group">
                    <input type="text" class="form-control" name="Name" value="${author.getName()}" placeholder="作者">
                      <span class="input-group-btn">
                          <button class="btn btn-default" type="submit">查询</button>
                      </span>
                </div>
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div  style="margin-top: inherit" class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="images/img01.jpg" alt="#">
            <div class="carousel-caption">
            </div>
        </div>
        <div class="item">
            <img src="images/img02.jpg" alt="...">
            <div class="carousel-caption">
            </div>
        </div>
        <div class="item">
            <img src="images/img03.jpg" alt="...">
            <div class="carousel-caption">
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<h1 style="margin-left:20px; ">推荐列表</h1>
<div class="row" style="margin-top: 20px;" >
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="images/img04.PNG" alt="...">
            <div class="caption">
                <h3>平凡的世界</h3>
                <p>作者：路遥</p>
                <p><a href="https://book.douban.com/subject/1084165/" class="btn btn-primary" role="button">豆瓣</a><form action=show><button type="submit" class="btn btn-info"  name="BookName" value="平凡的世界"/>书本信息</button></form></p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="images/img05.jpg" alt="...">
            <div class="caption">
                <h3>不属于我们的世纪</h3>
                <p>作者：[美] 马修·托马斯 </p>
                <p><a href="https://book.douban.com/subject/26831234/?icn=index-topchart-subject" class="btn btn-primary" role="button">豆瓣</a><form action=show><button type="submit" class="btn btn-info"  name="BookName" value="不属于我们的世纪"/>书本信息</button></form></p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="images/img06.jpg" alt="...">
            <div class="caption">
                <h3>从你的全世界路过</h3>
                <p>作者：张嘉佳</p>
                <p><a href="https://book.douban.com/subject/25747921/" class="btn btn-primary" role="button">豆瓣</a><form action=show><button type="submit" class="btn btn-info"  name="BookName" value="从你的全世界路过"/>书本信息</button></form></p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="images/img07.jpg" alt="...">
            <div class="caption">
                <h3>解忧杂货店</h3>
                <p>作者：(日)东野圭吾</p>
                <p><a href="https://book.douban.com/subject/25862578/" class="btn btn-primary" role="button">豆瓣</a><form action=show><button type="submit" class="btn btn-info"  name="BookName" value="解忧杂货店"/>书本信息</button></form></p>
            </div>
        </div>
    </div>
</div>
</body>
</html>