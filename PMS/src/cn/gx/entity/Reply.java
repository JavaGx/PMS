package cn.gx.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Reply implements Serializable {
	/**
	 CREATE TABLE `reply` (
	  id int primary key auto_increment,
	  `replytime` varchar(30) DEFAULT NULL,
	  `handle` varchar(255) DEFAULT NULL,
	  `myfile` varchar(100) DEFAULT NULL,
	  warn_id int,
	  replyperson int
	);
	alter table reply add constraint fk_column_id5 foreign key(replyperson) references user(id);
	alter table reply add constraint fk_column_id6 foreign key(warn_id) references warning(id);
	 */
	private static final long serialVersionUID = 34512312412131231L;
	private Integer id;//编号
	private String replytime;//回复时间
	private String handle;//处理
	private User replyPerson;//回复人
	private Warning warning;
	private String  myfile;
	private Reply parentReply;
	private Set<Reply> comments=new HashSet<Reply>();
	
	public String getMyfile() {
		return myfile;
	}
	public void setMyfile(String myfile) {
		this.myfile = myfile;
	}
	
	public Warning getWarning() {
		return warning;
	}
	public void setWarning(Warning warning) {
		this.warning = warning;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getReplytime() {
		return replytime;
	}
	public void setReplytime(String replytime) {
		this.replytime = replytime;
	}
	
	public User getReplyPerson() {
		return replyPerson;
	}
	public void setReplyPerson(User replyPerson) {
		this.replyPerson = replyPerson;
	}
	public String getHandle() {
		return handle;
	}
	public void setHandle(String handle) {
		this.handle = handle;
	}
	public Reply getParentReply() {
		return parentReply;
	}
	public void setParentReply(Reply parentReply) {
		this.parentReply = parentReply;
	}
	public Set<Reply> getComments() {
		return comments;
	}
	public void setComments(Set<Reply> comments) {
		this.comments = comments;
	}
	

}
