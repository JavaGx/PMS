package cn.gx.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.Privilege;
import cn.gx.entity.Role;
import cn.gx.ibatis.mapper.RoleMapper;
import cn.gx.service.RoleService;
import cn.gx.util.PrivilegeUtils;

@Service
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleMapper rm;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void addRole(Role role) {
		rm.addRole(role);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updateRole(Role role) {
		rm.updateRole(role);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Role> getRoles() {
		return rm.getRoles();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Role findRoleById(Integer roleId) {
		return rm.findRoleById(roleId);
	}

	@Override
	public List<Privilege> getPrivileges(Integer roleId) {
		return rm.getPrivileges(roleId);
	}

	@Override
	public void setPrivilege(Role role,Integer[] privilegeIds) {
		List<Integer> pids=new ArrayList<Integer>(Arrays.asList(privilegeIds));
		List<Integer> temp=new ArrayList<Integer>(Arrays.asList(privilegeIds));
		List<Privilege> old= rm.getPrivileges(role.getId());//数据库数据
		if(old.size()<1){
			if(pids.size()>0){
				for(Integer pid:pids){
					rm.setPrivilege(role.getId(), pid);
				}
				return ;
			}
		}
		List<Integer> data = PrivilegeUtils.getPrivilegeIds(old);
		if(pids.size()>0){
			if(pids.removeAll(data)){
				if(pids.size()>0){
					for(Integer pid:pids){
						rm.setPrivilege(role.getId(), pid);
					}
				}
			}
			
			if(data.removeAll(temp)){
				if(data.size()>0){
					for(Integer p:data){
						rm.deletePrivilege(role.getId(), p);
					}
				}
			}
				
		}
		
	}

}
