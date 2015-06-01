package cn.gx.service;

import java.util.List;

import cn.gx.entity.Comment;
import cn.gx.entity.PageBean;
import cn.gx.entity.Reply;

public interface CommentService {

	void sendCommentInfo(Comment comment, Integer rid);

	List<Reply> getCommentInfo(Integer userId);
	
	public int getCommentsCount(Integer userId);

	PageBean getCommentInfoByIndex(Integer userId, int num);

}
