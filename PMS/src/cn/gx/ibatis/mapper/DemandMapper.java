package cn.gx.ibatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Demand;


@MapperScan
public interface DemandMapper {

	void addDemand(Demand demand);

	void updateDemand(Demand demand);

	List<Demand> getDemands(Integer projectId);

	List<Demand> demandList();
}
