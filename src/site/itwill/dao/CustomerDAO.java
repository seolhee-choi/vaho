package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.itwill.dto.CustomerDTO;

public class CustomerDAO  extends JdbcDAO{
 
	private static CustomerDAO _dao;
	
	static {
			_dao=new CustomerDAO();
		
	}
	
	public static CustomerDAO getDAO(){
		return _dao;
	}
	
	//일반고객정보를 입력받아 기록에 추가하는 메소드
	public int insertCustomer(CustomerDTO customer) {
		
		Connection con =null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			/*	
			이름        널?       유형            
		--------- -------- ------------- 
		EMAIL     NOT NULL VARCHAR2(20)  
		PASSWORD  NOT NULL VARCHAR2(20)  
		NAME      NOT NULL VARCHAR2(20)  
		PHONE              VARCHAR2(20)  
		ZIPCODE            VARCHAR2(10)  
		ADDRESS1           VARCHAR2(400) 
		ADDRESS2           VARCHAR2(400) 
		ADMIN              NUMBER(1)      관리자1,일반2
		NEW_DATE  NOT NULL DATE          
		LAST_DATE          DATE  
			 */	
			con=getConnection();
			//이메일 이름 비밀번호 
			String sql="insert into customer values(?,?,?,null,null,null,null,2,sysdate,null)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, customer.getEmail());//이메일 pk
			pstmt.setString(2, customer.getPassword());//비밀번호
			pstmt.setString(3, customer.getName());//이름
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러] insertCustomer 에러 ="+e.getMessage());

		}finally {
			close(con, pstmt);
		}
		
		return rows;
	}
	
	
	
	//고객 정보 값을 검색하는 메소드(단일행)
	public  CustomerDTO  selectCustomer(String email) {
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		CustomerDTO customer =null;
		try {
			con=getConnection();
			String sql="select * from customer where email=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				customer= new CustomerDTO();
				customer.setEmail(rs.getString("email"));
				customer.setPassword(rs.getString("password"));
				customer.setName(rs.getString("name"));
				customer.setPhone(rs.getString("phone"));
				customer.setZipcode(rs.getString("zipcode"));
				customer.setAddress1(rs.getString("address1"));
				customer.setAddress2(rs.getString("address2"));
				customer.setAdmin(rs.getInt("admin"));
				customer.setNewDate(rs.getString("new_date"));
				customer.setLastDate(rs.getString("last_date"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]selectCustomer에서 발생한 오류 ="+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return customer;
	
	}
	//데이터를 삭제하는  메소드
	public  int deleteCustomer(String password) {
		Connection con =null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="delete from customer where password=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, password);
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteCustomer 에러 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
		
		
	}
	//일반회원데이터를 수정하는 메소드
	public int updateCustomer(CustomerDTO customer) {
		Connection con =null;
		PreparedStatement pstmt= null;
		int rows=0;
		try {
			con=getConnection();
			String sql="update customer set name=?, phone=?  , zipcode=? , address1=? , address2=? where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, customer.getName());
			pstmt.setString(2, customer.getPhone());
			pstmt.setString(3, customer.getZipcode());
			pstmt.setString(4, customer.getAddress1());
			pstmt.setString(5, customer.getAddress2());
			pstmt.setString(6, customer.getEmail());
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]updateCustomer 에러 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	//마지막 로그인 시간을 변경해주는 메소드
	public  int updateLastDate(CustomerDTO customer) {
		Connection con =null;
		PreparedStatement pstmt= null;
		int rows=0;
		try {
			con=getConnection();
			String sql="update customer set last_date=sysdate where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, customer.getEmail());
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]updateLastDate 에러 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
		
	}
	//비밀번호 찾기 이후 패스워드 변경 메소드
	public int newPasswordCustomer(CustomerDTO customer) {
		Connection con =null;
		PreparedStatement pstmt= null;
		int rows=0;
		try {
			con=getConnection();
			String sql="update customer set password=? where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, customer.getPassword());
			pstmt.setString(2, customer.getEmail());
			
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]updateCustomer 에러 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	//회원정보 전체를 불러오는 인스턴스
	public List<CustomerDTO> selectAllCustomer(){
		Connection con= null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		List<CustomerDTO> customerList = new ArrayList<CustomerDTO>();
		try {
			con=getConnection();
			String sql ="select * from customer order by email";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
			CustomerDTO customer=new CustomerDTO();
			customer.setEmail(rs.getString("email"));
			customer.setPassword(rs.getString("password"));
			customer.setName(rs.getString("name"));
			customer.setPhone(rs.getString("phone"));
			customer.setZipcode(rs.getString("zipcode"));
			customer.setAddress1(rs.getString("address1"));
			customer.setAddress2(rs.getString("address2"));
			customer.setAdmin(rs.getInt("admin"));
			customer.setNewDate(rs.getString("new_date"));
			customer.setLastDate(rs.getString("last_date"));
			customerList.add(customer);
			}
		} catch (SQLException e) {
			System.out.println();
		}finally {
			close(con, pstmt, rs);
		}
		return customerList;
	}
	
	//권한을 바꿔주는 메소드
	public  int updateAdmin(CustomerDTO customer) {
		Connection con =null;
		PreparedStatement pstmt= null;
		int rows=0;
		try {
			con=getConnection();
			String sql="update customer set admin=? where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, customer.getAdmin());
			pstmt.setString(2, customer.getEmail());
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]updateAdmin 에러 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
		
	}
	
	public int selectCountCustomer() {
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count = 0;
		try {
			con=getConnection();
			String sql ="select count(*) from customer";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
			count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[오류]selectCountCustomer = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	//이메일과 admin 값을 받아 관리자 상태/일반회원 으로 변경
	public int updateAdminCustomer(String email,int admin) {
		Connection con =null;
		PreparedStatement pstmt= null;
		int rows=0;
		try {
			con=getConnection();
			String sql="update customer set admin=? where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, admin);
			pstmt.setString(2, email);
			
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]updateAdminCustomer 에러 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	//탈퇴하기 DAO 호출
	public int deleteAllCustomer(String email) {
		Connection con =null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql ="delete from customer where email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]deleteCustomer 오류 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	//시작행과끝행을 입력하여 찾는 DAO
	public List<CustomerDTO> selectAllCustomer(int startRow,int endRow){
		Connection con= null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		List<CustomerDTO> customerList = new ArrayList<CustomerDTO>();
		try {
			con=getConnection();
			String sql ="select * from(select rownum rn,temp.* from (select * from customer order by email)"
					+ " temp) where rn between ? and ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
			CustomerDTO customer=new CustomerDTO();
			customer.setEmail(rs.getString("email"));
			customer.setPassword(rs.getString("password"));
			customer.setName(rs.getString("name"));
			customer.setPhone(rs.getString("phone"));
			customer.setZipcode(rs.getString("zipcode"));
			customer.setAddress1(rs.getString("address1"));
			customer.setAddress2(rs.getString("address2"));
			customer.setAdmin(rs.getInt("admin"));
			customer.setNewDate(rs.getString("new_date"));
			customer.setLastDate(rs.getString("last_date"));
			customerList.add(customer);
			}
		} catch (SQLException e) {
			System.out.println();
		}finally {
			close(con, pstmt, rs);
		}
		return customerList;
	}
	
}
