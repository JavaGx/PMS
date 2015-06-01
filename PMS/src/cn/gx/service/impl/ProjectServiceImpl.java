package cn.gx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.Project;
import cn.gx.ibatis.mapper.ProjectMapper;
import cn.gx.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectMapper pm;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void addProject(Project project) {
		pm.addProject(project);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Project getProjectByUserId(Integer userId) {
		return pm.getProjectByUserId(userId);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Project> getProjects() {
		List<Project> projects=pm.getProjects();
		return projects;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Project getProject(Integer id) {
		return pm.getProjectById(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updateProject(Project project) {
		pm.updateProject(project);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Project> searchProject(Project project) {
		return pm.searchProject(project);
	}

}
