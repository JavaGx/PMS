package cn.gx.ibatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Privilege;

@MapperScan
public interface PrivilegeMapper {


	List<Privilege> getTopList();

	Privilege getPrivilegeById(Integer id);

	void addPrivilege(Privilege privilege);

	void updatePrivilege(Privilege privilege);

	List<Privilege> getPrivileges();

	List<Privilege> getPrivilegesByPid(@Param("pid")Integer pid);

	List<String> getUrls();


	List<Privilege> getCascadePrivilege(Integer id);

}
