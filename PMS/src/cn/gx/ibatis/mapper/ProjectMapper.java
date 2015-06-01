package cn.gx.ibatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Project;

@MapperScan
public interface ProjectMapper {

	void addProject(Project project);

	Project getProjectByUserId(@Param("userId")Integer userId);

	List<Project> getProjects();

	Project getProjectById(Integer id);

	void updateProject(Project project);

	List<Project> searchProject(Project project);
}
