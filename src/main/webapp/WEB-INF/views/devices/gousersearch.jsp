<%@page import="java.text.SimpleDateFormat"%>
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
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>

</head>
<body>
<center>

<h1>报表查询</h1>
<hr>
<form  method="post" action="MMServlet">

起始时间:

<input type="text" id="s" class="Wdate" onClick="WdatePicker()" name="stime">
终止时间:
<input type="text" id="e" class="Wdate" onClick="WdatePicker()" name="etime"><br>
<hr>

报表:
<select id="table" name="tid">
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
<select id="t" name="type">
<option value="pdf">pdf格式</option>
<option value="html">html格式</option>
<option value="excel">Excel格式</option>
<option value="word">Word格式</option>
</select>

<input type="submit" value="查询">
</form>
</center>
<hr>
<center>




</center>

</body>
</html>