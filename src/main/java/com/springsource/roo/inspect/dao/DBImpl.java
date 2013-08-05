package com.springsource.roo.inspect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import model.InspectTableRecord;
import model.MyDataSource;

public class DBImpl {
  
	 private MyDataSource ds=new MyDataSource();
	 Connection connection=ds.getConnection();
	 PreparedStatement statement=null;
	 ResultSet rs=null;
	public List<InspectTableRecord> getTim(){
	
		String sql="select createtime from inspect_table_record group by createtime;";
		InspectTableRecord r = null;
		List<InspectTableRecord> list=new ArrayList<InspectTableRecord>();
		try{
			statement=connection.prepareStatement(sql);
			rs=statement.executeQuery();
			while(rs.next()){
				r=new InspectTableRecord();
				r.setCreatetime(rs.getDate(1));
				list.add(r);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	public static void main(String[] args) {
		DBImpl d=new DBImpl();
		List<InspectTableRecord> list=d.getTim();
		Iterator l=list.iterator();
		while(l.hasNext()){
			InspectTableRecord d1=(InspectTableRecord) l.next();
			System.out.println(d1.getCreatetime());
		}
		
	}
}
