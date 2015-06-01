package cn.gx.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.gx.entity.Event;
import cn.gx.entity.User;
import cn.gx.service.EventService;
import cn.gx.util.SessionUtils;
import cn.gx.util.TimeUtils;

@Controller
@RequestMapping("/event")
public class EventAction {
	@Resource
	private EventService es;
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(){
		
		return "/event/index";
	}
	
	
	@RequestMapping(value = "/addLogUI.do")
	public String addLogUI(String eventDate,Model model){
		model.addAttribute("eventDate", eventDate);
		return "/event/addLog";
	}
	
	@RequestMapping(value = "/addLog.do")
	public String addLog(Event event,HttpServletRequest request){
		User user=SessionUtils.getUser(request);
		event.setApplicant(user);
		event.setStartdate(TimeUtils.getTime());
		es.addLog(event);
		return "/event/index";
	}
	
	@RequestMapping(value = "/logList.do")
	public String logList(Model model,HttpServletRequest request){
		List<Event> eventsList=es.logList(SessionUtils.getUser(request).getId());
		HashMap<String, List<Event>> eventMap=new HashMap<String, List<Event>>();
		for(Event event:eventsList){
			String startdate=event.getStartdate();
			String key=startdate.split(" ")[0];
			if(!eventMap.containsKey(key)){
				List<Event> eventList=new ArrayList<Event>();
				eventList.add(event);
				eventMap.put(key, eventList);
			}else{
				List<Event> list = eventMap.get(key);
				list.add(event);
			}
		}
		
		for(Map.Entry<String, List<Event>> entry:eventMap.entrySet()){
			List<Event> list = entry.getValue();
			Collections.sort(list, new Comparator<Event>(){

				@Override
				public int compare(Event o1, Event o2) {
					return o2.getStartdate().compareTo(o1.getStartdate());
				}
				
			});
		}
		
		List<Map.Entry<String, List<Event>>>  events=
				new ArrayList<Map.Entry<String, List<Event>>>(eventMap.entrySet());
		Collections.sort(events, new Comparator<Map.Entry<String, List<Event>>>(){

			@Override
			public int compare(Entry<String, List<Event>> o1,
					Entry<String, List<Event>> o2) {
				return o2.getKey().compareTo(o1.getKey());
			}

    	});
		
		model.addAttribute("events", events);
		return "/event/logList";
	}
	
	
}