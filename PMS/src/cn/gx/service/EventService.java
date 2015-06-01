package cn.gx.service;

import java.util.List;

import cn.gx.entity.Event;

public interface EventService {
	public void addLog(Event event);

	public List<Event> logList(Integer userId);
}
