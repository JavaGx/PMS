package cn.gx.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.gx.entity.Chart;
import cn.gx.entity.Demand;
import cn.gx.entity.State;
import cn.gx.entity.Warning;
import cn.gx.service.DemandService;
import cn.gx.service.WarningService;

import com.google.gson.Gson;

@Controller
@RequestMapping("/data")
public class DataAction{
	@Resource 
	private WarningService ws;
	@Resource
	private DemandService ds;

	@RequestMapping("/showChart.do")
	public String showChart(Model model){
		List<Demand> demands=ds.demandList();
		HashMap<String,Integer> demandChart=new HashMap<String,Integer>();
		String[] months={"01","02","03","04","05","06","07","08","09","10","11","12"};
		List<String> monthList = Arrays.asList(months);
		monthList=new ArrayList<String>(monthList);
		for(Demand demand:demands){
			String month=demand.getStarttime().split("-")[1];
			if(Arrays.binarySearch(months, month)!=-1){
				monthList.remove(month);
			}
			if(!demandChart.containsKey(month)){
				demandChart.put(month, 1);
			}else{
				demandChart.put(month, demandChart.get(month)+1);
			}
		}
		for(String m:monthList){
			demandChart.put(m, 0);
		}
		List<Map.Entry<String, Integer>> sortList=new ArrayList<Map.Entry<String,Integer>>(demandChart.entrySet());
		Collections.sort(sortList, new Comparator<Map.Entry<String, Integer>>() {
			@Override
			public int compare(Entry<String, Integer> o1,
					Entry<String, Integer> o2) {
				return o1.getKey().compareTo(o2.getKey());
			}
		});
		
		List<Integer> demandNum=new ArrayList<Integer>();
		for(Map.Entry<String, Integer> entry:sortList){
			demandNum.add(entry.getValue());
		}
		
		
		
		List<Warning> warnlist=ws.selectWarning(State.CLOSED);
		HashMap<String,Integer> warnChart=new HashMap<String,Integer>();
		List<String> warnMonths = Arrays.asList(months);
		warnMonths=new ArrayList<String>(warnMonths);
		for(Warning warn:warnlist){
			String month=warn.getStarttime().split("-")[1];
			if(Arrays.binarySearch(months, month)!=-1){
				warnMonths.remove(month);
			}
			if(!warnChart.containsKey(month)){
				warnChart.put(month, 1);
			}else{
				warnChart.put(month, warnChart.get(month)+1);
			}
		}
		for(String m:warnMonths){
			warnChart.put(m, 0);
		}
		List<Map.Entry<String, Integer>> warnSortList=new ArrayList<Map.Entry<String,Integer>>(warnChart.entrySet());
		Collections.sort(warnSortList, new Comparator<Map.Entry<String, Integer>>() {
			@Override
			public int compare(Entry<String, Integer> o1,
					Entry<String, Integer> o2) {
				return o1.getKey().compareTo(o2.getKey());
			}
		});
		
		List<Integer> warnNum=new ArrayList<Integer>();
		for(Map.Entry<String, Integer> entry:warnSortList){
			warnNum.add(entry.getValue());
		}
		
		List<Chart> dataChart=new ArrayList<Chart>();
		dataChart.add(new Chart("Demand",demandNum));
		dataChart.add(new Chart("Warning",warnNum));
		
		String data=new Gson().toJson(dataChart);
		model.addAttribute("dataChart", data);
		
		model.addAttribute("warnNum", warnlist.size());
		return "/info/show";
	}
}
