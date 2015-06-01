package cn.gx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.gx.entity.PageBean;
import cn.gx.entity.Reply;
import cn.gx.entity.User;
import cn.gx.service.CommentService;
import cn.gx.util.SessionUtils;

@Controller
@RequestMapping("/comment")
public class CommentAction {
	
	@Resource
	private CommentService cs;

	@RequestMapping("/getCommentsCount.do")
	public void getCommentsCount(HttpServletRequest request,HttpServletResponse response) throws IOException{
		User user = SessionUtils.getUser(request);
		 int count = cs.getCommentsCount(user.getId());
		
		PrintWriter writer = response.getWriter();
		
		writer.println(count);
	}
	
	@RequestMapping("/getComments.do")
	public String getComments(HttpServletRequest request,Model model){
		User user = SessionUtils.getUser(request);
		List<Reply> commentInfo = cs.getCommentInfo(user.getId());
		
		model.addAttribute("commentInfo", commentInfo);
		return "user/usersComments";
	}
	
	@RequestMapping("/getAllComments.do")
	public String getAllComments(HttpServletRequest request,Model model,int num){
		User user = SessionUtils.getUser(request);
		PageBean pageBean = cs.getCommentInfoByIndex(user.getId(),num);
		List<Reply> commentInfo=pageBean.getRecords();
		model.addAttribute("commentInfo", commentInfo);
		model.addAttribute("num", num);
		model.addAttribute("totalPages", pageBean.getTotalPages());
		return "user/commentList";
	}
}
