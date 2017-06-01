package daoimpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class UpFirst {
//更新first表里的timex
	public void Uptimex(){
		Connection connection = null;
		Statement statement = null;
		try{
			connection = JdbcUtil.getConnection();
			statement=connection.createStatement();
			String sql="UPDATE first1 set timex =(SELECT  TIMESTAMPDIFF(HOUR,first1.time,b2.time) timex from `second` b2 where first1.mac=b2.mac);";
			statement.executeUpdate(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//更新first表里的时间并增加num
	public void UptimeAnum(){
		Connection connection = null;
		Statement statement = null;
		try{
			connection = JdbcUtil.getConnection();
			statement=connection.createStatement();
			String sql="UPDATE `first1`,`second` set `first1`.time=`second`.time ,num=1+num where `first1`.mac=`second`.mac;";
			statement.executeUpdate(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//从second向first插入新mac
	public void insFirst(){
		Connection connection = null;
		Statement statement = null;
		try{
			connection = JdbcUtil.getConnection();
			statement=connection.createStatement();
			String sql="INSERT into `first1` (mac,time)(SELECT * FROM `second` WHERE mac not in (SELECT `second`.mac from `first1`,`second` WHERE `first1`.mac=`second`.mac));";
			statement.executeUpdate(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
