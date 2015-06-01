package cn.gx.ibatis.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Privilege;
import cn.gx.entity.Role;

@MapperScan
public interface RoleMapper {

	void addRole(Role role);

	void updateRole(Role role);

	List<Role> getRoles();

	Role findRoleById(@Param("roleId")Integer roleId);

	ArrayList<Privilege> getPrivileges(Integer roleId);

	void setPrivilege(@Param("roleId")Integer roleId, @Param("privilegeId")Integer privilegeId);
	
	void deletePrivilege(@Param("roleId")Integer roleId, @Param("privilegeId")Integer privilegeId);
}
