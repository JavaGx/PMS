package cn.gx.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.gx.entity.Comment;
import cn.gx.entity.PageBean;
import cn.gx.entity.Reply;
import cn.gx.ibatis.mapper.CommentMapper;
import cn.gx.ibatis.mapper.ReplyMapper;
import cn.gx.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Resource
	private CommentMapper cm; 
	@Resource
	private ReplyMapper rm; 
	
	@Override
	public void sendCommentInfo(Comment comment,Integer rid) {
		cm.sendCommentInfo(comment.getState(),comment.getRecipient().getId(),rid);
	}
	
	public int getCommentsCount(Integer userId){
		List<Comment> comments = cm.getCommentInfo(userId);
		
		return comments.size();
	}
	
	public List<Reply> getCommentInfo(Integer userId){
		List<Comment> comments = cm.getCommentInfo(userId);
		List<Reply> replies=new ArrayList<Reply>();
		for(Comment comment:comments){
			Reply reply = rm.findReplyById(comment.getReply().getId());
			cm.updateCommentState(comment.getId());
			replies.add(reply);
		}
		return replies;
	}

	@Override
	public PageBean getCommentInfoByIndex(Integer userId, int num) {
		int count=cm.getCommentsCount(userId);
		PageBean page=new PageBean(num, count);
		List<Comment> comments = cm.getCommentInfoByIndex(userId,page.getBeginIndex(),page.getPageSize());
		List<Reply> replies=new ArrayList<Reply>();
		for(Comment comment:comments){
			Reply reply = rm.findReplyById(comment.getReply().getId());
			cm.updateCommentState(comment.getId());
			replies.add(reply);
		}
		page.setRecords(replies);
		return page;
	}


}
