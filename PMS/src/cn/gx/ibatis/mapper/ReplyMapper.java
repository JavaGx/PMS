package cn.gx.ibatis.mapper;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Reply;

@MapperScan
public interface ReplyMapper {

	public Reply findReplyById(int id);
	
	public Integer saveinfo(Reply reply);

	public ArrayList<Reply> selectReplyByWarnId(@Param("wid")Integer wid);

	public HashSet<Reply> selectReplyList();

	public void deleteReply(Integer id);

	public HashSet<Reply> getCommentsByPid(Integer pid);

	public void updateCommentState();

	public int findReplyCount(@Param("userId")Integer userId);

	public List<Reply> findPageReply(@Param("userId")Integer userId,@Param("beginIndex")int beginIndex, @Param("pageSize")int pageSize);
}
