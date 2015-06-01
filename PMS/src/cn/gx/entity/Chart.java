package cn.gx.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Chart implements Serializable {

	private String name;
	private List<Integer> data=new ArrayList<Integer>();
	
	public Chart() {
		super();
	}
	public Chart(String name, List<Integer> data) {
		super();
		this.name = name;
		this.data = data;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Integer> getData() {
		return data;
	}
	public void setData(List<Integer> data) {
		this.data = data;
	}
	
	
}
