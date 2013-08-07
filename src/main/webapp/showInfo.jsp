<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="r" class="model.InspectTableRecord"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.zebra td,.zebra th {
	padding: 10px;
	border-bottom: 1px solid #f2f2f2;
}

.zebra .alternate,.zebra tbody tr:nth-child(even) {
    width:300px;
	text-align: center;
	background: #f5f5f5;
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
}

.zebra tbody tr:nth-child(odd) {
	text-align: center;
}

.zebra th {
	width: 300px; text-align : center;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
	border-bottom: 1px solid #ccc;
	background-color: #eee;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5),
		to(#eee));
	background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
	background-image: -moz-linear-gradient(top, #f5f5f5, #eee);
	background-image: -ms-linear-gradient(top, #f5f5f5, #eee);
	background-image: -o-linear-gradient(top, #f5f5f5, #eee);
	background-image: linear-gradient(top, #f5f5f5, #eee);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
		startColorstr=#f5f5f5, endColorstr=#eeeeee);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient (GradientType=0, startColorstr=#f5f5f5, endColorstr=#eeeeee)";
	text-align: center;
}

.zebra th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.zebra th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.zebra tfoot td {
	border-bottom: 0;
	border-top: 1px solid #fff;
	background-color: #f1f1f1;
}

.zebra tfoot td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.zebra tfoot td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}
</style>
</head>
<body>
	<center>
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		
		<div class="demo">
		<div>
		<%
		String ss = request.getParameter("stime");
		String ee = request.getParameter("etime");
		String tt = request.getParameter("tid");
		String type1 = request.getParameter("type");
		String ct1 = request.getParameter("ct");
		if (ss != null && ee != null && tt != null && type1 != null) {
			int tid1 = Integer.parseInt(tt);
			SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
			Date cretime1 = sf1.parse(ct1);
			DBImpl d1 = new DBImpl();
			r=d1.getT(tid1, cretime1);
			
		%>
		<div><%=r.getTname() %><div>
		<div style="margin-top: 10px"><span style="width: 150px;float: left;margin-left: 300px">门机编号:_______</span><span>点检人员:<%=r.getUsername() %></span><span style="float: right; margin-right: 200px">点检时间:<%=r.getCreatetime() %></span></div></div>
		<%
		}else{
			System.out.println("error");
		}
		%>
		</div>
		</div>
		</div>
		<div class="demo">
			<table class="zebra">
				<thead>
					<tr>
					    <th>机构</th>
						<th>点检项</th>
						<th>点检结果</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<%
							String s = request.getParameter("stime");
							String e = request.getParameter("etime");
							String t = request.getParameter("tid");
							String type = request.getParameter("type");
							String ct = request.getParameter("ct");
							if (s != null && e != null && t != null && type != null) {
								int tid = Integer.parseInt(t);
								SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
								Date cretime = sf.parse(ct);
								DBImpl d = new DBImpl();
								List<InspectTableRecord> l = d.getInfo(tid, cretime);
								Iterator it = l.iterator();
								while (it.hasNext()) {
									r = (InspectTableRecord) it.next();
						%>


						
						<td><%=r.getTagname()%></td>
						<td><%=r.getItemname()%></td>
						<td><%=r.getTvalue()%></td>
						


					</tr>
					<%
						}
						} else {
							System.out.println("出错了!");
						}
					%>
				</tbody>
			</table>
		</div>
	</center>
</body>
</html>