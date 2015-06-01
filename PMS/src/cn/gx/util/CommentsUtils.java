package cn.gx.util;

import java.util.HashMap;
import java.util.HashSet;

import cn.gx.entity.Reply;
import cn.gx.ibatis.mapper.ReplyMapper;

public class CommentsUtils {

	public static HashMap<Reply,String> traversaComments(HashSet<Reply> replies,Integer pid,HashMap<Reply,String> comments,ReplyMapper replyMapper){
		
		while(replies!=null&&replies.size()>0){
			Reply parentReply = replyMapper.findReplyById(pid);
			for(Reply reply:replies){
				comments.put(reply, parentReply.getReplyPerson().getUsername());
				replies = replyMapper.getCommentsByPid(reply.getId());
				traversaComments(replies,reply.getId(),comments,replyMapper);
				
			}
		}
		
		return comments;
	}
}
