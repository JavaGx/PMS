package cn.gx.service;

import java.util.List;

import cn.gx.entity.Department;
import cn.gx.entity.Project;
import cn.gx.entity.Role;

public interface DepartmentService {

	List<Department> getDepartments();

	Department getDepartmentById(Integer id);

	void addDepartment(Department department);

	void updateDepartment(Department department);

	List<Department> getTopList();

	List<Department> getDepartmentsByPid(Integer id);

	
}
