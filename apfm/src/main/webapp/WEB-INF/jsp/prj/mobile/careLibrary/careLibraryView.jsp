<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/mgnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
  	function fn_fileDown() {
  		var sysFileNm = "${detail.sysFileNm}";
  		var filePath = "${detail.filePath}";
  		var fileNm = "${detail.fileNm}";
        document.location.href = "/mgnoincoun/fileDown.do?sysFileNm="+sysFileNm+"&filePath="+filePath+"&fileNm="+fileNm;
  	}
  	function fn_movePage(num,prevYn) {
  		document.location.href = "/mgnoincoun/careLibraryView.do?num="+num+"&prevYn="+prevYn;
  	}
  </script>
  <style>
  	textarea{border:1px solid #ccc;border-right:1px solid #a5a5a5;border-bottom:1px solid #a5a5a5;border-top:1px solid #ddd !important;width:100%;padding:5px;background:#f9f9f9;min-height:100px;}
  </style>
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
        <div class="article-area">
          <div class="board_box article-header" >
            <div class="txt_area">   
              <!-- 제목 -->
              <strong class="tit"><c:out value="${detail.title }"/></strong>
              <!-- 제목 //-->
              <!-- 글등록정보 -->
              <div class="user_area">
                <span class="nick">
                  <span class="ellip"><span class="ellip"><c:out value="${detail.writer }"/></span></span>
                  <span class="time"><c:out value="${detail.dbInsTm }"/></span>
                  <span class="no"><c:out value="${detail.num }"/></span>
                </span>
              </div>
              <!-- 글등록정보 //-->
            </div>
            <div class="file-area">
              <c:if test="${detail.fileNm != null }">
				  <a href="javascript:fn_fileDown()" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a>
			  </c:if>
              <!-- <a href="javascript:fn_fileDown()" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a> -->
              <!-- <a href="" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일2 다운로드</a>
              <a href="" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일3 다운로드</a> -->
            </div>
          </div><!-- board_box //-->
          <div class="article-body">
            <div class="article">
              <c:out value="${detail.cntn }" escapeXml="false"/>
            </div>
            
          </div><!-- .article-body /-->

        </div><!-- .article-list-area /-->
        <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center">
          <button type="button" class="btn btn-default fl" onclick="javascript:fn_movePage('<c:out value="${detail.num}"/>','Y');"><i class="fa fa-caret-left mr5"></i>이전글</button>
          <button type="button" class="btn btn-normal" onclick="location.href='/mgnoincoun/careLibraryList.do'"><i class="fa fa-align-justify mr5"></i>목록</button>
	  	  <button type="button" class="btn btn-default fr" onclick="javascript:fn_movePage('<c:out value="${detail.num}"/>','N');">다음글<i class="fa fa-caret-right ml5"></i></button>
        </div>
         
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->