package cn.gx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.Department;
import cn.gx.ibatis.mapper.DepartmentMapper;
import cn.gx.service.DepartmentService;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

	@Resource
	private DepartmentMapper dm;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Department> getDepartments() {
		List<Department> departments = dm.getDepartments();
		return departments;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	public Department getDepartmentById(Integer id){
		Department department = dm.getDepartmentById(id);
		return department;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void addDepartment(Department department) {
		dm.addDepartment(department);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updateDepartment(Department department) {
		dm.updateDepartment(department);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Department> getTopList() {
		return dm.getTopList();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Department> getDepartmentsByPid(Integer id) {
		return dm.getDepartmentsByPid(id);
	}

	

}
