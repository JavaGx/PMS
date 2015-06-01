package cn.gx.controller;



import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.gx.entity.Comment;
import cn.gx.entity.Reply;
import cn.gx.entity.State;
import cn.gx.entity.Warning;
import cn.gx.service.CommentService;
import cn.gx.service.ReplyService;
import cn.gx.service.WarningService;
import cn.gx.util.SessionUtils;
import cn.gx.util.TimeUtils;

import com.google.gson.Gson;


@Controller
@RequestMapping("/reply")
public class ReplyAction {
	@Resource 
	private ReplyService replyService;
	@Resource
	private WarningService warningService;
	@Resource
	private CommentService cs;
	
	//回复
	@RequestMapping(value="/addReply.do", method = RequestMethod.POST)
	public String saveinfo(Integer wid,HttpServletRequest request, Reply reply){
		reply.setReplyPerson(SessionUtils.getUser(request));
		reply.setReplytime(TimeUtils.getTime());
		
		Warning warning = warningService.selectoneWarning(wid);
		//如果是"未处理"，改为"已回复"
		if(warning.getState().equals(State.NOT_SOLVE)){
			warningService.replyWarning(wid);
		}
		
		reply.setWarning(warning);
		
		Integer rid = replyService.saveinfo(reply);
		Comment comment=new Comment(0,warning.getApplicant());
		cs.sendCommentInfo(comment,rid);
		
		return "redirect:/warn/selectone.do?id="+wid;
	}
	
	@RequestMapping(value="/addComment.do")
	public String addComment(Integer pid,HttpServletRequest request, Reply reply,Integer wid){
		reply.setReplyPerson(SessionUtils.getUser(request));
		reply.setReplytime(TimeUtils.getTime());
		Reply parent = replyService.selectoneReply(pid);
		reply.setParentReply(parent);
		Integer rid = replyService.saveinfo(reply);
		
		Comment comment=new Comment(0,parent.getReplyPerson());
		cs.sendCommentInfo(comment,rid);
		
		return "redirect:/warn/selectone.do?id="+wid;
	}
	
	//显示回复列表
	@RequestMapping(value="/replylist.do")
	public String showlist (Model model){
		HashSet<Reply> list=replyService.selectReplyList();
		
		model.addAttribute("bestNum",list.size() );
		
		model.addAttribute("replylist",new Gson().toJson(list));
		return "/reply/bestReply";
	}
	
	
	//删除回复
	@RequestMapping(value="/deleteReply.do")
	public String delete (Integer id){
		warningService.updateBestReply(id);
		replyService.deleteReply(id);
		return "/reply/bestReply";
	}
	
	
}
