<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/pagingTag.tld" prefix="pt"%>

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
	width: 150px;
	text-align: center;
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

#title {
	background-color: #DCDCDC;
	font-size: 15px;
	height: 22px;
	margin-left: 240px;
	margin-top: 120px;
}

#title1 {
	background-color: #DCDCDC;
	font-size: 15px;
	height: 22px;
}

#title2 {
	background-color: #DCDCDC;
	font-size: 15px;
	height: 22px;
	margin-left: 244px;
}

#title:HOVER {
	background-color: #DFE9F6;
}

#title1:HOVER {
	background-color: #DFE9F6;
}

#title2:HOVER {
	background-color: #DFE9F6;
}

p {
	margin-left: 12px;
	margin-top: 2px;
}

#tt {
	margin-left: 300px;
}

.demo {
	margin-left: 240px;
}
</style>


<link rel="stylesheet" href="styles/social-buttons.css">
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function  test(x){
	// var t=document.getElementById("'<%=r.getCreatetime()%>'").value;
	 var type=document.getElementById("type").value;
	 var stime=document.getElementById("s").value;
	 var tid=document.getElementById("tid").value;
	 var etime=document.getElementById("e").value;
	
     window.location.href="showreport.jsp?type="+type+"&stime="+stime+"&tid="+tid+"&etime="+etime+"&ct="+x;
 }
function  test1(x){
	// var t=document.getElementById("'<%=r.getCreatetime()%>
	'").value;
		var type = document.getElementById("type").value;
		var stime = document.getElementById("s").value;
		var tid = document.getElementById("tid").value;
		var etime = document.getElementById("e").value;

		window.location.href = "usershowInfo.jsp?type=" + type + "&stime="
				+ stime + "&tid=" + tid + "&etime=" + etime + "&ct=" + x;
	}
</script>
</head>
<body>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="leftusermenu.jsp"></jsp:include>
		<div id="title">报表查询</div>


		<form method="post" action="MMServlet">
			<div id="tt">
				<p>
					起始时间: <input type="text" id="s" class="Wdate"
						onClick="WdatePicker()" name="stime"> 终止时间: <input
						type="text" id="e" class="Wdate" onClick="WdatePicker()"
						name="etime"><br>
				</p>
				<p>
					报表: <select id="table" name="tid">
						<%
							DBImpl d1 = new DBImpl();
							List<InspectTableRecord> tlist = d1.getTable();

							Iterator l1 = tlist.iterator();
							while (l1.hasNext()) {
								r = (InspectTableRecord) l1.next();
						%>
						<option value="<%=r.getTid()%>"><%=r.getTname()%>

						</option>
						<%
							}
						%>
					</select> 格式: <select id="t" name="type">
						<option value="pdf">pdf格式</option>
						<option value="html">html格式</option>
						<option value="excel">Excel格式</option>
						<option value="word">Word格式</option>
					</select> <span style="margin-left: 10px"> <input type="submit"
						value="查询"></span>
			</div>
		</form>
		<%
			out.println("<div id='title2'>查询结果:</div>");
		%>

		<div class="demo">
			<table class="zebra">
				<thead>
					<tr>

						<th>点检表</th>
						<th>点检人员</th>
						<th>点检时间</th>
						<th colspan="2">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<%
							String s = (String) request.getAttribute("s");
							String e = (String) request.getAttribute("e");
							String t = (String) request.getAttribute("t");
							String type = (String) request.getAttribute("type");
							if (s != null && e != null && t != null && type != null) {
								int tid = Integer.parseInt(t);
								SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
								Date d11 = sf.parse(s);
								Date d2 = sf.parse(e);
								DBImpl d = new DBImpl();
								List<InspectTableRecord> l11 = d.getR(d11, d2, tid);
								Iterator it = l11.iterator();
								while (it.hasNext()) {
									r = (InspectTableRecord) it.next();
						%>
						<span><input type="hidden" id="s" value="'<%=s%>'">
							<input type="hidden" id="type" value="<%=type%>"> <input
							type="hidden" id="tid" value="<%=tid%>"> <input
							type="hidden" id="e" value="'<%=e%>'"> </span>
						<td><%=r.getTname()%></td>
						<td><%=r.getUsername()%></td>
						<td><%=r.getCreatetime()%></td>
						<td><a class="sb circle text thick-border twitter"
							onclick="test('<%=r.getCreatetime()%>')">下载</a> <a
							class="sb circle text thick-border twitter"
							onclick="test1('<%=r.getCreatetime()%>')">查看详细信息</a></td>
					</tr>
					<%
						}
						} else {
							out.println("<div id='title1'>请输入查询条件!!</div>");
						}
					%>


				</tbody>





			</table>



		</div>

	</div>
</body>
</html>