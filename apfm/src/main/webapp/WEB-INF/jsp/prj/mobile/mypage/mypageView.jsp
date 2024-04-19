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
    <title>마이 페이지</title>
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
	  });
	  
	  function fn_mypageDtl(caseNo) {
		  document.location.href = "/mgnoincoun/mypageDtl.do?caseNo="+caseNo;
	  }
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
        <!-- <a class="btn btn-default btn-xs" href="sub04_2.html" role="tab">상담신청내역 상세</a> -->
      </div>
      <h2 class="title">최근 상담내역</h2>
      <div class="table-wrap">
        <table  class="table table-condensed">
          <col width="100px" />
          <col />
          <tbody>
          	<c:if test="${recCns.size() == 0 }">
				<tr>
					<td colspan="2"><strong>상담 내역이 없습니다.</strong></td>
				</tr>
			</c:if>
			<c:if test="${recCns.size() > 0 }">
	            <tr>
	              <th scope="row">상담센터</th>
	              <td><strong><c:out value="${recCns.centerNm }"/></strong></td>
	            </tr>
	            <tr>
	              <th scope="row">상담구분</th>
	              <td>
	              	<c:out value="${recCns.cnsGbNm }"/>
		          </td>
	            </tr>
	            <tr>
	              <th scope="row">이름</th>
	              <td><c:out value="${recCns.cnsleNm }"/></td>
	            </tr>
	            <tr>
	              <th scope="row">신청일자</th>
	              <td><c:out value="${fn:substring(recCns.writeDt,0,4) }"/>-<c:out value="${fn:substring(recCns.writeDt,4,6) }"/>-<c:out value="${fn:substring(recCns.writeDt,6,8) }"/></td>
	            </tr>
	            <tr>
	              <th scope="row">상담상태</th>
	              <td>
	              	<c:out value="${recCns.cnsStatNm }"/>
				  </td>
	            </tr>
	            <tr>
	              <th scope="row" rowspan="2">다음예약일자</th>
	              <td class=""><c:out value="${fn:substring(recCns.cnsRsvtDt,0,4) }"/>-<c:out value="${fn:substring(recCns.cnsRsvtDt,5,7) }"/>-<c:out value="${fn:substring(recCns.cnsRsvtDt,8,10) }"/> <c:out value="${recCns.cnsRsvtStrtHour }"/>시 <c:out value="${recCns.cnsRsvtStrtMin }"/>분</td>
	            </tr>
	            <!-- <tr>
	              <td class=""><button type="button" class="btn btn-normal btn-xs">예약변경하기</button>
	              	<input type="text" id="datepicker1" />
	              </td>
	            </tr> -->
	            <tr>
	              <td scope="row" colspan="2"><button type="button" onclick="javascript:fn_mypageDtl('${recCns.caseNo}')" class="btn btn-primary btn-xs fr">상세보기<i class="fa fa-caret-right cw ml5"></i></button></td>
	            </tr>
            </c:if>
          </tbody>
        </table>
      </div>
      <h2 class="title">상담이력</h2>
      <c:if test="${cnsHisList.size() == 0 }">
      	<div class="table-wrap">
	        <table  class="table table-condensed">
	          <col width="80px" />
	          <col />
	          <tbody>
	            <tr>
	              <td colspan="2"><strong>상담이력이 없습니다.</strong></td>
	            </tr>
	          </tbody>
	        </table>
	      </div>
      </c:if>
      <c:if test="${cnsHisList.size() > 0 }">
	      <c:forEach items="${cnsHisList }" var="list">
		      <div class="table-wrap">
		        <table  class="table table-condensed">
		          <col width="80px" />
		          <col />
		          <tbody>
		            <tr>
		              <th scope="row">상담센터</th>
		              <td><strong><c:out value="${list.centerNm }" /></strong></td>
		            </tr>
		            <tr>
		              <th scope="row">상담구분</th>
		              <td>
		              	<c:out value="${list.cnsGbNm }" />
		              </td>
		            </tr>
		            <tr>
		              <th scope="row">이름</th>
		              <td><c:out value="${list.cnsleNm }" /></td>
		            </tr>
		            <tr>
		              <th scope="row">신청일자</th>
		              <td><c:out value="${fn:substring(list.writeDt,0,4) }"/>-<c:out value="${fn:substring(list.writeDt,4,6) }"/>-<c:out value="${fn:substring(list.writeDt,6,8) }"/></td>
		            </tr>
		            <tr>
		              <th scope="row">종결일자</th>
		              <td><c:out value="${list.cnsEndDt }" /></td>
		            </tr>
		            <tr>
		              <th scope="row">상담상태</th>
		              <td>
		              	<c:out value="${list.cnsStatNm }" />
		              </td>
		            </tr>
		            <tr>
		              <td scope="row" colspan="2"><button type="button" onclick="javascript:fn_mypageDtl('<c:out value="${list.caseNo}"/>')" class="btn btn-link btn-xs fr">상세보기<i class="fa fa-caret-right ml5"></i></button></td>
		            </tr>
		          </tbody>
		        </table>
		      </div>
	      </c:forEach>
      </c:if>
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->