package cn.gx.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.PageBean;
import cn.gx.entity.Reply;
import cn.gx.entity.Warning;
import cn.gx.ibatis.mapper.ReplyMapper;
import cn.gx.ibatis.mapper.WarningMapper;
import cn.gx.service.ReplyService;
import cn.gx.util.CommentsUtils;


@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper replyMapper;
	@Autowired
	private WarningMapper wm;

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public HashSet<Reply> selectReplyList() {
		return replyMapper.selectReplyList();
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Reply selectoneReply(int id) {
		return replyMapper.findReplyById(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public Integer saveinfo(Reply reply) {
		int row=replyMapper.saveinfo(reply);
		System.out.println("-------"+row);
		return reply.getId();
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Reply> selectReplyByWarnId(Integer wid) {
		return  replyMapper.selectReplyByWarnId(wid);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void deleteReply(Integer id) {
		replyMapper.deleteReply(id);
	}
	

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public HashMap<Reply, String> getAllComments(Integer pid){
		HashMap<Reply,String> comments =new HashMap<Reply, String>();
		HashSet<Reply> replies = replyMapper.getCommentsByPid(pid);
		comments = CommentsUtils.traversaComments(replies, pid, comments, replyMapper);
		return comments;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageBean findOwnReply(Integer userId, Integer num) {
		int count=replyMapper.findReplyCount(userId);
		PageBean pageBean=new PageBean(num, count);
		List<Reply> replies=replyMapper.findPageReply(userId,pageBean.getBeginIndex(),pageBean.getPageSize());
		for(Reply reply:replies){
			Warning warn = reply.getWarning();
			Warning warning = wm.selectoneWarning(warn.getId());
			reply.setWarning(warning);
		}
		pageBean.setRecords(replies);
		return pageBean;
	}
	
	
	
}
