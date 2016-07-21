package com.zdcq.s2sh.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zdcq.s2sh.domain.FirstTopic;
import com.zdcq.s2sh.domain.SecondTopic;
import com.zdcq.s2sh.service.FirstTopicService;
import com.zdcq.s2sh.service.SecondTopicService;


@SuppressWarnings("serial")
@Controller("secondTopicAction")
@Scope("prototype")
public class SecondTopicAction extends ActionSupport implements ModelDriven<SecondTopic>{
	@Resource(name="secondTopicService")
	private SecondTopicService secondTopicService; 
	@Resource(name="firstTopicService")
	private FirstTopicService firstTopicService;
	@Resource(name="secondTopic")
    private SecondTopic secondTopic;

	@Override
	public SecondTopic getModel() {
		// TODO Auto-generated method stub
		return this.secondTopic;
	}
   
	public String findAllSecondTopic(){
		List<SecondTopic> list = secondTopicService.findAllSecondTopic();
		ActionContext.getContext().put("list", list);
		return "list";
	}
	
	public String updateUI(){
		String sid = ServletActionContext.getRequest().getParameter("sid");
		SecondTopic ft = secondTopicService.findSecondTopicByID(sid);
		ActionContext.getContext().getValueStack().push(ft);
		return "updateUI";
	}
	
	public String update(){
		secondTopicService.updateSecondTopic(this.secondTopic);
		List<SecondTopic> list = secondTopicService.findAllSecondTopic();
		ActionContext.getContext().put("list", list);
		return "list";
	}
	
	public String addUI(){
		List<FirstTopic> list = firstTopicService.findAllFirstTopic();
		ActionContext.getContext().put("list", list);
		return "addUI";
	}
	
	public String delete(){
		String sid = ServletActionContext.getRequest().getParameter("sid");
		secondTopicService.deleteSecondTopicById(sid);
		List<SecondTopic> list = secondTopicService.findAllSecondTopic();
		ActionContext.getContext().put("list", list);
		return "list";
	}
	
	public String add(){
		SecondTopic st = new SecondTopic();
		st.setSid(this.secondTopic.getSid());
		st.setName(this.secondTopic.getName());
		st.setFirstTopic(firstTopicService.findFirstTopicById(ServletActionContext.getRequest().getParameter("fid")));
		secondTopicService.saveSecondTopic(st);
		List<SecondTopic> list = secondTopicService.findAllSecondTopic();
		ActionContext.getContext().put("list", list);
		return "list";
	}
}
