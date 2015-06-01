package cn.gx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.gx.entity.PageBean;
import cn.gx.entity.Warning;
import cn.gx.ibatis.mapper.WarningMapper;
import cn.gx.service.WarningService;


@Service("warningService")
public class WarningServiceImpl implements WarningService {
	
	@Resource
	private WarningMapper warningMapper;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<Warning> selectWarning(String state) {
		return warningMapper.selectWarning(state);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public Warning selectoneWarning(Integer id) {
		return warningMapper.selectoneWarning(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updateWarningState(int id) {
		warningMapper.updateWarningState(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void replyWarning(int id) {
		warningMapper.replyWarning(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void saveWarning(Warning warning) {
		warningMapper.saveWarning(warning);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void closeWarning(int id) {
		warningMapper.closeWarning(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void bestReply(Integer replyId, Integer warnId) {
		warningMapper.bestReply(replyId,warnId);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updateBestReply(Integer rid) {
		warningMapper.updateBestReply(rid);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	@Override
	public void updateWarn(Warning warn) {
		warningMapper.updateWarn(warn);
	}

	@Override
	public void addBrowseNumber(Integer id) {
		warningMapper.addBrowseNumber(id);
	}

	@Override
	public PageBean findWarningsByPageIndex(int num) {
		int count = warningMapper.findWarnCount();
		PageBean page=new PageBean(num, count);
		List<Warning> warnings = warningMapper.finsPageWarnings(page.getBeginIndex(),page.getPageSize());
		page.setRecords(warnings);
		return page;
	}

}


