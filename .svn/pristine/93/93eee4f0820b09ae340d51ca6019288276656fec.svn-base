package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.itwill.dto.AccessoryDTO;

public class AccessoryDAO  extends JdbcDAO{
private static AccessoryDAO _dao;

	static {
		_dao=new AccessoryDAO();
	}
	
	
	public static AccessoryDAO getDAO() {		
		return _dao;
	}

	
	public int insertAccessory(AccessoryDTO Accessory) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into AccessoryInfo values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, Accessory.getName());
			pstmt.setString(2, Accessory.getType());
			pstmt.setString(3, Accessory.getPicturename());
			pstmt.setInt(4, Accessory.getPicturecount());
			pstmt.setString(5, Accessory.getExp());
			pstmt.setInt(6, Accessory.getPrice());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertStudent() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updateAccessory(AccessoryDTO Accessory) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update AccessoryInfo set type=?,picturename=?,pirce=?,exp=?,pirce=?,Shippingcost=? where Name=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, Accessory.getType());
			pstmt.setString(2, Accessory.getPicturename());
			pstmt.setInt(5, Accessory.getPicturecount());
			pstmt.setString(3, Accessory.getExp());
			pstmt.setInt(4, Accessory.getPrice());
			pstmt.setString(6, Accessory.getName());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStudent() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}	

	
	public int deleteAccessory(int no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from AccessoryInfo where name=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteStudent() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public AccessoryDTO selectTypeAccessory(String type) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		AccessoryDTO accessory=null;
		try {
			con=getConnection();
			
			String sql= "SELECT * FROM AccessoryInfo where type like ? ORDER BY name DESC " ;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, type);
					
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				accessory=new AccessoryDTO();	
				accessory.setName(rs.getString("Name"));
				accessory.setType(rs.getString("type"));
				accessory.setPicturename(rs.getString("picturename"));	
				accessory.setPicturecount(rs.getInt("picturecount"));	
				accessory.setExp(rs.getString("exp"));
				accessory.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNoStudent() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		
		
		return accessory;
	}
			
	public List<AccessoryDTO> selectNameStudentList(String type) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<AccessoryDTO> studentList=new ArrayList<AccessoryDTO>();
		try {
			con=getConnection();
			
			String sql="select * from AccessoryInfo where type = ? ORDER BY name";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, type);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				AccessoryDTO accessory=new AccessoryDTO();
				accessory.setName(rs.getString("name"));
				accessory.setType(rs.getString("type"));
				accessory.setPicturename(rs.getString("picturename"));
				accessory.setExp(rs.getString("exp"));
				accessory.setPrice(rs.getInt("price"));
				accessory.setPicturecount(rs.getInt("picturecount"));	
				studentList.add(accessory);
			} 
		} catch (SQLException e) {
			System.out.println("[에러]selectNameStudentList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return studentList;
	}
	
	public List<AccessoryDTO> selectSchoolNameStudentList(String type) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<AccessoryDTO> studentList=new ArrayList<AccessoryDTO>();
		try {
			con=getConnection();
			
			String sql="select * from AccessoryInfo where type like ? ORDER BY name";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, type);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				AccessoryDTO accessory=new AccessoryDTO();
				accessory.setName(rs.getString("name"));
				accessory.setType(rs.getString("type"));
				accessory.setPicturename(rs.getString("picturename"));
				accessory.setExp(rs.getString("exp"));
				accessory.setPrice(rs.getInt("pirce"));
				accessory.setPicturecount(rs.getInt("picturecount"));	
				studentList.add(accessory);
			} 
		} catch (SQLException e) {
			System.out.println("[에러]selectNameStudentList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return studentList;
	}		
	
	public List<AccessoryDTO> selectAllStudentList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<AccessoryDTO> accessoryList=new ArrayList<AccessoryDTO>();
		try {
			con=getConnection();		
			
			String sql="select * from AccessoryInfo ORDER BY name, type";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				AccessoryDTO accessory=new AccessoryDTO();
				accessory.setName(rs.getString("NAME"));
				accessory.setType(rs.getString("TYPE"));
				accessory.setPicturename(rs.getString("PICTURENAME"));
				accessory.setPicturecount(rs.getInt("PICTURECOUNT"));	
				accessory.setExp(rs.getString("EXP"));
				accessory.setPrice(rs.getInt("PRICE"));
				accessoryList.add(accessory);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllStudentList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return accessoryList;
	}
}
