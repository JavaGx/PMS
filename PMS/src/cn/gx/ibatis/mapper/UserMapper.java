package cn.gx.ibatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import cn.gx.entity.User;
import cn.gx.entity.Warning;

@MapperScan
public interface UserMapper {

	User selectUserByUsername(String username);

	void updatePassword(@Param("username")String username, @Param("password")String password);

	User findUserById(Integer id);

	List<User> getMembers(@Param("departmentId")Integer departmentId);

	int addUser(User user);

	List<User> findUsers();

	void updateUser(User user);

	void assignUser(User user);

	void deleteUserById(@Param("userId")Integer userId);

	void settingImage(User user);

	List<Warning> findOwnWarn(Integer userId);

	int findWarnCount(Integer id);

	List<Warning> findPageWarn(@Param("beginIndex")int beginIndex, @Param("pageSize")int pageSize, @Param("id")Integer id);

	void assignGuest(User user);
	
}
