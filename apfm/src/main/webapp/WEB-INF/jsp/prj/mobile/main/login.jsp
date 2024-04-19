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
    <title>알려드려요&amp;자유게시판</title>
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
  
  	$(document).ready(function() {
	  	var message = "${message}";
	  	if(message.length > 0) {
	  		alert(message);
	  	}
	});
  	
	function login(){
		if(confirm("로그인 하시겠습니까?")) {
			var frm = document.loginForm;
			frm.action = "/mgnoincoun/actionLogin.do";
			frm.submit();			
		}
	}
  </script>
  <body>
    <!-- 헤더 ================================================== -->

    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>마이 페이지</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincounmobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">마이 페이지</li>
        </ol>
      </div>
      <h2 class="title">로그인</h2>
      <div class="login-content">
	  	<form id="loginForm" name="loginForm" method="post">
			<fieldset id="acField">
				<div class="form-group">
					<label for="userId">아이디</label>
                	<input name="userId" id="userId" type="text" class="form-control"  placeholder="Your ID" maxlength="15" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');">
              	</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input name="pw" id="pw" type="password" class="form-control"  placeholder="Password" maxlength="20">
				</div>
              <span class="checkbox-custom"><input type="checkbox" name="" id="chech-log" value=""><label for="chech-log"><i></i><span>로그인 유지</span></label></span>
              <button class="btn btn-primary btn-lg w100p mt30" onClick="javascript:login();">로그인</button>
              <span class="btn-group btn-group-justified mt30"><a href="/mgnoincoun/agree.do" class="btn btn-default btn-sm">회원가입</a><a href="/mgnoincoun/findIdPw.do" class="btn btn-default btn-sm">ID/PW 찾기</a></span>
			</fieldset>
		</form>
	  </div>
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
