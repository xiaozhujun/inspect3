package com.execute;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.sql.Connection;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import model.MyDataSource;
public class DOMAnalysisXml {
	private insertToDb d = new insertToDb();
	private MyDataSource ds = new MyDataSource();
	Connection connection = ds.getConnection();
	
	@SuppressWarnings("unchecked")
	public void analysisXml(String fileName) {
		// String tname,String tag,String item,String value,String worker,Date
		// time

		String tname = null;
		String tag = null;
		String item = null;
		String value = null;
		String t = null;
		String worker = null;
		int tableRecid=0;
		SAXReader saxReader = new SAXReader();
		try {
			Document document = saxReader.read(new File(fileName));
			Element root = document.getRootElement();
			System.out.println(root.getName() + ":"
					+ root.attribute("inspecttype").getValue() + "--"
					+ root.attribute("inspecttime").getValue() + "--"
					+ root.attribute("worker").getValue());
			tname = root.attribute("inspecttype").getValue();
			t = root.attribute("inspecttime").getValue();
			worker = root.attribute("worker").getValue();
			Element e1 = root.element("devicetype");
			System.out.println(e1.getName() + ":"
					+ e1.attribute("name").getValue());
		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			int tid=d.getTid(tname);
			Date t1;
			try {
				t1 = sdf.parse(t);
				System.out.println("------------开始执行db1---------");
				d.insertToDB1(t1,tid);
				tableRecid=d.getTrecord(t1, tid);
				System.out.println("------------db1执行完------------");
			} catch (ParseException e12) {
				// TODO Auto-generated catch block
				e12.printStackTrace();
			}

			List<Element> e2 = e1.elements();
			Iterator<Element> it2 = e2.iterator();
			while (it2.hasNext()) {
				Element e5 = it2.next();
				System.out.println(e5.getName() + ":"
						+ e5.attribute("name").getValue());
				tag = e5.attribute("name").getValue();
				List<Element> elements = e5.elements();
				Iterator<Element> it = elements.iterator();
				while (it.hasNext()) {
					Element e = it.next();
					System.out.println(e.getName() + " : "
							+ e.attribute("name").getValue() + " -- "
							+ e.attribute("isInput").getName() + ":"
							+ e.attribute("isInput").getValue() + "--"
							+ e.attribute("description").getName() + ":"
							+ e.attribute("description").getValue() + "--"
							+ e.attribute("unit").getName() + ":"
							+ e.attribute("unit").getValue());
					item = e.attribute("name").getValue();
					List<Element> group = e.elements();
					Iterator<Element> git = group.iterator();
				
					while (git.hasNext()) {
						Element ge = git.next();
					
						System.out.println(ge.getName() + " : "
								+ ge.attribute("name").getValue());
						value = ge.attribute("name").getValue();
						SimpleDateFormat sdf1 = new SimpleDateFormat(
								"yyyy-MM-dd");
						Date d1;
						try {
							d1 = sdf1.parse(t);
                           
                            
                            System.out.println("--------------开始执行db------------");
							d.insertToDB(tname, tag, item, value, worker, d1,tableRecid);
							System.out.println("--------------db执行完-------------");
                            
							
						} catch (ParseException e11) {
							// TODO Auto-generated catch block
							e11.printStackTrace();
						}
					}
				}
			}

		} catch (DocumentException e) {

			e.printStackTrace();
		}

		// d1.parse("2010/5/4");

	}


}