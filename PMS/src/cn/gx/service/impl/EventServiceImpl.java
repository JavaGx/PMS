package cn.gx.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.Event;
import cn.gx.ibatis.mapper.EventMapper;
import cn.gx.service.EventService;
@Service("eventService")
public class EventServiceImpl implements EventService{
	@Autowired
	private EventMapper em;

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void addLog(Event event) {
		em.addLog(event);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Event> logList(Integer userId) {
		return em.logList(userId);
	}
	
	
}
