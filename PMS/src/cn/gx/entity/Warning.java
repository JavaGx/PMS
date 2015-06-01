package cn.gx.entity;

import java.io.Serializable;
/**
 * 故障
 * @author Administrator
 *
 */
public class Warning implements Serializable {
	
	/**
	CREATE TABLE `warning` (
	  id int primary key auto_increment;
	  `title` varchar(20) NOT NULL,
	  `starttime` varchar(30) DEFAULT NULL,
	  `urgent` varchar(10) DEFAULT NULL,
	  `state` varchar(6) DEFAULT NULL,
	  `desc` varchar(255) DEFAULT NULL,
	  'image' varchar(255),
	  user_id int
	);
	alter table department add constraint fk_column_id foreign key(user_id) references user(id);
	 */
	private static final long serialVersionUID = 1L;
	private  int id;//编号
	private String title;//标题
	private String starttime;//日期
	private String urgent;//紧急程度
	private String state;//当前状态
	private String description;//内容
	private User applicant;//申请人
	private String image;//内容截图
	private Reply bestreply;//最佳答案
	private int browseNumber;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getUrgent() {
		return urgent;
	}
	public void setUrgent(String urgent) {
		this.urgent = urgent;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public User getApplicant() {
		return applicant;
	}
	public void setApplicant(User applicant) {
		this.applicant = applicant;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Reply getBestreply() {
		return bestreply;
	}
	public void setBestreply(Reply bestreply) {
		this.bestreply = bestreply;
	}
	public int getBrowseNumber() {
		return browseNumber;
	}
	public void setBrowseNumber(int browseNumber) {
		this.browseNumber = browseNumber;
	}
	
	
}
