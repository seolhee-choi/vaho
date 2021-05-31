package site.itwill.dto;
/*
이름         널?       유형           
---------- -------- ------------ 
LOGIN_MAIL NOT NULL VARCHAR2(10) 
NO         NOT NULL NUMBER(10)   
ITEM                VARCHAR2(30) 
COUNT      NOT NULL NUMBER(10)   
PRICE               VARCHAR2(20) 
DELIVERY_P          VARCHAR2(20) 
TOTAL_P             VARCHAR2(20) 
*/
public class CartDTO {
	private String loginid;			//로그인 정보
	private int no;					//상품 번호
	private String item;			//세부정보
	private int count;				//상품 개수
	private String price;			//상품 단가
	private String totalP;			//상품 금액 (단가*개수)
	private String deliveryP;		//배송료 (2500원 고정)
	private String deliveryType;	//배송상태
	private String deliveryStartdate;		//배송시작일자
	private String deliveryArriveddate;		//배송종료예정일자

	public static final int Shopping=0; 
	public static final int Buy=1; 
	public static final int Delivery=2; 
	public static final int Arrive=3; 
	public static final int Refund=10;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTotalP() {
		return totalP;
	}

	public void setTotalP(String totalP) {
		this.totalP = totalP;
	}

	public String getDeliveryP() {
		return deliveryP;
	}

	public void setDeliveryP(String deliveryP) {
		this.deliveryP = deliveryP;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}

	public String getDeliveryStartdate() {
		return deliveryStartdate;
	}

	public void setDeliveryStartdate(String deliveryStartdate) {
		this.deliveryStartdate = deliveryStartdate;
	}

	public String getDeliveryArriveddate() {
		return deliveryArriveddate;
	}

	public void setDeliveryArriveddate(String deliveryArriveddate) {
		this.deliveryArriveddate = deliveryArriveddate;
	}

	public void add(CartDTO cart) {
		// TODO Auto-generated method stub
		
	}

	
	
}