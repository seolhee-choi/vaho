package site.itwill.dto;

/*
�̸�           ��?       ����             
------------ -------- -------------- 
P_NO         NOT NULL NUMBER(4)      
P_CATEGORY            NUMBER(1)      
P_NAME                VARCHAR2(30)   
P_PRICE               NUMBER(10)     
P_INFOMATION          VARCHAR2(2000) 
P_REGDATE             DATE           
P_STOCK               NUMBER(10)     
P_SIZE                NUMBER(10)     
P_IMAGE               VARCHAR2(30)   
IMAGE_ROOT            VARCHAR2(30)   
IMAGE_COUNT           NUMBER(10)   

 */
public class ProductDTO {

	private int pNo;				//��ǰ��ȣ
	private String pCategory;  		//1.ring 2.neckace 3.bracelet 4.etc
	private String pName;			//��ǰ�̸�
	private int pPrice;				//��ǰ����
	private String pInfomation;		//��ǰ ������
	private	String pRegDate;		//��ǰ �����
	private int pStock;				//��ǰ ���
	private int pSize;				//��ǰ ������
	private String pImage;  		//�̹��� ����
	private String imageRoot; 		//�̹��� ���
	private int imageCount;	 		//�̹��� ����
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpInfomation() {
		return pInfomation;
	}

	public void setpInfomation(String pInfomation) {
		this.pInfomation = pInfomation;
	}

	public String getpRegDate() {
		return pRegDate;
	}

	public void setpRegDate(String pRegDate) {
		this.pRegDate = pRegDate;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	public int getpSize() {
		return pSize;
	}

	public void setpSize(int pSize) {
		this.pSize = pSize;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public String getImageRoot() {
		return imageRoot;
	}

	public void setImageRoot(String imageRoot) {
		this.imageRoot = imageRoot;
	}

	public int getImageCount() {
		return imageCount;
	}

	public void setImageCount(int imageCount) {
		this.imageCount = imageCount;
	}

	
	
}
