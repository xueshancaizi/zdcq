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
import com.zdcq.s2sh.service.FirstTopicService;


@SuppressWarnings("serial")
@Controller("firstTopicAction")
@Scope("prototype")
public class FirstTopicAction extends ActionSupport implements ModelDriven<FirstTopic>{
	@Resource(name="firstTopicService")
	private FirstTopicService firstTopicService;
	@Resource(name="firstTopic")
    private FirstTopic firstTopic;

	@Override
	public FirstTopic getModel() {
		return this.firstTopic;
	}
	
	public String findAllFirstTopic(){
		List<FirstTopic> list = firstTopicService.findAllFirstTopic();
		ActionContext.getContext().put("list", list);
		return "list";
	}
	
	public String updateUI(){
		String fid = ServletActionContext.getRequest().getParameter("fid");
		FirstTopic ft = firstTopicService.findFirstTopicById(fid);
		ActionContext.getContext().getValueStack().push(ft);
		return "updateUI";
	}
	
	public String update(){
		firstTopicService.updateFirstTopic(this.firstTopic);
		List<FirstTopic> list = firstTopicService.findAllFirstTopic();
		ActionContext.getContext().put("list", list);
		return "list";
	}
	
	public String delete(){
		String fid = ServletActionContext.getRequest().getParameter("fid");
		firstTopicService.deleteFirstTopicById(fid);
		List<FirstTopic> list = firstTopicService.findAllFirstTopic();
		ActionContext.getContext().put("list", list);
		return "list";
	}
	
	public String addUI(){
		
		return "addUI";
	}
	public String add(){
		firstTopicService.saveFirstTopic(this.firstTopic);
		List<FirstTopic> list = firstTopicService.findAllFirstTopic();
		ActionContext.getContext().put("list", list);
		return "list";
	}

}
