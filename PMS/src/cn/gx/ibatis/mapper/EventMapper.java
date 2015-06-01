package cn.gx.ibatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Event;
@MapperScan
public interface EventMapper {
	public void addLog(Event event);

	public List<Event> logList(@Param("userId")Integer userId);
}
