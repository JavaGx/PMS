package cn.gx.ibatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.Department;
import cn.gx.entity.Project;

@MapperScan
public interface DepartmentMapper {

	List<Department> getDepartments();
	
	Department getDepartmentById(@Param("id")Integer id);

	void addProject(Project project);

	void addDepartment(Department department);

	void updateDepartment(Department department);

	List<Department> getTopList();

	List<Department> getDepartmentsByPid(@Param("pid")Integer pid);

}
