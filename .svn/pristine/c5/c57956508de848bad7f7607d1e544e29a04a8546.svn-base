package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//JDBC 기능을 구현한 DAO 클래스가 상속받아 사용하기 위한 클래스
// => DataSource 인스턴스(DBCP)를 WAS에 등록된 자원으로 제공받아 Connection 인스턴스 반환하거나
//    Connection 인스턴스를 제거하는 메소드 작성
// => 상속이 목적인 클래스이므로 추상클래스로 선언하는 것을 권장
public abstract class JdbcDAO {
	//DataSource 인스턴스를 저장하기 위한 필드
	private static DataSource ds;
	
	static {
		try {
			//WAS에 등록된 자원을 읽어 생성된 DataSource 인스턴스를 반환받아 필드에 저장
			ds=(DataSource)new InitialContext().lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//DataSource 인스턴스(DBCP)로부터 제공받은 Connection 인스턴스를 반환하는 메소드
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	
	//매개변수로 전달받은 JDBC 자원을 제거하는 메소드 - Connection 인스턴스 제거
	public void close(Connection con) {
		try {
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt) {
		try {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}















