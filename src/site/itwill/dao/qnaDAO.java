package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.itwill.dto.qnaDTO;



public class qnaDAO extends JdbcDAO {
	private static qnaDAO _dao;
	
	private qnaDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new qnaDAO();
	}
	
	public static qnaDAO getDAO() {
		return _dao;
	}
	
	
	//selectBoardCount >> selectQnaCount
	public int selectQnaCount(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {//검색 기능을 사용하지 않을 경우
				String sql="select count(*) from qna";
				pstmt=con.prepareStatement(sql);
			} else {//검색 기능을 사용한 경우
				String sql="select count(*) from qna where subject like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("[에러]selectQnaCount() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	public List<qnaDTO> selectQnaList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<qnaDTO> qnaList=new ArrayList<qnaDTO>();
		try {
			con=getConnection();
			
			if(keyword.equals("")) {
				String sql="select * from(select rownum rn,temp.* from (select * "
						+ "from qna order by ref desc,re_step) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql="select * from(select rownum rn,temp.* from (select * "
						+ "from qna where subject like '%'||?||'%' and status!=9 order "
						+ "by ref desc,re_step) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				qnaDTO qna=new qnaDTO();
				qna.setNum(rs.getInt("num"));
				qna.setEmail(rs.getString("email"));
				qna.setWriter(rs.getString("writer"));
				qna.setSubject(rs.getString("subject"));
				qna.setRegDate(rs.getString("reg_date"));
				qna.setReadCount(rs.getInt("readcount"));
				qna.setRef(rs.getInt("ref"));
				qna.setReStep(rs.getInt("re_step"));
				qna.setReLevel(rs.getInt("re_level"));
				qna.setContent(rs.getString("content"));
				qna.setStatus(rs.getInt("status"));
				qnaList.add(qna);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectQnaList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qnaList;
	}
	
	//QNA_SEQ 시퀸스 객체의 다음값을 검색하여 반환하는 메소드
		public int selectNextNum() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int nextNum=0;
			try {
				con=getConnection();
				
				String sql="select qna_seq.nextval from dual";
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					nextNum=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectNextNum() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return nextNum;
		}
		
	// 게시글을 전달받아 QNA 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
		public int insertQna(qnaDTO qna) {
			Connection con = null;
			PreparedStatement pstmt = null;
			int rows = 0;
			try {
				con = getConnection();

				String sql = "insert into qna values(?,?,?,?,sysdate,0,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, qna.getNum());
				pstmt.setString(2, qna.getEmail());
				pstmt.setString(3, qna.getWriter());
				pstmt.setString(4, qna.getSubject());
				pstmt.setInt(5, qna.getRef());
				pstmt.setInt(6, qna.getReStep());
				pstmt.setInt(7, qna.getReLevel());
				pstmt.setString(8, qna.getContent());
				pstmt.setInt(9, qna.getStatus());

				rows = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]insertQna() 메소드의 SQL 오류 = " + e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
	//답글 관련 정보를 전달받아 QNA 테이블에 저장된 기존 게시글을 관련 컬럼값을 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateReStep(int ref, int reStep) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
				
			String sql="update qna set re_step=re_step+1 where ref=? and re_step>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, reStep);
				
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateReStep() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//게시글 번호를 전달받아 QNA 테이블에 저장된 해당 게시글을 검색하여 반환하는 메소드
	public qnaDTO selectNumQna(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		qnaDTO qna=null;
		try {
			con=getConnection();
				
			String sql="select * from qna where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
				
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				qna=new qnaDTO();
				qna.setNum(rs.getInt("num"));
				qna.setEmail(rs.getString("email"));
				qna.setWriter(rs.getString("writer"));
				qna.setSubject(rs.getString("subject"));
				qna.setRegDate(rs.getString("reg_date"));
				qna.setReadCount(rs.getInt("readcount"));
				qna.setRef(rs.getInt("ref"));
				qna.setReStep(rs.getInt("re_step"));
				qna.setReLevel(rs.getInt("re_level"));
				qna.setContent(rs.getString("content"));
				qna.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNumQna() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qna;
	}
	
	//게시글 번호를 전달받아 QNA 테이블에 저장된 해당 게시글의 조회수를 1 증가되도록 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateReadCount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
				
			String sql="update qna set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
				
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateReadCount() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
		
	//게시글 번호를 전달받아 QNA 테이블에 저장된 해당 게시글의 상태를 변경하고 변경행의 갯수를 반환하는 메소드 - 게시글의 상태를 [9]로 변경 >> 게시글 삭제 처리 
	public int deleteQna(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
				
			String sql="update qna set status=9 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
				
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteQna() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//게시글을 전달받아 QNA 테이블에 저장된 해당 게시글을 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateQna(qnaDTO qna) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update qna set subject=?,content=?,status=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, qna.getSubject());
			pstmt.setString(2, qna.getContent());
			pstmt.setInt(3, qna.getStatus());
			pstmt.setInt(4, qna.getNum());
				
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateQna() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}


























