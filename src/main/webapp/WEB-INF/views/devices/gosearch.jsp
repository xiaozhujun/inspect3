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
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

function test(){
	var t=document.getElementById("t").value; //格式
	var stime=document.getElementById("s").value;
	var etime=document.getElementById("e").value;
	var tid=document.getElementById("table").value;
	alert(t);
	alert(stime);
	alert(etime);
	alert(tid);
	 switch(t.charAt(0)){
	case "p":
		window.location.href="/WEB-INF/views/devices/queryresult.jsp?type=pdf&stime="+stime+"&tid="+tid+"&etime="+etime;
		break;
	case "h":
		window.location.href="/WEB-INF/views/devices/queryresult.jsp?type=html&stime="+stime+"&tid="+tid+"&etime="+etime;
		break;
	case "e":
		window.location.href="/WEB-INF/views/devices/queryresult.jsp?type=excel&stime="+stime+"&tid="+tid+"&etime="+etime;
		break;
	case "w":
		window.location.href="/WEB-INF/views/devices/queryresult.jsp?type=word&stime="+stime+"&tid="+tid+"&etime="+etime;
		break;
	} 
	
}



</script>
</head>
<body>
<center>

<h1>报表查询</h1>
<hr>

起始时间:

<input type="text" id="s" class="Wdate" onClick="WdatePicker()">
终止时间:
<input type="text" id="e" class="Wdate" onClick="WdatePicker()"><br>
<hr>

报表:
<select id="table">
<%
    DBImpl d1=new DBImpl();
    List<InspectTableRecord> tlist=d1.getTable();
   
    Iterator l1=tlist.iterator();
	while(l1.hasNext()){
		 r=(InspectTableRecord)l1.next();
		%>
		 <option value="<%=r.getTid() %>"><%=r.getTname() %>
		 
		 </option>
	<% }
    
%>
</select>
格式:
<select id="t">
<option value="pdf">pdf格式</option>
<option value="html">html格式</option>
<option value="excel">Excel格式</option>
<option value="word">Word格式</option>
</select>

<input type="button" value="查询" onclick="test()">

</center>
<hr>
</body>
</html>