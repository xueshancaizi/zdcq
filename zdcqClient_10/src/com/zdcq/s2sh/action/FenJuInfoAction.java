package com.zdcq.s2sh.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zdcq.s2sh.domain.FenJuInfo;
import com.zdcq.s2sh.domain.View;
import com.zdcq.s2sh.service.FenJuInfoService;

@SuppressWarnings("serial")
@Controller("fenJuInfoAction")
@Scope("prototype")
public class FenJuInfoAction extends ActionSupport implements ModelDriven<FenJuInfo>{
	@Resource(name="fenJuInfo")
    private FenJuInfo fenJuInfo;
	@Resource(name="fenJuInfoService")
    private FenJuInfoService fenJuInfoService;
   
	@Override
	public FenJuInfo getModel() {
		return this.fenJuInfo;
	}
	
	public static List<View> addViews(){
		List<View> views = new ArrayList<View>();
		View v1 = new View();
		v1.setId(1L);
		v1.setName("是");
		View v2 = new View();
		v2.setId(2L);
		v2.setName("否");
		views.add(v1);
		views.add(v2);
		return views;
	}
	
	public String showAllFenJuInfo(){
		List<FenJuInfo> list = fenJuInfoService.findAllFenJuInfo();
		ActionContext.getContext().put("fenjuinfos", list);
		
		ActionContext.getContext().put("views", FenJuInfoAction.addViews());
		return "list";
	}
	/**
	 * 跳转到修改分局信息的页面
	 * @return
	 */
	public String updateFenJuInfoUI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String fjId = request.getParameter("fjId");
		FenJuInfo info = fenJuInfoService.findFenJuInfoById(Integer.parseInt(fjId));
		ActionContext.getContext().getValueStack().push(info);
		
		ActionContext.getContext().put("views", FenJuInfoAction.addViews());
		return "edit";
	}
	/**
	 * 修改分局信息
	 * @return
	 */
	public String update(){
		fenJuInfoService.updateFenJuInfo(this.fenJuInfo);
	    this.fenJuInfo = null; 
		List<FenJuInfo> list = fenJuInfoService.findAllFenJuInfo();
		ActionContext.getContext().put("fenjuinfos", list);
		
		ActionContext.getContext().put("views", FenJuInfoAction.addViews());
		return "list";
	}
	public String findFenJuInfoUI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String fjId = request.getParameter("fjId");
		FenJuInfo info = fenJuInfoService.findFenJuInfoById(Integer.parseInt(fjId));
		ActionContext.getContext().getValueStack().push(info);
		return "view";
	}
	
	public String deleteFenJuInfo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String fjId = request.getParameter("fjId");
		fenJuInfoService.deleteFenJuInfoById(Integer.parseInt(fjId));
		List<FenJuInfo> list = fenJuInfoService.findAllFenJuInfo();
		ActionContext.getContext().put("fenjuinfos", list);
		
		ActionContext.getContext().put("views", FenJuInfoAction.addViews());
		return "list";
	}
    
	/**
	 * 添加分局信息
	 * @return
	 */
	public String add(){
		fenJuInfoService.saveFenJuInfo(this.fenJuInfo);
		List<FenJuInfo> list = fenJuInfoService.findAllFenJuInfo();
		ActionContext.getContext().put("fenjuinfos", list);
		
		ActionContext.getContext().put("views", FenJuInfoAction.addViews());
		return "list";
	}
}
