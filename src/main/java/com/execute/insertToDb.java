package com.execute;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import model.MyDataSource;

public class insertToDb {

	private MyDataSource ds = new MyDataSource();
    public void closeSource(Connection connection,PreparedStatement statement,ResultSet rs){
    	if(rs!= null){   
    			    try{  
    		        rs.close() ;  
    		    }catch(SQLException e){  
    			        e.printStackTrace() ;  
    			    }  
    			}  
    			if(statement!= null){   
    		    try{  
    		    	statement.close() ;  
    			    }catch(SQLException e){  
    		        e.printStackTrace() ;  
    			    }  
    			}  
    			if(connection!= null){  
    			    try{  
    			    	connection.close() ;  
    			    }catch(SQLException e){  
    			        e.printStackTrace() ;  
    			    }  
    			}
    }
	public void insertToDB1(Date t,int tid) {
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs=null;
		String sql2 = "insert into inspect_table_record(createtime,inspecttable)values(?,?)";
		try {
			statement = connection.prepareStatement(sql2);
			statement.setDate(1, new java.sql.Date(t.getTime()));
			statement.setInt(2, tid);
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
		}finally{
			closeSource(connection, statement, rs);
		}
	}

	public void insertToDB(String tname, String tag, String item, String value,
			String worker, Date time,int rectableid) {

		// /String sql1 =
		// "insert into inspect_table_record(inspecttable,createtime)values(?,?)";

		String sql1 = "insert into inspect_Item_Record (inspecttable,tag,item,ivalue,createtime,inspecttablerec,worker) values (?,?,?,?,?,?,?)";

		// String sql3="";
		//String sql3 = "update inspect_item_record it,inspect_table_record t set it.inspecttablerec=? where it.createtime=t.createtime and t.createtime=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs=null;
		int tid = getTid(tname);
		int tagid = getTagid(tag);
		int itemid = getItemid(tagid, tid, item);
		int vid = getVid(value);
		int uid = getUid(worker);
		int id = getTRecId(time);
		try {
			statement = connection.prepareStatement(sql1);
			statement.setInt(1, tid);
			statement.setInt(2, tagid);
			statement.setInt(3, itemid);
			statement.setInt(4, vid);
			statement.setDate(5, new java.sql.Date(time.getTime()));
			statement.setInt(6,rectableid);
			statement.setInt(7, uid);
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		/*try {
			statement = connection.prepareStatement(sql3);
			statement.setInt(1, id);
			statement.setDate(2, new java.sql.Date(time.getTime()));
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}*/
	}

	public int getTRecId(Date t) {
		String sql = "select t.id from inspect_item_record it,inspect_table_record t where it.createtime=t.createtime and t.createtime=? group by t.id";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setDate(1, new java.sql.Date(t.getTime()));
			rs = statement.executeQuery();
			while (rs.next()) {
				tid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tid;
	}

	public int getTid(String name) {
		
		String sql = "select id from inspect_table where tname=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				tid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tid;

	}

	public int getTagid(String name) {
		String sql = "select id from inspect_tag where name=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tagid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				tagid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tagid;

	}

	public int getItemid(int tagid, int tid, String name) {
		String sql = "select  it.id  from inspect_item it,inspect_tag tg,inspect_table tb where it.tag=tg.id and it.inspecttable=tb.id and tb.id=? and tg.id=? and it.name=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int id = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, tid);
			statement.setInt(2, tagid);
			statement.setString(3, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return id;

	}

	public int getUid(String name) {
		String sql = "select id from Users where username=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tagid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			rs = statement.executeQuery();
			while(rs.next()){
				tagid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tagid;

	}

	public int getVid(String name) {
		String sql = "select id from tvalue where tvalue=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tagid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				tagid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tagid;

	}

	public int getTrecord(Date t,int tid){
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs=null;
		int tagid = 0;
		String sql2 = "select id from inspect_table_record where createtime=? and inspecttable=?";
		try {
			statement = connection.prepareStatement(sql2);
			statement.setDate(1, new java.sql.Date(t.getTime()));
			statement.setInt(2, tid);
			rs = statement.executeQuery();
			while (rs.next()) {
				tagid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}finally{
			closeSource(connection, statement, rs);
		}
		return tagid;
	}
	public static void main(String[] args) throws ParseException {
		insertToDb d = new insertToDb();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d1 = sdf.parse("2010-3-2");

		System.out.println(d1);

		int x = d.getItemid(4, 1, "姊瓙鏍忔潌");
		System.out.println(x);
	}

}
