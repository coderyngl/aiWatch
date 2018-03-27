package bdqn_yl.entity;

public class Userbuy {
	private String ubname;   //商品名
	private int ordernum;    //订单号 ，主键
	private String url;     //图片地址
	private int num;      //购买数量
	private float price;    //商品价格
	private int status;   //商品状态
	private String name;  //用户名
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUbname() {
		return ubname;
	}
	public void setUbname(String ubname) {
		this.ubname = ubname;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
