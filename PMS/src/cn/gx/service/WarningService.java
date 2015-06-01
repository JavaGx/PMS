package cn.gx.service;

import java.util.List;

import cn.gx.entity.PageBean;
import cn.gx.entity.Warning;


public interface WarningService {
	
	public Warning selectoneWarning(Integer id);
	public void updateWarningState(int id);
	public void saveWarning(Warning warning);
	public void closeWarning(int id);
	public List<Warning> selectWarning(String state);
	public void bestReply(Integer replyId, Integer warnId);
	public void updateBestReply(Integer rid);
	public void updateWarn(Warning warn);
	void replyWarning(int id);
	public void addBrowseNumber(Integer id);
	public PageBean findWarningsByPageIndex(int num);
}
