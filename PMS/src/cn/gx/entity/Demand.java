package cn.gx.entity;

import java.io.Serializable;

public class Demand implements Serializable {

	/**@ather:coolzbf
	 CREATE TABLE `demand` (
  `id` int(11) primary key NOT NULL AUTO_INCREMENT,
  `title` varchar(400) DEFAULT NULL,
  `needperson` int,
  `needtime` varchar(100) DEFAULT NULL,
  `need` varchar(4000) DEFAULT NULL,
  `appointperson` int ,
  `image` varchar(36) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
);
alter table demand add constraint fk_column_id foreign key(needperson) references user(id);
alter table demand add constraint fk_column_id2 foreign key(appointperson) references user(id);
	 */
	private static final long serialVersionUID = 1234213124123141L;
	private Integer id;//编号
	private Project project;
	private String title;//标题
	private User applicant;//提出需求人
	private String starttime;//提出需求时间
	private String updatetime;//需求更新时间
	private String content;//详细需求
	private User appointPerson;//指定解决人
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public User getAppointPerson() {
		return appointPerson;
	}
	public void setAppointPerson(User appointPerson) {
		this.appointPerson = appointPerson;
	}
	public User getApplicant() {
		return applicant;
	}
	public void setApplicant(User applicant) {
		this.applicant = applicant;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	

}
