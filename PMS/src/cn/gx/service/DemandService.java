package cn.gx.service;

import java.util.List;

import cn.gx.entity.Demand;


public interface DemandService {

	void addDemand(Demand demand);

	void updateDemand(Demand demand);

	List<Demand> getDemands(Integer projectId);

	List<Demand> demandList();

}
