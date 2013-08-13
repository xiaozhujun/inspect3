<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/styles/head.css" type="text/css">
<link href="/inspect/resources/dijit/themes/tundra/tundra.css"
	type="text/css" rel="stylesheet" />
<link href="/inspect/resources/styles/standard1.css" media="screen"
	type="text/css" rel="stylesheet" />
<link href="/inspect/resources/images/favicon.ico" rel="SHORTCUT ICON" />
<style type="text/css">
#nav {
	background-color: highlight;
	width: 100%;
	margin-top: 2px;
}

a:LINK {
	color: white;
	font-size: 15px;
}
</style>
</head>
<body>
	<div id="main">
		<div  id="menu">
			<ul id="_menu">
				<li id="c_report"><h2>历史记录管理</h2>
					<ul>
						<li id="i_device_list"><a title="报表查询"
							href="/inspect/devices?gousersearch">报表查询</a></li>
						<li id="i_device_list"><a title="点检上传"
							href="/inspect/devices?userupload">点检上传</a></li>
					</ul></li>
				<li id="c_users"><h2>人员管理</h2>
					<ul>
						<li id="i_users_new"><a title="添加 员工"
							href="/inspect/userses?userform">添加 员工</a></li>
						<li id="i_users_list"><a title="查询人员"
							href="/inspect/userses?page=1&size=10&role=0">查询人员</a></li>
					</ul></li>
				<li id="c_inspecttagrfid"><h2>项目管理</h2>
					<ul>
						<li id="i_inspecttagrfid_new"><a title="添加 标签"
							href="/inspect/inspecttagrfids?form">添加 标签</a></li>
						<li id="i_inspecttagrfid_list"><a title="查询标签"
							href="/inspect/inspecttagrfids?page=1&amp;size=10&amp;role=1">查询标签</a></li>
					</ul></li>
			</ul>
		</div>
		</div>
		
</body>
</html>