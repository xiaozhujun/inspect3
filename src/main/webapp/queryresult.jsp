
<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="r" class="model.InspectTableRecord"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 function  test(x){
	// var t=document.getElementById("'<%=r.getCreatetime() %>'").value;
	 var type=document.getElementById("type").value;
	 var stime=document.getElementById("s").value;
	 var tid=document.getElementById("tid").value;
	 var etime=document.getElementById("e").value;
	 alert(x);
	 alert(type);
	 alert(stime);
	 alert(tid);
	 alert(etime);
     window.location.href="showreport.jsp?type="+type+"&stime="+stime+"&tid="+tid+"&etime="+etime+"&ct="+x;
 }

</script>
</head>
<body>
<table border="1">
<thead>
<tr>
<th></th>
<th>点检表</th>
<th>点检人员</th>
<th>点检时间</th>
<th>操作</th>
</tr>
</thead>
<tbody>
<tr>
<%
  String s=request.getParameter("stime");
  String e=request.getParameter("etime");
  String t=request.getParameter("tid");
  String type=request.getParameter("type");
  int tid=Integer.parseInt(t);
  SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
  Date d1=sf.parse(s);
  Date d2=sf.parse(e);
  DBImpl d=new DBImpl();
  List<InspectTableRecord> l1=d.getR(d1, d2, tid);
  Iterator it=l1.iterator();
  while(it.hasNext()){
	  r=(InspectTableRecord)it.next();
	  
	  %>
	  <td><input type="hidden" id="s" value="<%=s%>">
      <input type="hidden" id="type" value="<%=type%>">
      <input type="hidden" id="tid" value="<%=tid %>">
      <input type="hidden" id="e" value="<%=e %>">
     
	  <td><%=r.getTname() %></td>
	  <td><%=r.getUsername() %></td>
	  <td><%=r.getCreatetime() %></td>
	  <td><input type="button" onclick="test('<%=r.getCreatetime() %>')" value="下载"></td></tr>
	  <%
  }
%>


</tbody>





</table>

</body>
</html>