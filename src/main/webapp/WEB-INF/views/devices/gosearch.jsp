<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="r" class="model.InspectTableRecord"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function test(){
	var t=document.getElementById("t").value;
	var time=document.getElementById("time").value;
	switch(t.charAt(0)){
	case "p":
		window.location.href="showreport.jsp?type=pdf&time="+time;
		break;
	case "h":
		window.location.href="showreport.jsp?type=html&time="+time;
		break;
	case "e":
		window.location.href="showreport.jsp?type=excel&time="+time;
		break;
	case "w":
		window.location.href="showreport.jsp?type=word&time="+time;
		break;
	}
	
}



</script>
</head>
<body>

<form action="" method="post">
<select id="t">
<option value="pdf">pdf格式</option>
<option value="html">html格式</option>
<option value="excel">Excel格式</option>
<option value="word">Word格式</option>
</select>
<select id="time">

<%
    DBImpl d=new DBImpl();
    List<InspectTableRecord> dlist=d.getTim();
   
    Iterator l=dlist.iterator();
	while(l.hasNext()){
		 r=(InspectTableRecord)l.next();
		%>
		 <option value="<%=r.getCreatetime() %>"><%=r.getCreatetime() %>
		 
		 </option>
	<% }
    
%>







</select>
<input type="button" value="提交" onclick="test()">
</form>

</body>
</html>