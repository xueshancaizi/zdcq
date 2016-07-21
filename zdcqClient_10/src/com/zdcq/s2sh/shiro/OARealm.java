package com.zdcq.s2sh.shiro;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.zdcq.s2sh.domain.User;
import com.zdcq.s2sh.service.LoginService;
import com.zdcq.s2sh.service.impl.LoginServiceImpl;

public class OARealm extends AuthorizingRealm{
    
	@Resource(name="loginService")
	private LoginService loginService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}
    /**
     * 完成认证
     */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		//得到含有username和password的token
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken)token;
		String username = usernamePasswordToken.getUsername();
		User user = this.loginService.getUserByUsername(username);
		//System.out.println(user.toString());
		if(user == null){
			return null;
		} else {
			//把对象的信息封装到该对象中
			AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(), getName());
			return authenticationInfo;
		}
		
	}

}
