package cn.gx.ibatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Warning;

@MapperScan
public interface WarningMapper {
	public List<Warning> selectWarning(@Param("state")String state);
	public Warning selectoneWarning(Integer id);
	public void updateWarningState(int id);
	public void saveWarning(Warning warning);
	public void closeWarning(int id);
	public void bestReply(@Param("rid")Integer replyId, @Param("wid")Integer warnId);
	public void updateBestReply(@Param("rid")Integer rid);
	public void updateWarn(Warning warn);
	public void replyWarning(int id);
	public void addBrowseNumber(Integer id);
	public int findWarnCount();
	public List<Warning> finsPageWarnings(@Param("beginIndex")int beginIndex, @Param("pageSize")int pageSize);
}
