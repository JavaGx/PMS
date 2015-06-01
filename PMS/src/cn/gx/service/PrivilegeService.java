package cn.gx.service;

import java.util.List;

import cn.gx.entity.Privilege;

public interface PrivilegeService {

	List<Privilege> getTopList();

	Privilege getPrivilegeById(Integer parentId);

	void addPrivilege(Privilege privilege);

	void updatePrivilege(Privilege privilege);

	List<Privilege> getPrivileges();

	List<Privilege> getPrivilegesByPid(Integer id);

	List<String> findUrls();
	
	List<Privilege> findPrivilegesByIds(Integer[] privilegeIds);

	List<Privilege> getCascadeList();
}
