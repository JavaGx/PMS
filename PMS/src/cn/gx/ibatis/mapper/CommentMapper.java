package cn.gx.ibatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Comment;

@MapperScan
public interface CommentMapper {

	List<Comment> getCommentInfo(Integer userId);

	void sendCommentInfo(@Param("state")int state, @Param("recipient_id")Integer id, @Param("rid")Integer rid);

	void updateCommentState(Integer id);

	int getCommentsCount(@Param("userId")Integer userId);

	List<Comment> getCommentInfoByIndex(@Param("userId")Integer userId,@Param("beginIndex") int beginIndex, @Param("pageSize")int pageSize);

}
