package cn.gx.service;

import java.util.List;

import cn.gx.entity.Privilege;
import cn.gx.entity.Role;

public interface RoleService {

	void addRole(Role role);

	void updateRole(Role role);

	List<Role> getRoles();

	Role findRoleById(Integer roleId);

	List<Privilege> getPrivileges(Integer roleId);


	void setPrivilege(Role role, Integer[] privilegeIds);

}
