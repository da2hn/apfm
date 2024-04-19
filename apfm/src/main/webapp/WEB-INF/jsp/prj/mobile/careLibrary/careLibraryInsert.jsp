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
    <title>마음돌봄 자료실</title>
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
			document.frm.action = "/mgnoincoun/careLibraryReg.do";
	       	document.frm.submit();
		}		
  	}
  </script>
  <body>
    <!-- 헤더 ================================================== -->

    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>마음돌봄 자료실</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">마음돌봄 자료실</li>
        </ol>
      </div>
      <div class="content-area">
        <form class="form-wrap" id="frm" name="frm" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label class="control-label" for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title">
          </div>
          <div class="form-group">
            <label class="control-label" for="pw">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw">
          </div>
          <div class="form-group">
            <label class="control-label" for="cntn">내용</label>
            <textarea rows="5" class="form-control" id="cntn" name="cntn"></textarea>
          </div>
          <!-- 파일첨부 /-->
          <div class="form-group">
            <label class="control-label" for="">첨부파일</label>
            <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" name="file" class="upload-hidden"></div>
            <!-- <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename2">파일</label> <input type="file" id="ex_filename2" class="upload-hidden"></div>
            <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename3">파일</label> <input type="file" id="ex_filename3" class="upload-hidden"></div>
            <div class="btn-group mt5 fr">
              <button class="btn btn-xs btn-default" type="button"><i class="fa fa-plus"></i><span class="blind">추가</span></button>
              <button class="btn btn-xs btn-default" type="button"><i class="fa fa-minus"></i><span class="blind">삭제</span></button>
            </div> -->
          </div>
          <!-- 파일첨부 /-->
          <div class="btn-wrap line bt mt20 pt20 pb20">
            <button type="button" class="btn btn-primary btn-lg w100p" id="save" onClick="javascript:fn_reg();">등록하기</button>
          	<button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="location.href='/mgnoincoun/careLibraryList.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button>
          </div>
        </form>
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->