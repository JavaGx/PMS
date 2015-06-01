package cn.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.Demand;
import cn.gx.ibatis.mapper.DemandMapper;
import cn.gx.service.DemandService;



@Service("demandService")
@Transactional
public class DemandServiceImpl implements DemandService {
	@Autowired
	private DemandMapper demandMapper;

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void addDemand(Demand demand) {
		demandMapper.addDemand(demand);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updateDemand(Demand demand) {
		demandMapper.updateDemand(demand);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Demand> getDemands(Integer projectId) {
		return demandMapper.getDemands(projectId);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Demand> demandList() {
		return demandMapper.demandList();
	}

	

}


