package Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import model.MyDataSource;

public class insertToDb {
//负责将解析的数据插入到相应的数据表中
	//有个表名:tname
	//标签名:item名
	//values值，
    //在上传的同时，将数据插入到数据库中
	private MyDataSource ds=new MyDataSource();
	public void insertToDB(String tname,String tag,String item,String value,String worker,Date time){
		System.out.println(item+"标签");
		System.out.println(tname+"表名");
		System.out.println(value+"值");
		System.out.println(worker+"工作人员");
		System.out.println(time+"时间");
		String sql1="insert into inspect_table_record(inspecttable,createtime)values(?,?)"; 
		//先在录入时将日期和tableid插入到inspect_table_record中，后根据这个tid以及createtime来查询id后插入到inspectItemRec中
		
		String sql="insert into inspect_Item_Record (inspecttable,tag,item,ivalue,createtime,inspecttablerec,worker) values (?,?,?,?,?,?,?)";
		
		//在这之前需要编写
		//根据tname求tid,tagname求tagid,值求id,worker求id,根据标签id和表id以及item名查item的id
	//sql1="insert into inspect_Item_Rec (inspecttable,tag,item,ivalue,createtime,inspect_table_rec,worker) values (1,1,53,1,'2010-10-2',1,1)"
		Connection connection=ds.getConnection();
		PreparedStatement statement=null;
		ResultSet rs=null;
		int tid=getTid(tname);
		int tagid=getTagid(tag);
		int itemid=getItemid(tagid, tid, item);
		int vid=getVid(value);
		int uid=getUid(worker);
		System.out.println(tid+"1");
         System.out.println(tagid+"2");
         System.out.println(itemid+"3");
         System.out.println(vid+"4");
         System.out.println(uid+"5");
		try{
			statement=connection.prepareStatement(sql1);
			statement.setInt(1, tid);
			statement.setDate(2, new java.sql.Date(time.getTime()));
			statement.executeUpdate();
		}catch (SQLException e) {
			// TODO: handle exception
		}
		int id=getTRecId(tid,time);
		try{
			statement=connection.prepareStatement(sql);
			statement.setInt(1, tid);
			statement.setInt(2, tagid);
			statement.setInt(3, itemid);
			statement.setInt(4, vid);
			statement.setDate(5, new java.sql.Date(time.getTime()));
			statement.setInt(6, id);
			statement.setInt(7, uid);
			statement.executeUpdate();
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		
	}
	private int getTRecId(int cid,Date t) {
		String sql="select id from inspect_table_record where inspecttable=? and createtime=?";
		Connection connection=ds.getConnection();
		PreparedStatement statement=null;
		ResultSet rs=null;
		int tid=0;
		try{
			statement=connection.prepareStatement(sql);
			statement.setInt(1, cid);
			statement.setDate(2, new java.sql.Date(t.getTime()));
			rs=statement.executeQuery();
			while(rs.next()){
				tid=rs.getInt(1);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	  return tid;
	}
	public int getTid(String name){
		String sql="select id from inspect_table where tname=?";
		Connection connection=ds.getConnection();
		PreparedStatement statement=null;
		ResultSet rs=null;
		int tid=0;
		try{
			statement=connection.prepareStatement(sql);
			statement.setString(1, name);
			rs=statement.executeQuery();
			while(rs.next()){
				tid=rs.getInt(1);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	  return tid;
	
	
	}
	public int getTagid(String name){
		String sql="select id from inspect_tag where name=?";
		Connection connection=ds.getConnection();
		PreparedStatement statement=null;
		ResultSet rs=null;
		int tagid=0;
		try{
			statement=connection.prepareStatement(sql);
			statement.setString(1, name);
			rs=statement.executeQuery();
			while(rs.next()){
				tagid=rs.getInt(1);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	  return tagid;
	
		
	}
	public int getItemid(int tagid,int tid,String name){
		String sql="select  it.id  from inspect_item it,inspect_tag tg,inspect_table tb where it.tag=tg.id and it.inspecttable=tb.id and tb.id=? and tg.id=? and it.name=?";
		Connection connection=ds.getConnection();
		PreparedStatement statement=null;
		ResultSet rs=null;
		int id=0;
		try{
			statement=connection.prepareStatement(sql);
			statement.setInt(1, tagid);
			statement.setInt(2, tid);
			statement.setString(3, name);
			rs=statement.executeQuery();
			while(rs.next()){
				id=rs.getInt(1);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	  return id;
	
		
	}
	public int getUid(String name){
		String sql="select id from Users where username=?";
		Connection connection=ds.getConnection();
		PreparedStatement statement=null;
		ResultSet rs=null;
		int tagid=0;
		try{
			statement=connection.prepareStatement(sql);
			statement.setString(1, name);
			rs=statement.executeQuery();
			while(rs.next()){
				tagid=rs.getInt(1);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	  return tagid;
	
		
	}
	public int getVid(String name){
		String sql="select id from tvalue where tvalue=?";
		Connection connection=ds.getConnection();
		PreparedStatement statement=null;
		ResultSet rs=null;
		int tagid=0;
		try{
			statement=connection.prepareStatement(sql);
			statement.setString(1, name);
			rs=statement.executeQuery();
			while(rs.next()){
				tagid=rs.getInt(1);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	  return tagid;
	
		
	}
	
	
	public static void main(String[] args) throws ParseException {
		insertToDb d=new insertToDb();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1=sdf.parse("2010-3-2");
        
		//d1.parse("2010/5/4");
		System.out.println(d1);
		d.insertToDB("机修人员点检表", "标签1", "铁鞋、锚定", "正常", "工作人员1", d1);
		
	}
	
}
