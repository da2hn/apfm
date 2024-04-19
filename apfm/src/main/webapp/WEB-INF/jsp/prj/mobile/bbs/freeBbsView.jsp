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
    <title>알려드려요&amp;자유게시판</title>
    <!-- Bootstrap core CSS -->
    <script src="/mgnoincoun/js/jquery-1.11.2.min.js"></script>
    <script src="/mgnoincoun/assets/js/jquery.min.js"></script>
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
    <script src="/mgnoincoun/editor/js/summernote_0.8.3.js"></script>
	<script src="/mgnoincoun/editor/js/summernote_0.8.3.min.js"></script>
	<script src="/mgnoincoun/editor/lang/summernote-ko-KR.js"></script>
	<script src="/mgnoincoun/editor/js/bootstrap_3.3.5.js"></script>
	<link rel="stylesheet" href="/mgnoincoun/editor/css/summernote_0.8.3.css">
  </head>
  <script>
  	$(document).ready(function() {
 	   $('#rcontent').summernote({
	        minHeight: 400,
	        maxHeight: null,
	        lang : 'ko-KR',
	        disableDragAndDrop: true        
	   });
	});
  	
  	function fn_fileDown(sysFileNm, filePath, fileNm){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown2.do";
       	document.downForm.submit();
	}
  	
  	function fn_movePage(num,prevYn) {
  		var save = "${save}";
  		document.location.href = "/mgnoincoun/freeBbsView.do?num="+num+"&prevYn="+prevYn+"&save="+save;
  	}
  </script>
  <style>
  	textarea{border:1px solid #ccc;border-right:1px solid #a5a5a5;border-bottom:1px solid #a5a5a5;border-top:1px solid #ddd !important;width:100%;padding:5px;background:#f9f9f9;min-height:100px;}
  	@media (min-width:300px) {.note-editable img {max-width:250px;}}@media (min-width:350px) {.note-editable img {max-width:300px;}}@media (min-width:400px) {.note-editable img {max-width:350px;}}@media (min-width:450px) {.note-editable img {max-width:400px;}}@media (min-width:500px) {.note-editable img {max-width:450px;}}@media (min-width:550px) {.note-editable img {max-width:500px;}}@media (min-width:600px) {.note-editable img {max-width:550px;}}@media (min-width:650px) {.note-editable img {max-width:600px;}}@media (min-width:700px) {.note-editable img {max-width:650px;}}@media (min-width:750px) {.note-editable img {max-width:700px;}}@media (min-width:800px) {.note-editable img {max-width:750px;}}@media (min-width:850px) {.note-editable img {max-width:800px;}}@media (min-width:900px) {.note-editable img {max-width:850px;}}
	@media (min-width: 1000px) {.note-editable img {max-width:2000px; }}
  </style>
  <body>
    <!-- 헤더 ================================================== -->
     
    <form name="downForm" id="downForm" method="get" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	
    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>문서자료실&amp;자유게시판</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">문서자료실&amp;자유게시판</li>
        </ol>
      </div>
      <div class="content-area">
        <div class="article-area">
          <div class="board_box article-header" >
            <div class="txt_area">   
              <!-- 제목 -->
              <strong class="tit"><c:out value="${detail.title }" escapeXml="false"/></strong>
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
              <c:forEach var="row" items="${file}" varStatus="var">
              	  <p>${row.fileNm} &nbsp; <a href="javascript:fn_fileDown('<c:out value="${row.sysFileNm}"/>','<c:out value="${row.filePath}"/>','<c:out value="${row.fileNm}"/>')"  class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a></p>
              </c:forEach>
              <!-- <a href="" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일2 다운로드</a>
              <a href="" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일3 다운로드</a> -->
            </div>
          </div><!-- board_box //-->
          <div class="article-body">
            <div class="article">
            	<textarea id="rcontent" name="cntn" readonly="readonly">
	              <c:out value="${detail.cntn }" escapeXml="false"/>
                </textarea>
            </div>
          </div><!-- .article-body /-->
            
        </div><!-- .article-list-area /-->
        <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center">
          <button type="button" class="btn btn-default fl" onclick="javascript:fn_movePage('<c:out value="${detail.num}"/>','Y');"><i class="fa fa-caret-left mr5"></i>이전글</button>
          <button type="button" class="btn btn-normal" onclick="location.href='/mgnoincoun/freeBbsList.do'"><i class="fa fa-align-justify mr5"></i>목록</button>
	  	  <button type="button" class="btn btn-default fr" onclick="javascript:fn_movePage('<c:out value="${detail.num}"/>','N');">다음글<i class="fa fa-caret-right ml5"></i></button>
	  	</div>
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
 