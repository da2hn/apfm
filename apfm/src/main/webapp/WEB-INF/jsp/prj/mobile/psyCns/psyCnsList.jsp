<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>간편한 심리검사</title>
    <!-- Bootstrap core CSS -->
    <link href="/mgnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/mgnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mgnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/mgnoincoun/js/jquery-1.11.2.min.js" ></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/mgnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
	  function fn_move(url) {
		  var loginYn = "${loginYn}";
		  if(loginYn == "Y") {
			  location.href=url;			  
		  } else if(loginYn == "N") {
			  alert("로그인 후에 간편한 심리검사를 하실 수 있습니다.");
			  // location.href="/mgnoincoun/login.do";
		  }
	  }
  </script>
  <body>
    <!-- 헤더 ================================================== -->

    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>간편한 심리검사</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">간편한 심리검사</li>
        </ol>
      </div>
      <div class="quick-question">
        <ul>
          <li class="col-xs-12 col-sm-6 col-md-6">
            <h2 class="title">DUKE-AD</h2>
            <a href="javascript:fn_move('/mgnoincoun/psyDukeDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
          <li class="col-xs-12 col-sm-6 col-md-6">
            <h2 class="title">GDS-SI</h2>
            <a href="javascript:fn_move('/mgnoincoun/psyGdsDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
          <li class="col-xs-12 col-sm-6 col-md-4">
            <h2 class="title">불안척도</h2>
            <a href="javascript:fn_move('/mgnoincoun/psyAnxiDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
          <!-- <li class="col-xs-12 col-sm-6 col-md-4">
            <h2 class="title">대인관계변화척도</h2>
            <a href="javascript:fn_move('/mgnoincoun/psyPerRelDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li> -->
          <li class="col-xs-12 col-sm-6 col-md-4">
            <h2 class="title">스트레스척도</h2>
            <a href="javascript:fn_move('/mgnoincoun/psyStressDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
          <li class="col-xs-12 col-sm-6 col-md-4">
            <h2 class="title">사별스트레스척도</h2>
            <a href="javascript:fn_move('/mgnoincoun/psyBereavDoc.do')" class="btn btn-default btn-sm">바로가기<i class="fa fa-caret-right ml5"></i></a>
          </li>
        </ul>
      </div>
      <!-- <div class="btn-wrap line pb20">
        <button type="button" class="btn btn-primary btn-lg w100p" onclick="location.href='sub04.html'">결과보기</button>
      </div> -->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->