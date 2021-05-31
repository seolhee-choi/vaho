package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.itwill.dto.CommentsDTO;

public class CommentsDAO extends JdbcDAO{
	private static CommentsDAO _dao;
	
	public CommentsDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new CommentsDAO();
	}
	
	public static CommentsDAO getDAO() {
		return _dao;
	}
	
	//�ڸ�Ʈ ���
	public int insertComments(CommentsDTO comments) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into comments values(comments_seq.nextval,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, comments.getNo());
			pstmt.setString(2, comments.getWriter());
			pstmt.setString(3, comments.getContent());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����] insertComments ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	/*
	//�ڸ�Ʈ ����
	public int updateComments(CommentsDTO comments) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update comments set writer=?, content=?; where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, comments.getWriter());
			pstmt.setString(2, comments.getContent());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����] updateComments ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	*/
	
	//�Խñ� ��ȣ�� ���޹޾� �ش���� �ڸ�Ʈ �˻�
	public List<CommentsDTO> selectAllComments(int review_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CommentsDTO> commentsList=new ArrayList<CommentsDTO>();
		try {
			con=getConnection();
			
			String sql="select * from comments where review_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, review_no);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CommentsDTO comments=new CommentsDTO();
				comments.setNo(rs.getInt("no"));
				comments.setReviewNo(rs.getInt("review_no"));
				comments.setWriter(rs.getString("writer"));
				comments.setContent(rs.getString("content"));
				comments.setRegDate(rs.getString("reg_date"));
				commentsList.add(comments);
			}
			
		} catch (SQLException e) {
			System.out.println("[����] selectAllComments ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return commentsList;
	}
	
	public int selectNextNo() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNo=0;
		try {
			con=getConnection();
			
			String sql="select comments_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nextNo=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[����] selectNextNo ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return nextNo;
	}
	

	
	public int selectCommentsCount(int no) { 
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			String sql="select count(*) from comments where review_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);

			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
		}
		
		} catch (SQLException e) {
			System.out.println("[����] selectCommentsCount ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	public int deleteComment(String writer , String content) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con =getConnection();
			String sql ="delete from customer where writer =? and content =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, content);
			
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[����] deleteComment ���� ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}

}
