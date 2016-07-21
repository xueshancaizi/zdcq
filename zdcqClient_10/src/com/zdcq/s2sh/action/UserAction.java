package com.zdcq.s2sh.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zdcq.s2sh.domain.Hobby;
import com.zdcq.s2sh.domain.User;
import com.zdcq.s2sh.service.UserService;
import com.zdcq.s2sh.util.MD5Util;
import com.zdcq.s2sh.util.UploadUtil;

@SuppressWarnings("serial")
@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	private File resource;
    private String resourceContentType;  //类型
    private String resourceFileName;     //文件名称
    
    @Resource(name="userService")
    private UserService userService;
    @Resource(name="user")
	private User user;
    private Long[] hids;
    

	public Long[] getHids() {
		return hids;
	}

	public void setHids(Long[] hids) {
		this.hids = hids;
	}

	@Override
	public User getModel() {
		return this.user;
	}
    
	/**
	 * 上传文件的资源
	 * @return
	 */
	public File getResource() {
		return resource;
	}

	public void setResource(File resource) {
		this.resource = resource;
	}
    /**
    * 上传文件资源类型
    * @return
    */
	public String getResourceContentType() {
		return resourceContentType;
	}

	public void setResourceContentType(String resourceContentType) {
		this.resourceContentType = resourceContentType;
	}
    /**
     * 上传文件资源名称
     * @return
     */
	public String getResourceFileName() {
		return resourceFileName;
	}

	public void setResourceFileName(String resourceFileName) {
		this.resourceFileName = resourceFileName;
	}

	public List<Hobby> addHobbies(){
		//爱好
		List<Hobby> hobbies = new ArrayList<Hobby>();
		Hobby h1 = new Hobby();
		h1.setHid(1L);
		h1.setName("电影");
		
		Hobby h2 = new Hobby();
		h2.setHid(2L);
		h2.setName("旅游");
		
		Hobby h3 = new Hobby();
		h3.setHid(3L);
		h3.setName("健身");
		
		Hobby h4 = new Hobby();
		h4.setHid(4L);
		h4.setName("购物");
		
		hobbies.add(h1);
		hobbies.add(h2);
		hobbies.add(h3);
		hobbies.add(h4);
		
		return hobbies;
	}
	/**
	 * 显示所有注册用户的信息
	 * @return
	 */
	public String showAllUsers(){
		List<User> users = userService.getAllUser();
		ActionContext.getContext().put("list", users);
		return "list";
	}
	
	/**
	 * 根据用户ID,查找用户的具体信息
	 * @return
	 */
	public String findUserUI(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String userId = request.getParameter("userID");
		User user = userService.getUserById(Long.parseLong(userId));
		ActionContext.getContext().put("user", user);
		
		//爱好--下拉列表checkbox
		ActionContext.getContext().put("hobbies", addHobbies());
		/**
		 * 爱好的回显
		 */
		String[] strings = user.getInterest().split(","); 
		this.hids = new Long[strings.length];
		int index = 0;
		for(String s: strings){
			this.hids[index] = Long.parseLong(s);
			index++;
		}
		return "view";
	}
	public String updateUserUI(){
		/**
		 * 填充--爱好的下拉列表框checkBok
		 */
		ActionContext.getContext().put("hobbies", addHobbies());
		
		/**
		 * 因为user对象中的属性要回显，所以user应该放入到对象栈中
		 */
		User user = userService.getUserById(this.user.getUserID());
		ActionContext.getContext().getValueStack().push(user);
		
		/**
		 * 爱好的回显
		 * 那hids中的内容赋值给model
		 * hids = [1,2,3]
		 * temp = "1,2,3";
		 */
		String[] strings = user.getInterest().split(","); 
		this.hids = new Long[strings.length];
		int index = 0;
		for(String s: strings){
			this.hids[index] = Long.parseLong(s);
			index++;
		}
		return "updateUI";
	}
	
    public String update() {
		/**
		 * 那hids中的内容赋值给model
		 * hids = [1,2,3]
		 * temp = "1,2,3";
		 */
		String temp = "";
		for(int i=0;i<this.hids.length;i++){
			if(i<this.hids.length-1){
				temp = temp+this.hids[i]+",";
			}else{
				temp = temp+this.hids[i];
			}
		}
		//把爱好的id的值赋值给Interest
		this.getModel().setInterest(temp);
		this.userService.updateUser(this.getModel());
		return null;
    }
    
    /**
     * 跳转到用户添加界面
     * @return
     */
    public String addUserUI(){
		List<Hobby> hobbies = addHobbies();
		ActionContext.getContext().put("hobbies", hobbies);
    	return "addUserUI";
    }

    /**
     * 添加用户
     * @return
     */
    public String addUser(){
    	User user = new User();
    	user = this.user;
        user.setPassword(MD5Util.md5(user.getPassword())); /*用户密码采用MD5进行加密*/
		/**把爱好的id的值赋值给Interest
		 * 那hids中的内容赋值给model
		 * hids = [1,2,3]
		 * temp = "1,2,3";
		 */
		String temp = "";
		for(int i=0;i<this.hids.length;i++){
			if(i<this.hids.length-1){
				temp = temp+this.hids[i]+",";
			}else{
				temp = temp+this.hids[i];
			}
		}
		user.setInterest(temp);
		user.setFilename(resourceFileName);
		user.setPath(UploadUtil.saveUploadFile(resource));
    	boolean bool;
    	bool = userService.saveUser(user);
    	
    	if(bool){
    	//若注册成功，则跳转到用户管理界面
		List<User> users = userService.getAllUser();
		ActionContext.getContext().put("list", users);
		return "list";
    	}else{
    		return INPUT;
    	}
		
    }
    
    /**
     * 检查注册名是否已经注册
     */
    public void checkLoginname(){
    	//获得注册名
    	String loginname = ServletActionContext.getRequest().getParameter("loginname");
    	
    	HttpServletResponse response = ServletActionContext.getResponse();
    	response.setContentType("text/html;charset=utf-8"); //必须设置，POST请求会产生中文乱码
    	try {
			PrintWriter out = response.getWriter();
	    	boolean bool = userService.checkUserByLoginname(loginname);
	    	if(bool){
	    		out.println("<span style='color: #C00'>该名称已被注册<span>");
	    	}else{
	    		out.println("<span style='color: #3D882D'>恭喜，该名称可注册<span>");
	    	}
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    /**
     * 删除用户的信息
     * @return
     */
    public String delete(){
    	String userID = ServletActionContext.getRequest().getParameter("userID");
    	Long uID = Long.valueOf(userID);
    	userService.deleteUser(uID);
    	//删除之后跳转到用户管理界面
		List<User> users = userService.getAllUser();
		ActionContext.getContext().put("list", users);
		return "list";
    }
    /**
     * 文件下载
     * @return
     */
    public String download(){
    	
    	return null;
    }
}
