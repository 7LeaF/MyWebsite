package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO(){
		try{
			String dbURL= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbID= "hr";
			String dbPassword= "hr";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String getDate(){
		String SQL= "SELECT sysdate FROM dual";
		try{
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				return rs.getString(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext(){
		String SQL= "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
		try{
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent){
		String SQL= "INSERT INTO bbs VALUES (?, ?, ?, to_date(?, 'yyyy-mm-dd hh24:mi:ss'), ?, ?)";
		try{
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}
