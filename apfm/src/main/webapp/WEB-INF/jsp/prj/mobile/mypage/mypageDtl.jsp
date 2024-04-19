<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>마이 페이지 상세보기</title>
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
		  
			var msg = "${msg}";
			if(msg.length > 0) {
				alert(msg);
				document.location.href = "/mgnoincoun/login.do";
			}
		  
		  var gender = "${detail.gender}";
		  if(gender=="M") {
			  $("#gender").text("남자");
		  } else if(gender=="F") {
			  $("#gender").text("여자");
		  }
		 
	  });
  </script>
  <body>
    <!-- 헤더 ================================================== -->

    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>마이 페이지</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">마이 페이지</li>
        </ol>
      </div>
      <div class="btn-wrap"><!-- 임시링크  -->
        <a class="btn btn-default btn-xs" href="/mgnoincoun/cnsAskList.do" role="tab">상담문의</a>
        <!-- <a class="btn btn-normal btn-xs" href="sub04_2.html" role="tab">상담신청내역 상세</a> -->
      </div>
      <h2 class="title">상담신청내역 상세</h2>
      <h3 class="title">상담신청내역</h3>
      <div class="table-wrap">
        <table class="table table-condensed">
          <col width="100px" />
          <col />
          <tbody>
            <tr>
              <th scope="row">상담센터</th>
              <td><strong><c:out value="${detail.centerNm }" /></strong></td>
            </tr>
            <tr>
              <th scope="row">상담구분</th>
              <td>
              	<c:out value="${detail.cnsGbNm }" />
              </td>
            </tr>
            <tr>
              <th scope="row">이름</th>
              <td>
              	<c:out value="${fn:substring(detail.cnsleNm,0,1) }" />
              	*
              	<c:out value="${fn:substring(detail.cnsleNm,2,8) }" />
              </td>
            </tr>
            <tr>
                <th scope="row">성별</th>
                <td><span id="gender"></span></td>
              </tr>
              <tr>
                <th scope="row">생년월일</th>
                <td>
                	<c:out value="${fn:substring(detail.birthDt,0,2) }" />**
                	<c:out value="${fn:substring(detail.birthDt,4,6) }" />**
                </td>
              </tr>
              <tr>
                <th scope="row">이메일</th>
                <td>
                	<c:out value="${fn:substring(detail.email,0,4) }" />
                	<c:forEach begin="5" end="${fn:length(detail.email) }" step="1">
                	*
                	</c:forEach>
                </td>
              </tr>
              <tr>
                <th scope="row" >전화번호</th>
                <td>
                	<c:out value="${fn:substring(detail.mobile,0,3) }" />****
                	<c:out value="${fn:substring(detail.mobile,7,13) }" />
                </td>
              </tr>
              <th scope="row">신청일자</th>
              <td><c:out value="${fn:substring(detail.writeDt,0,4) }"/>-<c:out value="${fn:substring(detail.writeDt,4,6) }"/>-<c:out value="${fn:substring(detail.writeDt,6,8) }"/></td>
            </tr>
            <tr>
              <th scope="row" rowspan="2">다음예약일자</th>
              <td class=""><c:out value="${fn:substring(detail.cnsRsvtDt,0,4) }"/>-<c:out value="${fn:substring(detail.cnsRsvtDt,5,7) }"/>-<c:out value="${fn:substring(detail.cnsRsvtDt,8,10) }"/> <c:out value="${detail.cnsRsvtStrtHour }" />시 <c:out value="${detail.cnsRsvtStrtMin }" />분</td>
            </tr>
            <!-- <tr>
              <td class=""><button type="button" class="btn btn-normal btn-xs">예약변경하기</button></td>
            </tr> -->
            <tr>
              <th scope="row">상담상태</th>
              <td>
              	<c:out value="${detail.cnsStatNm }" />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btn-wrap line bt bb pt10 pb10">
        <button type="button" class="btn btn-default" onclick="location.href='/mgnoincoun/'">홈</button>
        <button type="button" class="fr btn btn-normal" onclick="location.href='/mgnoincoun/mypageView.do'">마이페이지</button>
      </div>
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->