package site.itwill.dto;

public class CustomerDTO {
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
ADMIN              NUMBER(1)     
NEW_DATE  NOT NULL DATE          
LAST_DATE          DATE  
*/	
	private String email;
	private String password;
	private String name;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private int admin;
	private String newDate;
	private String lastDate;
	
	public CustomerDTO() {
		// TODO Auto-generated constructor stub
	}

	public CustomerDTO(String email, String password, String name, String phone, String zipcode, String address1,
			String address2, int admin, String newDate, String lastDate) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.admin = admin;
		this.newDate = newDate;
		this.lastDate = lastDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getNewDate() {
		return newDate;
	}

	public void setNewDate(String newDate) {
		this.newDate = newDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	
	
	
	
	
	

	
}
