package site.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.itwill.dto.ProductDTO;


public class ProductDAO extends JdbcDAO{
	private static ProductDAO _dao;
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ProductDAO();		
	}
	
	public static ProductDAO getDAO() {
		return _dao;
	}
	
	//전체 상품 검색
	public List<ProductDTO> selectAllProduct() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			String sql="select * from product order by p_category";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setpNo(rs.getInt("p_no"));
				product.setpCategory(rs.getString("p_category"));
				product.setpName(rs.getString("p_name"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpInfomation(rs.getString("p_infomation"));
				product.setpRegDate(rs.getString("p_regdate"));
				product.setpStock(rs.getInt("p_stock"));
				product.setpSize(rs.getInt("p_size"));
				product.setpImage(rs.getString("p_image"));
				product.setImageRoot(rs.getString("image_root"));
				product.setImageCount(rs.getInt("image_count"));
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	//상품 등록
	public int insertProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into product values(product_seq.nextval,?,?,?,?,sysdate,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, product.getpCategory());
			pstmt.setString(2, product.getpName());
			pstmt.setInt(3, product.getpPrice());
			pstmt.setString(4, product.getpInfomation());
			pstmt.setInt(5, product.getpStock());
			pstmt.setInt(6, product.getpSize());
			pstmt.setString(7, product.getpImage());
			pstmt.setString(8, product.getImageRoot());
			pstmt.setInt(9, product.getImageCount());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//상품정보 변경
	public int updateProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update product set p_category=?, p_price=?, p_infomation=?, p_stock=?, p_image=? where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, product.getpCategory());
			pstmt.setInt(2, product.getpPrice());
			pstmt.setString(3, product.getpInfomation());
			pstmt.setInt(4, product.getpStock());
			pstmt.setString(5, product.getpImage());
			pstmt.setInt(6, product.getpNo());
			
			rows=pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			System.out.println("[에러]updateProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	
	//카테고리를 전달받아 상품 검색
		public List<ProductDTO> selectCategory(String pCategory) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<ProductDTO> productList=new ArrayList<ProductDTO>();
			try {
				con=getConnection();
				String sql="select * from product where p_category=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, pCategory);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ProductDTO product=new ProductDTO();
					product.setpNo(rs.getInt("p_no"));
					product.setpCategory(rs.getString("p_category"));
					product.setpName(rs.getString("p_name"));
					product.setpPrice(rs.getInt("p_price"));
					product.setpInfomation(rs.getString("p_infomation"));
					product.setpRegDate(rs.getString("p_regdate"));
					product.setpStock(rs.getInt("p_stock"));
					product.setpSize(rs.getInt("p_size"));
					product.setpImage(rs.getString("p_image"));
					product.setImageRoot(rs.getString("image_root"));
					product.setImageCount(rs.getInt("image_count"));
					productList.add(product);
				}
			} catch (Exception e) {
				System.out.println("[에러]selectCategory() 메소드 SQL 오류"+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
	
	//CRUD select 박스 전체 출력
	public List<ProductDTO> selectCategoryProductList(String pCategory) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			String sql="select * from product order by p_category";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setpNo(rs.getInt("p_no"));
				product.setpCategory(rs.getString("p_category"));
				product.setpName(rs.getString("p_name"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpInfomation(rs.getString("p_infomation"));
				product.setpRegDate(rs.getString("p_regdate"));
				product.setpStock(rs.getInt("p_stock"));
				product.setpSize(rs.getInt("p_size"));
				product.setpImage(rs.getString("p_image"));
				product.setImageRoot(rs.getString("image_root"));
				product.setImageCount(rs.getInt("image_count"));
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCategoryProductList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	//제품번호를 전달받아 상품 검색
	public ProductDTO selectNoProduct(int pNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO product=null;
		try {
			con=getConnection();
			String sql="select * from product where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product=new ProductDTO();
				product.setpNo(rs.getInt("p_no"));
				product.setpCategory(rs.getString("p_category"));
				product.setpName(rs.getString("p_name"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpInfomation(rs.getString("p_infomation"));
				product.setpRegDate(rs.getString("p_regdate"));
				product.setpStock(rs.getInt("p_stock"));
				product.setpSize(rs.getInt("p_size"));
				product.setpImage(rs.getString("p_image"));
				product.setImageRoot(rs.getString("image_root"));
				product.setImageCount(rs.getInt("image_count"));
			}
		} catch (Exception e) {
			System.out.println("[에러]selectNoProduct() 메소드 SQL 오류"+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	
	//상품 이름을 전달받아 DTO에 저장된 상품목록을 반환하는 메소드
	public ProductDTO selectNameProduct(String pName) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO product=null;
		try {
			con=getConnection();
			
			String sql="select * from product where REPLACE(p_name,' ','')=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pName);
			
			rs=pstmt.executeQuery();
					
			if(rs.next()) {		
				product=new ProductDTO();
				product.setpNo(rs.getInt("p_no"));
				product.setpCategory(rs.getString("p_category"));
				product.setpName(rs.getString("p_name"));
				product.setpPrice(rs.getInt("p_price"));
				product.setpInfomation(rs.getString("infomation"));
				product.setpRegDate(rs.getString("regdate"));
				product.setpStock(rs.getInt("stock"));
				product.setpSize(rs.getInt("size"));
				product.setpImage(rs.getString("product_image"));
				product.setImageRoot(rs.getString("image_root"));
				product.setImageCount(rs.getInt("image_count"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNameProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	
	//번호를 전달받아 상품을 삭제하는 메소드(관리자만들어보고 결정)
	public int deleteProduct(int pNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from product where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]deleteProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
		
}
