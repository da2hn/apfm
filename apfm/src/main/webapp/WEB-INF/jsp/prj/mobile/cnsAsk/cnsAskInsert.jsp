<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>상담문의하기 등록</title>
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
  		$("#title").empty().
  		$("#pw").empty();
	});
  	
  	function fn_reg() {
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/mgnoincoun/cnsAskReg.do";
	       	document.frm.submit();
		}		
  	}
  </script>
  <body>
    <!-- 헤더 ================================================== -->

    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>상담문의하기</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">상담 문의하기</li>
        </ol>
      </div>
      <div class="content-area">
        <form class="form-wrap" id="frm" name="frm" method="post" enctype="multipart/form-data">
          <input type="hidden" id="save" name="save" value='<c:out value="${save }"/>' />
          <div class="form-group">
            <label class="control-label" for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title">
          </div>
          <div class="form-group">
            <label class="control-label" for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw">
          </div>
          <div class="form-group">
            <label class="control-label" for="cntn">문의내용</label>
            <textarea rows="5" class="form-control" id="cntn" name="cntn"></textarea>
          </div>
          <div class="btn-wrap line bt mt20 pt20 pb20">
            <button type="button" class="btn btn-primary btn-lg w100p" id="save" onClick="javascript:fn_reg();">등록하기</button>
          	<button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="location.href='/mgnoincoun/cnsAskList.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button>
          </div>
        </form>
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->