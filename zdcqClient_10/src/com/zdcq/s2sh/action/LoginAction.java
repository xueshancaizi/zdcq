package com.zdcq.s2sh.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.security.sasl.AuthenticationException;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zdcq.s2sh.domain.User;
import com.zdcq.s2sh.service.LoginService;
import com.zdcq.s2sh.service.UserService;
import com.zdcq.s2sh.util.MD5Util;
import com.zdcq.s2sh.util.ParameterFilterUtil;

@SuppressWarnings("serial")
@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends ActionSupport implements ModelDriven<User>{
	@Resource(name="user")
	private User user;

	@Override
	public User getModel() {
		return this.user;
	}
	
	public String login(){
		Subject subject = SecurityUtils.getSubject();
		String loginName = this.getModel().getLoginname();
		loginName = ParameterFilterUtil.filter(loginName);
		
		String password = this.getModel().getPassword();
		password = ParameterFilterUtil.filter(password);
		
		UsernamePasswordToken token = new UsernamePasswordToken(
				                       loginName,MD5Util.md5(password));
		try {
			subject.login(token);
		} catch (UnknownAccountException e) {
			this.addActionError("该用户名不存在或密码错误");
			return INPUT;
		}
		return "home";
	}
	
	
}
