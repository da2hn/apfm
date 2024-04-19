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
    <title>DUKE-AD</title>
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
		  $('input:radio[name=gender]:input[value="${map.gender}"]').attr("checked", true);
		  $("#cnsleNm").val("${map.userNm}");
		  $("#telNo").val("${map.mobile}");
		  
		  let today = new Date();
		  var year = today.getFullYear(); // 년도
		  var month = today.getMonth()+1;  // 월
		  var date = today.getDate();  // 날짜
		  var nowDate = year+"."+month+"."+date;
		  $("#writeDt").val(nowDate);
	  });

	  function fn_reg() {
		  
		  var arr = [];
		  for(i=1; i<8; i++) {
			  arr[i] = $('input[name="no'+i+'"]:checked').val();
			  
			  if (arr[i] == undefined) {
				  alert(i+"번 내용을 입력해주세요");
				  return false;
			  }
		  }
		  
		  var total = 0;
		  var sumCnt = $("#sumCnt").val();
		  if(sumCnt != "") {
			  if(confirm("자가진단을 다시 하시겠습니까?")){
				  location.href="/mgnoincoun/psyDukeDoc.do";
				  return false;
			  }
			  return false;
		  }
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    for(i=1; i<8; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   	   	
		   		total = total+parseInt(no);
		    }
			$("#sumCnt").val(total);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/mgnoincoun/psyDukeDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("DUKE-AD 심리검사 결과 점수는"+total+"점 입니다.");
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		}
	  
  </script>
  <body>
    <!-- 헤더 ================================================== -->

    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title" style="text-align: center;">DUKE-AD</h1>
        <br/>
        <h1 class="title" style="text-align: center;">(Duke Anxiety-Depression Scale)</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">간편한 심리검사</li>
        </ol>
      </div>
      
      <form id="frm" name="frm" method="post">
      <input type="hidden" id="cnsleId" name="cnsleId" value="${map.userId }" >
      <div class="table-wrap">
      		<table class="table table-condensed">
                <caption>DUKE-AD</caption>
                <colgroup>
                	<col width="50px"/>
          			<col width="100px"/>
          			<col width="70px"/>
          			<col width="120px"/>
          			<col width="60px"/>
          			<col width="100px"/>
                    <%-- <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" /> --%>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">이&nbsp;&nbsp;름</th>
                        <td style="width: 100px;">
                            <input type="text" id="cnsleNm" name="cnsleNm" style="width: 100px;" readonly="readonly">
                        </td>
                        <th scope="col">성별</th>
                        <td>
                            <label for="gender1" style="margin-right: 10px;">남</label><input type="radio" id="gender1" name="gender" value="M" style="margin-bottom: 5px;" /> /
                            <label for="gender2" style="margin-right: 10px;">여</label><input type="radio" id="gender2" name="gender" value="F" style="margin-bottom: 5px;" />
                        </td>
                        <th scope="col">검사일</th>
                        <td>
                            <input type="text" id="writeDt" name="writeDt" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">나&nbsp;&nbsp;이</th>
                        <td>
                            <input type="text" id="age" name="age" style="width: 100px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" readonly="readonly" value="${map.age }">
                        </td>
                        <th scope="col">연 락 처</th>
                        <td colspan="3">
                            <input type="text" id="telNo" name="telNo" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
                ※ 다음은 당신의 건강과 느낌에 대한 질문입니다. 각 문항을 자세히 읽고 당신이 느끼는 가장 적합한 곳에 ‘√’표 해 주십시오.<br>
                다음 문항에 맞거나 틀린 답은 없습니다.
            </div>
            <table class="table table-condensed">
                <caption>DUKE-AD</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">매우 그렇다</th>
                        <th scope="col">보통이다 </th>
                        <th scope="col" class="bRight-none">매우 아니다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">나는 쉽게 포기한다.</td>
                        <td><input type="radio" id="no11" name="no1" value="2" /></td>
                        <td><input type="radio" id="no12" name="no1" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no13" name="no1" value="0" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">나는 집중하는 것이 어렵다.</td>
                        <td><input type="radio" id="no21" name="no2" value="2" /></td>
                        <td><input type="radio" id="no22" name="no2" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no23" name="no2" value="0" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">나는 사람들이 주변에 있는 것이 편안하다.</td>
                        <td><input type="radio" id="no31" name="no3" value="2" /></td>
                        <td><input type="radio" id="no32" name="no3" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no33" name="no3" value="0" /></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>DUKE-AD</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2" class="txt-left">&nbsp;&nbsp;지난 <span class="txt-Under">일주일 동안</span></th>
                        <th scope="col">매우 그렇다</th>
                        <th scope="col">보통이다 </th>
                        <th scope="col" class="bRight-none">매우 아니다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">잠을 자는 것이 어렵다.</td>
                        <td><input type="radio" id="no41" name="no4" value="2" /></td>
                        <td><input type="radio" id="no42" name="no4" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no43" name="no4" value="0" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">쉽게 피로해진다.</td>
                        <td><input type="radio" id="no51" name="no5" value="2" /></td>
                        <td><input type="radio" id="no52" name="no5" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no53" name="no5" value="0" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">슬프거나 우울한 기분이 든다.</td>
                        <td><input type="radio" id="no61" name="no6" value="2" /></td>
                        <td><input type="radio" id="no62" name="no6" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no63" name="no6" value="0" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">불안한 기분이 든다.</td>
                        <td><input type="radio" id="no71" name="no7" value="2" /></td>
                        <td><input type="radio" id="no72" name="no7" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no73" name="no7" value="0" /></td>
                    </tr>
                </tbody>
            </table>
      	</div>
      </form>
      <div class="btn-wrap line pb20">
        <button type="button" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_reg();">자가진단하기</button>
        <button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="location.href='/mgnoincoun/psyCnsList.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button>
      </div>
      <div style="height: 50px;">
           <div class="total fr mt15">
               <div style="float: left; line-height: 30px; margin-right: 10px;">
                   총 점
               </div>
               <div style="float: left;">
                   <input type="text" class="inp num2" id="sumCnt" name="sumCnt" readonly="readonly" style="border:1px solid black; margin-top: 5px; width: 60px;">
          	 	</div>
           </div>
      </div>
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->