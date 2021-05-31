package site.itwill.dto;

public class AccessoryDTO {
	
	String type;
	String picturename;
	int picturecount;
	String exp;
	int price;
	String Name;
	
	public int getPicturecount() {
		return picturecount;
	}



	public void setPicturecount(int picturecount) {
		this.picturecount = picturecount;
	}

	public AccessoryDTO(String name, String type, String picturename, int picturecount, String exp, int price) {
		super();
		Name = name;
		this.type = type;
		this.picturename = picturename;
		this.picturecount = picturecount;
		this.exp = exp;
		this.price = price;
	}	

	
	public AccessoryDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPicturename() {
		System.out.println(picturename);
		return picturename;
	}
	public void setPicturename(String picturename) {
		this.picturename = picturename;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int pirce) {
		this.price = pirce;
	}	


}
