package cn.gx.entity;

import java.util.ArrayList;
import java.util.List;

public class PageBean {
	private int currentPage=1;
	private int pageSize=5;
	private int count;
	private int beginIndex;
	private int endIndex;
	private int totalPages;
	private List records=new ArrayList();
	

	public List getRecords() {
		return records;
	}

	public void setRecords(List records) {
		this.records = records;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public PageBean(int currentPage,int count) {
		this.currentPage = currentPage;
		this.count=count;
		this.totalPages=(count+pageSize-1)/pageSize;
		if(count<pageSize){
			this.beginIndex=0;
			//this.endIndex=count-1;
		}else{
			this.beginIndex=(currentPage-1)*pageSize;
			/*if(beginIndex+pageSize>count){
				this.endIndex=count-1;
			}else{
				this.endIndex=beginIndex+pageSize;
			}*/
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	
	
}
