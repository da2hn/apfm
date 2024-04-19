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
    <title>알려드려요&amp;자유게시판</title>
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
  
  	function fn_detail(num){
		document.location.href = "/mgnoincoun/careLibraryView.do?num="+num;
	}
  	
  	function fn_fileDown(fileNm,filePath,sysFileNm) {
  		if(fileNm == "") {
  			alert("등록하신 첨부파일이 없습니다.");
  		} else {
	        document.location.href = "/gnoincoundb/fileDown.do?sysFileNm="+sysFileNm+"&filePath="+filePath+"&fileNm="+fileNm;  			
  		}
  	}
  	
  	function fn_fileDown(fileNm,filePath,sysFileNm) {
  		if(fileNm == "") {
  			alert("등록하신 첨부파일이 없습니다");
  		}
  		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown2.do";
       	document.downForm.submit();
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
        <div class="article-list-area">
          <ul class="list_area">
          	 <c:if test="${crLibraryList.size() == 0 }">
          		<li class="board_box">
	              <a href="#" class="txt_area">
	                <!-- 새글알림 -->
	                <span class="icon_new_txt">
	                  <span>•</span>
	                </span>
	                <!-- 새글알림 //-->
	                <!-- 제목 -->
	                <strong class="tit">등록된 글이 없습니다.</strong>
	                <!-- 제목 //-->
	                <!-- 글등록정보 -->
	                <div class="user_area">
	                  <span class="nick">
	                    <span class="ellip"><span class="ellip"></span></span>
	                    <span class="time"></span>
	                    <span class="no"></span>
	                  </span>
	                </div>
	                <!-- 글등록정보 //-->
	              </a>
	            </li>
          	 </c:if>
            <!-- loop -->
            <c:forEach var="result" items="${crLibraryList}" varStatus="status">
	            <li class="board_box">
	              <a href="#" onclick="javascript:fn_detail('<c:out value="${result.num}"/>');" class="txt_area">
	                <!-- 새글알림 -->
	                <span class="icon_new_txt">
	                  <span>•</span>
	                </span>
	                <!-- 새글알림 //-->
	                <!-- 제목 -->
	                <strong class="tit"><c:out value="${result.title}"/></strong>
	                <!-- 제목 //-->
	                <!-- 글등록정보 -->
	                <div class="user_area">
	                  <span class="nick">
	                    <span class="ellip"><span class="ellip"><c:out value="${result.writer}"/></span></span>
	                    <span class="time"><c:out value="${result.dbInsTm}"/></span>
	                    <span class="no"><c:out value="${result.num}"/></span>
	                  </span>
	                </div>
	                <!-- 글등록정보 //-->
	              </a>
	              <div class="file-area">
             		<c:if test="${result.fileNm != null }">
             			<a href="javascript:fn_fileDown('<c:out value="${result.fileNm}"/>','<c:out value="${result.filePath}"/>','<c:out value="${result.sysFileNm}"/>')" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a>  
				  	</c:if>	  
				  	<%-- <a href="javascript:fn_fileDown('<c:out value="${result.fileNm}"/>','<c:out value="${result.filePath}"/>','<c:out value="${result.sysFileNm}"/>')" class="btn btn-default btn-sm mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a> --%>            
	                <!-- <a href="" class="btn btn-default btn-sm"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a> -->
	              </div>
	            </li>
            </c:forEach>
            <!-- loop //-->
          </ul><!-- .list_area -->
        </div><!-- .article-list-area -->
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->