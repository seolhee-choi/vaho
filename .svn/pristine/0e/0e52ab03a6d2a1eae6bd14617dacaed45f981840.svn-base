package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.itwill.dto.ReviewDTO;



public class ReviewDAO extends JdbcDAO{
	private static ReviewDAO _dao;
	
	private ReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ReviewDAO();
	}
	
	public static ReviewDAO getDao() {
		return _dao;
	}

	//Review 테이블에 저장된 게시글의 갯수를 검색하여 반환하는 메소드
	public int selectReviewCount(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {//검색기능을 사용하지 않을 때
				String sql="select count(*) from review";
				
				pstmt=con.prepareStatement(sql);
			} else {//검색기능을 사용했을 때
				String sql="select count(*) from review where content like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewCount() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//시작 행번호와 종료 행번호를 전달받아 시작행부터 종료행안에 저장된
	//review 테이블의 게시글을 검색하여 반환하는 메소드 
	public List<ReviewDTO> selectReviewList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ReviewDTO> reviewList=new ArrayList<ReviewDTO>();
		try {
			con=getConnection();
			
			if(keyword.equals("")) {
				String sql="select * from (select rownum rn,review.*, (select count(*) from comments c where c.review_no = review.no) commentCount"
						+ " from review order by no desc) where rn between? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql="select * from (select rownum rn,review.*, (select count(*) from comments c where c.review_no = review.no) "
						+ "as commentCount from review where content like '%'||?||'%' order by no) where rn between ? and ?";
					
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
						
			while(rs.next()) {
				ReviewDTO review=new ReviewDTO();
				review.setNo(rs.getInt("no"));
				review.setProduct(rs.getString("product"));
				review.setWriter(rs.getString("writer"));
				review.setEmail(rs.getString("email"));
				review.setPw(rs.getString("pw"));
				review.setContent(rs.getString("content"));
				review.setGrade(rs.getString("grade"));
				review.setRegDate(rs.getString("reg_date"));
				review.setImage(rs.getString("image"));
				review.setCommentCount(rs.getInt("commentCount"));
				reviewList.add(review);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return reviewList;
	}
		
	//
	public int selectNextNo() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNo=0;
		try {
			con=getConnection();
			
			String sql="select review_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nextNo=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNextNo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return nextNo;
	}
		
	//게시글 번호를 전달받아 review 테이블에 저장된 해당 게시글을 검색하여 반환하는 메소드
		public ReviewDTO selectNoReview(int no) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ReviewDTO review=null;
			try {
				con=getConnection();
				
				String sql="select * from review where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, no);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					review=new ReviewDTO();
					review.setNo(rs.getInt("no"));
					review.setProduct(rs.getString("product"));
					review.setWriter(rs.getString("writer"));
					review.setEmail(rs.getString("email"));
					review.setPw(rs.getString("pw"));
					review.setContent(rs.getString("content"));
					review.setGrade(rs.getString("grade"));
					review.setRegDate(rs.getString("reg_date"));
					review.setImage(rs.getString("image"));
									
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectNoReview() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return review;
		}
	
		//게시글을 전달받아 REVIEW 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
		public int insertReview(ReviewDTO review) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="insert into review values(?,?,?,?,?,?,?,sysdate,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, review.getNo());
				pstmt.setString(2, review.getProduct());
				pstmt.setString(3, review.getWriter());
				pstmt.setString(4, review.getEmail());
				pstmt.setString(5, review.getPw());
				pstmt.setString(6, review.getContent());
				pstmt.setString(7, review.getGrade());
				pstmt.setString(8, review.getImage());
				
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]insertReview() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}		

		public int updateReview(ReviewDTO review) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update review set writer=?,email=?,content=?,image=?,grade=? where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, review.getWriter());
				pstmt.setString(2, review.getEmail());
				pstmt.setString(3, review.getContent());
				pstmt.setString(4, review.getImage());
				pstmt.setString(5, review.getGrade());
				pstmt.setInt(6, review.getNo());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateReview() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}

		
		public int deleteReview(int no) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="delete from review where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, no);
				
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]deleteReview() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		
}
