<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE HTML SYSTEM "about:legacy-compat">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
<meta content="IE=8" http-equiv="X-UA-Compatible" />
<link href="/inspect/resources/dijit/themes/tundra/tundra.css"
	type="text/css" rel="stylesheet" />
<link href="/inspect/resources/styles/standard.css" media="screen"
	type="text/css" rel="stylesheet" />
<link href="/inspect/resources/images/favicon.ico" rel="SHORTCUT ICON" />
<script type="text/javascript">
	var djConfig = {
		parseOnLoad : false,
		isDebug : false,
		locale : 'zh-cn'
	};
</script>
<script type="text/javascript" src="/inspect/resources/dojo/dojo.js"></script>
<script type="text/javascript" src="/inspect/resources/spring/Spring.js"></script>
<script type="text/javascript"
	src="/inspect/resources/spring/Spring-Dojo.js"></script>
<script type="text/javascript" language="JavaScript">
	dojo.require("dojo.parser");
</script>
<title>欢迎来到 起重机点检系统</title>
</head>
<body class="tundra spring">
	<div id="wrapper">
		<div id="nav">
			<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/styles/head.css" type="text/css">
<script type="text/javascript" src='resources/js/jquery-1.7.2.min.js'></script>
<title>Insert title here</title>
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
	<div id='titleContainerDiv'>
		<div id="titleDiv">
			港口起重机械健康监测与预报可视化系统<span id="devNameDiv"></span>
		</div>
	</div>
	<div id='mainHeadDiv'>
		<div id='headTab' class='tabs'>
			<div class='tabItem' url="integrateManagement.html">港机信息可视化</div>
			<div class='tabItem'>
				<a href='/inspect/user'>港机智能点检</a>
			</div>
			<div class='tabItem mainselected'
				url="mechanismForcast/health-forecast.html">机构健康监测</div>
			<div class='tabItem ' url="structForcast/health-forecast.html">结构健康监测</div>
			<div class='tabItem' url="electricalForcast/health-forecast.html">电气健康监测</div>
			<div class='tabItem' url="health-forecast.html">健康趋势预报</div>
			<div class='tabItem' url="risk-management.html">动态风险评估</div>
		</div>
	</div>
</body>
			</html>
		</div>
		<div id="main">
			<div version="2.0" id="menu">
				<ul id="_menu">
					<li id="c_report"><h2>报表管理</h2>
						<ul>
							<li id="i_device_list"><a title="报表查询"
								href="/inspect/devices?gosearch">报表查询</a></li>
							<li id="i_device_list"><a title="点检上传"
								href="/inspect/devices?upload">点检上传</a></li>
						</ul></li>
					<li id="c_roles"><h2>人员类型管理</h2>
						<ul>
							<li id="i_roles_new"><a title="添加 人员类型"
								href="/inspect/roleses?form">添加 人员类型</a></li>
							<li id="i_roles_list"><a title="查询人员类型"
								href="/inspect/roleses?page=1&amp;size=10&amp;role=1">查询人员类型</a></li>
						</ul></li>
					<li id="c_users"><h2>人员管理</h2>
						<ul>
							<li id="i_users_new"><a title="添加 员工"
								href="/inspect/userses?form">添加 员工</a></li>
							<li id="i_users_list"><a title="查询人员"
								href="/inspect/userses?page=1&amp;size=10&amp;role=1">查询人员</a></li>
						</ul></li>
					<li id="c_inspecttable"><h2>点检表管理</h2>
						<ul>
							<li id="i_inspecttable_new"><a title="添加 点检表"
								href="/inspect/inspecttables?form">添加 点检表</a></li>
							<li id="i_inspecttable_list"><a title="查询点检表"
								href="/inspect/inspecttables?page=1&amp;size=10&amp;role=1">查询点检表</a></li>
						</ul></li>
					<li id="c_inspecttag"><h2>标签类型管理</h2>
						<ul>
							<li id="i_inspecttag_new"><a title="添加 标签类型"
								href="/inspect/inspecttags?form">添加 标签类型</a></li>
							<li id="i_inspecttag_list"><a title="查询标签类型"
								href="/inspect/inspecttags?page=1&amp;size=10&amp;role=1">查询标签类型</a></li>
						</ul></li>
					<li id="c_tvalue"><h2>点检选项管理</h2>
						<ul>
							<li id="i_tvalue_new"><a title="添加 选项"
								href="/inspect/tvalues?form">添加 选项</a></li>
							<li id="i_tvalue_list"><a title="查询选项"
								href="/inspect/tvalues?page=1&amp;size=10&amp;role=1">查询选项</a></li>
						</ul></li>
					<li id="c_inspectitem"><h2>点检项管理</h2>
						<ul>
							<li id="i_inspectitem_new"><a title="添加 点检项"
								href="/inspect/inspectitems?form">添加 点检项</a></li>
							<li id="i_inspectitem_list"><a title="查询点检项"
								href="/inspect/inspectitems?page=1&amp;size=10&amp;role=1">查询点检项</a></li>
						</ul></li>
					<li id="c_deviceinspectrec"><h2>设备点检记录管理</h2>
						<ul>
							<li id="i_deviceinspectrec_new"><a title="添加 设备点检记录"
								href="/inspect/deviceinspectrecs?form">添加 设备点检记录</a></li>
							<li id="i_deviceinspectrec_list"><a title="查询设备点检记录"
								href="/inspect/deviceinspectrecs?page=1&amp;size=10&amp;role=1">查询设备点检记录</a></li>
						</ul></li>
					<li id="c_device"><h2>设备管理</h2>
						<ul>
							<li id="i_device_new"><a title="添加 设备"
								href="/inspect/devices?form">添加 设备</a></li>
							<li id="i_device_list"><a title="查询设备"
								href="/inspect/devices?page=1&amp;size=10&amp;role=1">查询设备</a></li>
						</ul></li>
					<li id="c_inspecttagrfid"><h2>标签管理</h2>
						<ul>
							<li id="i_inspecttagrfid_new"><a title="添加 标签"
								href="/inspect/inspecttagrfids?form">添加 标签</a></li>
							<li id="i_inspecttagrfid_list"><a title="查询标签"
								href="/inspect/inspecttagrfids?page=1&amp;size=10&amp;role=1">查询标签</a></li>
						</ul></li>
				</ul>
			</div>
			<div version="2.0">
				<script type="text/javascript">
					dojo.require('dijit.TitlePane');
				</script>
				<div id="_title_title_id">
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ElementDecoration({
							elementId : '_title_title_id',
							widgetType : 'dijit.TitlePane',
							widgetAttrs : {
								title : '欢迎来到 起重机点检系统',
								open : true
							}
						}));
					</script>
					<h3>欢迎来到 起重机点检系统</h3>
					<p>本智能点检系统提供了对特种设备&mdash;&mdash;起重机的相关的点检智能管理功能，系统包含了对报表，人员类型，人员，点检表，标签等的管理，可以实现对点检的数据进行智能的管理。</p>
				</div>
			</div>
		</div>
		<div id="footer">
			<div version="2.0" id="footer">
				<span id="language">语言: <a title="转换语言到 English"
					href="?lang=en"><img alt="转换语言到 English"
						src="/inspect/resources/images/en.png" class="flag" /></a>
				</span><span> | 主题: <a title="标准" href="?theme=standard">标准</a> | <a
					title="提示" href="?theme=alt">提示</a></span> | <span><a
					href="/inspect/resources/j_spring_security_logout">退出</a></span>
			</div>
		</div>
	</div>
</body>
</html>