package cn.gx.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Privilege  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private String url;
	private Privilege parent;
	private String description;
	private List<Privilege> children =new ArrayList<Privilege>();	
	private List<Role> roles=new ArrayList<Role>();	
	

	public Privilege() {
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public Privilege getParent() {
		return parent;
	}


	public void setParent(Privilege parent) {
		this.parent = parent;
	}


	public List<Privilege> getChildren() {
		return children;
	}


	public void setChildren(List<Privilege> children) {
		this.children = children;
	}


	public List<Role> getRoles() {
		return roles;
	}


	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

}
