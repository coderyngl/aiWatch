package bdqn_yl.entity;

import java.util.List;

public class Page {
	private int pageNo;   // 当前页页码(1,2,3....)
	private int pageSize;   // 每页显示条数
	private int totalCount;   // 总记录(条数)
	private List<Userbuy> data;   // 当前页数据集合
	private int totalPage;   // 总页数
	
	public Page(int pageSize,int totalCount ){
		this.pageSize=pageSize;
		this.totalCount=totalCount;
		if(this.totalCount%this.pageSize==0){
			totalPage=this.totalCount/this.pageSize;
		}else{
			totalPage=this.totalCount/this.pageSize+1;
		}
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public List<Userbuy> getData() {
		return data;
	}

	public void setData(List<Userbuy> data) {
		this.data = data;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}