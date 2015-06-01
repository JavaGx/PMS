package cn.gx.service;

import java.util.List;

import cn.gx.entity.Project;

public interface ProjectService {

	void addProject(Project project);

	Project getProjectByUserId(Integer userId);

	List<Project> getProjects();

	Project getProject(Integer id);

	void updateProject(Project project);

	List<Project> searchProject(Project project);
}
