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
	
	//��ü ��ǰ �˻�
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
			System.out.println("[����]selectAllProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	//��ǰ ���
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
			System.out.println("[����]insertProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//��ǰ���� ����
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
			System.out.println("[����]updateProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	
	//ī�װ��� ���޹޾� ��ǰ �˻�
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
				System.out.println("[����]selectCategory() �޼ҵ� SQL ����"+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
	
	//CRUD select �ڽ� ��ü ���
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
			System.out.println("[����]selectCategoryProductList �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	//��ǰ��ȣ�� ���޹޾� ��ǰ �˻�
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
			System.out.println("[����]selectNoProduct() �޼ҵ� SQL ����"+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	
	//��ǰ �̸��� ���޹޾� DTO�� ����� ��ǰ����� ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]selectNameProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	
	//��ȣ�� ���޹޾� ��ǰ�� �����ϴ� �޼ҵ�(�����ڸ����� ����)
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
			System.out.println("[����]deleteProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
		
}
