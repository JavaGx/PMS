package cn.gx.service;

import java.util.List;

import cn.gx.entity.PageBean;
import cn.gx.entity.User;
import cn.gx.entity.Warning;

public interface UserService {

	User selectUserByUsername(String username);

	void updatePassword(User user);

	User findUserById(Integer id);

	List<User> getMembers(Integer departmentId);

	Integer register(User user);

	List<User> findUsers();

	void updateUser(User user);

	void assignUser(User user);

	void deleteUser(Integer userId);

	void settingImage(User user);

	PageBean findPageWarn(int num, Integer id);

	void assignGuest(User user);

}
