

<%@page import="net.sf.jasperreports.engine.export.JRRtfExporter"%>
<%@page import="net.sf.jasperreports.engine.JRExporter"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>
<%@page
	import="net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>

<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page
	import="net.sf.jasperreports.engine.export.JRHtmlExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.JRExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRHtmlExporter"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String time=request.getParameter("time");

	String url = "jdbc:mysql://localhost:3306/inspect2";
	Class.forName("com.mysql.jdbc.Driver");
	Map parameters = new HashMap();
	String sql="select tb.id,tb.tname,tag.id,tag.name,it.id,it.name,u.id,u.username,v.id,v.tvalue,itr.createtime from inspect_item_record itr,inspect_table_record tr,inspect_tag tag,inspect_item it,inspect_Table tb,Users u,tvalue v,inspect_item_tvalues tv where itr.createtime=tr.createtime and itr.inspecttable=tb.id and itr.tag=tag.id and itr.item=it.id and itr.worker=u.id and it.id=tv.inspect_item and v.id=tv.tvalues and itr.createtime='"+time+"' order by tb.id";
	parameters.put("SQLSTR", sql);
	Connection connection = DriverManager.getConnection(url, "root",
			"root");

	String type = request.getParameter("type");
	File reportFile = new File(this.getServletContext().getRealPath(
			"/report/InspectReport.jasper"));
	JasperReport jasperReport = (JasperReport) JRLoader
			.loadObject(reportFile.getPath());

	ServletOutputStream ouputStream = response.getOutputStream();
	if (type.equals("html")) {

		response.setContentType("text/html");
		JasperPrint jasperPrint = JasperFillManager.fillReport(
				jasperReport, parameters, connection);
		JRHtmlExporter exporter = new JRHtmlExporter();
		exporter.setParameter(
				JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN,
				Boolean.FALSE);
		exporter.setParameter(JRExporterParameter.JASPER_PRINT,
				jasperPrint);
		exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,
				"UTF-8");
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
				ouputStream);

		exporter.exportReport();

		ouputStream.flush();
		ouputStream.close();

	} else if (type.equals("excel")) {

		response.setContentType("application/vnd.ms-excel");

		JasperPrint jasperPrint = JasperFillManager.fillReport(
				jasperReport, parameters, connection);
		//ServletOutputStream ouputStream = response.getOutputStream();
		JRXlsExporter exporter = new JRXlsExporter();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT,
				jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
				ouputStream);
		exporter.setParameter(
				JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,
				Boolean.TRUE);
		exporter.setParameter(
				JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,
				Boolean.FALSE);
		exporter.setParameter(
				JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,
				Boolean.FALSE);
		exporter.exportReport();
		ouputStream.flush();
		ouputStream.close();

	} else if (type.equals("pdf")) {
		byte[] bytes = JasperRunManager.runReportToPdf(
				reportFile.getPath(), parameters, connection);
		response.setContentType("application/pdf");
		response.setContentLength(bytes.length);
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(bytes, 0, bytes.length);
		outputStream.flush();
		outputStream.close();
	} else if (type.equals("word")) {
		response.setContentType("application/msword;charset=utf-8");
		JasperPrint jasperPrint = JasperFillManager.fillReport(
				jasperReport, parameters, connection);
		ServletOutputStream outputStream = response.getOutputStream();
		JRExporter exporter = new JRRtfExporter();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT,
				jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
				response.getOutputStream());
		exporter.exportReport();
		outputStream.flush();
		outputStream.close();

	}
%>
</body>
</html>