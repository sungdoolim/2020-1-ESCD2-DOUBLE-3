<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/customize.css">
<link rel="stylesheet" href="resources/css/template.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script>

</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

blockquote{
background:#f9f9f9;
border-left:10px solid #cccccc;
margin: 1.5em 10px;
padding: 0.5em 10px;
quotes: "\201C""\201D""\2018""\2019"
}
blockquote:before{
color:#cccccc;
content:open-quote;
font-size:3em;
line-height:0.1em;
margin-left:0.25em;
vertical-align:-0.4em;
}
blockquote:after{
color:#cccccc;
content:close-quote;
font-size:3em;
line-height:0.1em;
margin-left:0.25em;
vertical-align:-0.4em;
}


</style>
</head>

<body class="body">

<%@include file="../template/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-xs-12">
		<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-tags"></span>
				&nbsp;&nbsp;�л� ȸ�� ����
				
			</h3>
		</div>
	
		<table class="table">
			<thead>
			  <tr>
  				<td colspan="5" align="right"> �� ���� ��� : <b>${totalCount }</b>��
  			</tr>
			<tr>
			<th>�й�</th>	<th>��ȭ��ȣ</th>	<th>�̸�</th>	<th>����</th><th>����</th>
			</tr>
			</thead>
			<tbody>
	  <c:if test="${!empty alluser }">
	  
   <c:forEach var= "list" items="${alluser }">
<form action="chmod" method="post">
   <tr>  
    <th>${list.getSid() }<input type="hidden" name="Sid" value="${list.getSid() }"></th>
    <th>${list.getSnum() }<input type="hidden" name="Snum" value="${list.getSnum() }"></th>
    <th>${list.getSname() }<input type="hidden" name="Sname" value="${list.getSname() }"></th>
    <th>${list.getSmajor() }<input type="hidden" name="Smajor" value="${list.getSmajor() }"></th>
    <th><input type="text" name="Siscouncil" placeholder="${list.getSiscouncil() }"><input type="submit"></th>
  </tr> 
  </form>
  </c:forEach>
  </c:if>
  
    <c:if test="${empty alluser }">
  <tr>   <th colspan="5">�Խ��� ����� �����ϴ�!</th></tr></c:if>
			</tbody>
	
		</table>
			<div class="panel-footer"><form action="blockchain" method="post">
					<blockquote><input type="submit" value="���Ἲ �˻�" name="verify"></blockquote>
					</form>
			</div>
		
		</div></div>
	</div>
</div>

<div id="footer">
<%@include file="../template/footer.jsp"%></div>
</body>
</html>