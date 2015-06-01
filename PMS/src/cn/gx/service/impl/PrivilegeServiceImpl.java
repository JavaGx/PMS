package cn.gx.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.Privilege;
import cn.gx.ibatis.mapper.PrivilegeMapper;
import cn.gx.service.PrivilegeService;

@Service
public class PrivilegeServiceImpl implements PrivilegeService {

	@Resource
	private PrivilegeMapper pm;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Privilege> getTopList() {
		return pm.getTopList();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Privilege getPrivilegeById(Integer parentId) {
		return pm.getPrivilegeById(parentId);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void addPrivilege(Privilege privilege) {
		pm.addPrivilege(privilege);
		
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updatePrivilege(Privilege privilege) {
		pm.updatePrivilege(privilege);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Privilege> getPrivileges() {
		return pm.getPrivileges();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Privilege> getPrivilegesByPid(Integer id) {
		return pm.getPrivilegesByPid(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<Privilege> findPrivilegesByIds(Integer[] privilegeIds) {
		List<Privilege> plist=new ArrayList<Privilege>();
		for(Integer id:privilegeIds){
			Privilege privilege=getPrivilegeById(id);
			plist.add(privilege);
		}
		return plist;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public List<String> findUrls() {
		List<String> urls=pm.getUrls();
		return urls;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Privilege> getCascadeList() {
		List<Privilege> cascadeList = pm.getTopList();
		if(cascadeList.size()>0){
			for(Privilege privilege:cascadeList){
				List<Privilege> cascadePrivileges = pm.getCascadePrivilege(privilege.getId());
				if(cascadePrivileges.size()>0){
					for(Privilege p:cascadePrivileges){
						List<Privilege> grandPrivileges = pm.getCascadePrivilege(p.getId());
						p.setChildren(grandPrivileges);
					}
					privilege.setChildren(cascadePrivileges);
				}
			}
			return cascadeList;
		}
		return cascadeList;
	}


}
