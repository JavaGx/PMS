package cn.gx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.PageBean;
import cn.gx.entity.User;
import cn.gx.entity.Warning;
import cn.gx.ibatis.mapper.UserMapper;
import cn.gx.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper up;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public User selectUserByUsername(String username) {
		User user=up.selectUserByUsername(username);
		return user;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updatePassword(User user) {
		up.updatePassword(user.getUsername(),user.getPassword());
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public User findUserById(Integer id) {
		return up.findUserById(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<User> getMembers(Integer departmentId) {
		// TODO Auto-generated method stub
		return up.getMembers(departmentId);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public Integer register(User user) {
		int row = up.addUser(user);
		System.out.println("---------"+row);
		return user.getId();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<User> findUsers() {
		return up.findUsers();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updateUser(User user) {
		up.updateUser(user);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void assignUser(User user) {
		up.assignUser(user);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void deleteUser(Integer userId) {
		up.deleteUserById(userId);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void settingImage(User user) {
		up.settingImage(user);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public PageBean findPageWarn(int num, Integer id) {
		int count=up.findWarnCount(id);
		PageBean bean=new PageBean(num, count);
		List<Warning> warns= up.findPageWarn(bean.getBeginIndex(),bean.getPageSize(),id);
		bean.setRecords(warns);
		return bean;
	}

	@Override
	public void assignGuest(User user) {
		up.assignGuest(user);
	}

}
