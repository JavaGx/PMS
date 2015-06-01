package cn.gx.entity;

import java.io.Serializable;
/**
 * 用户
 * @author Administrator
 *
 */
public class User implements Serializable {

	/**
	CREATE TABLE `user` (
	  id int primary key auto_increment;
	  `username` varchar(20) NOT NULL,
	  `password` varchar(32) DEFAULT NULL,
	  `phone` varchar(11) DEFAULT NULL,
	  `email` varchar(20) DEFAULT NULL,
	  `sex` varchar(2) DEFAULT NULL,
	  `image` varchar(100) DEFAULT NULL,
	  depart_id int
	);
	alter table user add constraint fk_column_id foreign key(depart_id) references department(id);
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String username;//用户名
	private String password;//密码
	private String sex;//性别
	private String phone;//电话
	private String email;//邮箱
	private String image;
	private Role role;
	private Department department;
	private String description;
	private String[] userUrls;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String[] getUserUrls() {
		return userUrls;
	}
	public void setUserUrls(String[] userUrls) {
		this.userUrls = userUrls;
	}
	
	
}
