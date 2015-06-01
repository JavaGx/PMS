package cn.gx.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import cn.gx.entity.PageBean;
import cn.gx.entity.Reply;

public interface ReplyService {
	
	public Reply selectoneReply(int id);

	public Integer saveinfo(Reply reply);

	public List<Reply> selectReplyByWarnId(Integer wid);

	public HashSet<Reply> selectReplyList();

	public void deleteReply(Integer id);

	HashMap<Reply, String> getAllComments(Integer pid);

	public PageBean findOwnReply(Integer userId, Integer num);
}
