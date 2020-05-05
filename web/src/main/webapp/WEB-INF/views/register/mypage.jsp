<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<td>${Sid }</td></tr>
	<tr>
	<td>${Sname }</td>
	</tr><tr><td>${Snum }</td>
	</tr><tr><td>${Sgrade }</td>
	</tr><tr><td>${Smajor }</td>
	</tr><tr><td>${Siscouncil }</td>
</tr>

</table>

<c:if test="${Siscouncil>1}">



<div class="container">
	<div class="row">
		<div class="col-xs-12">
		<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-tags"></span>
				&nbsp;&nbsp;학생 회비 내역 사용 요청 내역
			</h3>
		</div>
	
		<table class="table">
			<thead>
			  <tr>
  				<td colspan="5" align="right"> 총 내역 목록 : <b>${totalCount }</b>개
  			</tr>
			<tr>
			<th>날짜</th>	<th>잔액</th>	<th>사용자</th>	<th>사용 금액</th><th>내역</th><th>파일</th>
			</tr>
			</thead>
			<tbody>
	  <c:if test="${!empty bl }">

   <c:forEach var= "list" items="${bl }">
 
    <form name="uploadForm" method="post" action="purchase_ok" enctype="multipart/form-data">
   <tr>
    <th>${list.getBdate() }</th><input type="hidden" value="${list.getBdate()}" name="Bdate">
    <th>${list.getBrest() }</th><input type="hidden" value="${list.getBrest()}" name="Brest">
    <th>${list.getBuser() }</th><input type="hidden" value="${list.getBuser()}" name="Buser">
    <th>${list.getBinout() }</th><input type="hidden" value="${list.getBinout()}" name="Binout">
    <th>${list.getBmemo() }</th><input type="hidden" value="${list.getBmemo()}" name="Bmemo">
    <th>${list.getFname() }</th>
    <th>
    <input type="file" name="imgFile">


  </th>
    <th><input type="password" name="Bpw"></th>
    <th><input type="submit" value="승인"></th><th><button onclick="location=''">기각</button></th>
  </tr>  </form></c:forEach>
</c:if>
  
    <c:if test="${empty bl }">
  <tr>
   <th colspan="5">게시판 목록이 없습니다!</th></tr></c:if>
			</tbody>
	<center><tr>
   		<th colspan="5">
   			<c:if test="${page<=1 }">
   				[이전]&nbsp;
   			</c:if>
   			<c:if test="${page>1 }">
   				<a href="/web/blistall?page=${page-1 }">[이전]</a>&nbsp;
   			</c:if>
   			
   			<%--현재쪽 번호 출력 --%>
   			<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
   				<c:if test="${a==page }"><%--현재 쪽번호가 선택된 경우는 링크 없어도됨 --%>
   					 <${a }>
   				</c:if>
   				<c:if test="${a!=page}">
   					<a href="/web/blistall?page=${a }">[${a }]</a>&nbsp;
   					
   				</c:if>
   			</c:forEach>
   			<c:if test="${page>=endpage }"><!-- maxpage =>endpage로바꾸면..? -->
   			[다음]
   			</c:if>
   			<c:if test="${page<endpage }">
   			<a href="/web/blistall?page=${page+1 }">[다음]</a>
   			</c:if>
   			
   		</th>
   </tr></center>
		</table>
			<div class="panel-footer">
					<blockquote>반갑네</blockquote>
			</div>
		
		</div></div>
	</div>
</div>





</c:if>



</body>
</html>