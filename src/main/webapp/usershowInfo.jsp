<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="/WEB-INF/pagingTag.tld" prefix="pt"%>
<jsp:useBean id="r" class="model.InspectTableRecord"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles/social-buttons.css">
<script type="text/javascript">
function  test1(){
	
     var x=document.getElementById("c").value;

     var type=document.getElementById("type").value;
	 var stime=document.getElementById("s").value;
	 var tid=document.getElementById("tid").value;
	 var etime=document.getElementById("e").value;
	
	 window.location.href="showreport.jsp?type="+type+"&stime="+stime+"&tid="+tid+"&etime="+etime+"&ct="+x;
 }

</script>
<style type="text/css">
.demo{

width:1129px;
height: 1200px;
margin-left: 221px;
margin-top: 50px;

}

</style>
</head>
<body>
	<div id="wrapper">
		
		<jsp:include page="nav.jsp"></jsp:include>
		 <jsp:include page="leftusermenu.jsp"></jsp:include>
		 <div class="demo">
		
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
		<div ><center><font size="5"><%=r.getTname() %></font></center></div>
		<div style="margin-left: 800px;"><span><a class="sb circle text thick-border twitter"
							onclick="test1()">下载</a></span></div>
		<span style="width: 150px;float: left;margin-left: 180px;">门机编号:_______</span><span>点检人员:<%=r.getUsername() %></span><span style="float: right; margin-right: 240px">点检时间:<%=r.getCreatetime() %></span>
		<%
		}else{
			System.out.println("error");
		}
		%>
	
		
			<center><table  border="1"  style="border-collapse:collapse;margin-left: 20px">
				<thead>
					<tr>
					    <th width="150px">机构</th>
						<th width="350px">点检项</th>
						<th width="350px">点检结果</th>
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
								List<InspectTableRecord> l = d.getTag(tid,cretime);
								Iterator it = l.iterator();
								while (it.hasNext()) {
									r = (InspectTableRecord) it.next();
									List<InspectTableRecord> l1 = d.getT(r.getTagid(), tid, cretime);
						%>

                         <span><input type="hidden" id="s" value="'<%=s%>'">
							<input type="hidden" id="type" value="<%=type%>"> <input
							type="hidden" id="tid" value="<%=tid%>"> <input
							type="hidden" id="e" value="'<%=e%>'"> <input type="hidden" id="c" value="<%=ct%>"></span>
						
						<td align="center" rowspan="<%=l1.size() %>"><%=r.getTagname()%></td>
						<%
						    
						     Iterator it1 = l1.iterator();
						     while (it1.hasNext()) {
									r = (InspectTableRecord) it1.next();
						%>
						
						<td align="center"><%=r.getItemname()%></td>
						<td align="center"><%=r.getTvalue()%></td>
						


					</tr>
					<%
						     }
						}
						} else {
							System.out.println("出错了!");
						}
					%>
				</tbody>
			</table>
			</center>
			</div>
			
		</div>

</body>
</html>