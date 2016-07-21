package com.zdcq.s2sh.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;




import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor;
import com.opensymphony.xwork2.interceptor.ParametersInterceptor;
import com.zdcq.s2sh.domain.FenJuInfo;
import com.zdcq.s2sh.domain.FirstTopic;
import com.zdcq.s2sh.domain.SecondTopic;
import com.zdcq.s2sh.service.FenJuInfoService;
import com.zdcq.s2sh.service.FirstTopicService;
import com.zdcq.s2sh.service.SecondTopicService;
import com.zdcq.s2sh.util.ParameterFilterUtil;


@SuppressWarnings("serial")
@Controller("visitAction")
@Scope("prototype")
public class VisitAction extends ActionSupport {
	@Resource(name="fenJuInfoService")
	private FenJuInfoService fenJuInfoService;
	@Resource(name="firstTopicService")
    private FirstTopicService firstTopicService;
	@Resource(name="secondTopicService")
    private SecondTopicService secondTopicService;
    
	public String visitByCity(){
		HttpServletRequest request = ServletActionContext.getRequest();
		//url = 主机地址：端口地址/webapp/VisitAction_visitByCity.action?loc=jd
		//1.获得loc参数
		String loc = request.getParameter("loc");
		//2.如果参数为空
		if(loc==null||loc.equals("")){
			 ActionContext.getContext().getSession().put("fjId", "0");
		}
		
		//3.根据loc,获得分局信息，最后得到fjId,将分局信息放到Session中
		FenJuInfo fJInfo = fenJuInfoService.findByfjLocation(loc);
		ActionContext.getContext().getSession().put("fjId", fJInfo.getFjId());
		
		//4.得到所有一级栏目、二级栏目、三级栏目的信息
	    List<FirstTopic> firstList = firstTopicService.findAllFirstTopic();
	    for(FirstTopic f : firstList) {
	    	String fid = f.getFid();
	    	List<SecondTopic> secondList = secondTopicService.findAllSecondTopicByfId(fid);

	    	//将所有二级菜单栏关联到一级菜单栏上
	    	f.setSecondTopic(secondList);
	    }
	    request.setAttribute("firstList", firstList);
	    
		return "welcome_assort";
	}
	
	public String visit(){
		HttpServletRequest request = ServletActionContext.getRequest();
		//1.得到所有县市区的信息
	    List<FenJuInfo> fenJuList = fenJuInfoService.findAllFenJuInfoByView();
	    fenJuList.remove(0);//去除分局号为0的分局信息，首页显示用

	    request.setAttribute("fenJuList", fenJuList);

	   //判断系统中有没有生成session
	    String fi = (String) request.getSession().getAttribute("fjId");
	    if( fi == null ){ //第一次访问
			   //1.1默认的分局信息  ,取链表中的第一个
			   //FenJuInfo fjInfo = fenJuList.get(0);
			   //request.getSession().setAttribute("fjId", "0");
			   ActionContext.getContext().getSession().put("fjId", "0");
	    }

	   
	//2.得到所有一级栏目、二级栏目、三级栏目的信息
	    List<FirstTopic> firstList = firstTopicService.findAllFirstTopic();
	    for(FirstTopic f : firstList) {
	    	String fid = f.getFid();
	    	List<SecondTopic> secondList = secondTopicService.findAllSecondTopicByfId(fid);

	    	//将所有二级菜单栏关联到一级菜单栏上
	    	f.setSecondTopic(secondList);
	    }
	    request.setAttribute("firstList", firstList);
	//3.转发到welcome.jsp页面
		return "welcome";
	}
	
	/**
	 * 刷新页面，将该页面的session中的值进行更新
	 * @return
	 */
	public void fJXXFresh(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String fjId = request.getParameter("fjId");
		
		ActionContext.getContext().getSession().remove("fjId");
		ActionContext.getContext().getSession().put("fjId", fjId);
		ServletActionContext.getResponse().setHeader("Refresh", "0;URL="+request.getContextPath());
		
	}
	
	/**
	 * 列出具体分局下某一大类下全部小类的文章
	 * @return
	 */
	public String fjxx(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String fjId = request.getParameter("fjId");
		fjId = ParameterFilterUtil.filter(fjId);

		ActionContext.getContext().getSession().remove("fjId");
		ActionContext.getContext().getSession().put("fjId", fjId);
		System.out.println(request.getSession().getAttribute("fjId"));
		
		FenJuInfo fjInfo = fenJuInfoService.findFenJuInfoById(Integer.parseInt(fjId));
		request.setAttribute("fjInfo", fjInfo);


		//1.默认：征地信息公开专栏下的所有二级目录的子信息
		String fid = "79";
		String pfid = request.getParameter("fid");
		if(pfid!=null) {
			fid = pfid;
		}
		List<SecondTopic> secondList = secondTopicService.findAllSecondTopicByfId(fid);
		FirstTopic fTopic = firstTopicService.findFirstTopicById(fid);
		request.setAttribute("secondList", secondList);
		request.setAttribute("fTopic", fTopic);
		return "content";
	}
	/**
	 * 列出某一小类下所有的文章
	 * @return
	 */
	public String sectionInfo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		//1.获得二级菜单栏的sid
		String sid = request.getParameter("sid");

		SecondTopic st = secondTopicService.findSecondTopicByID(sid);
		String tName = st.getName();
		String fjId = request.getParameter("fjId");
		FenJuInfo fjInfo = fenJuInfoService.findFenJuInfoById(Integer.parseInt(fjId));
		request.setAttribute("fjInfo", fjInfo);
		
        request.setAttribute("sid", sid);
        request.setAttribute("tName", tName);
		//3.转发到section.jsp页面	
		return "section";
	}
    
	/**
	 * 具体的新闻内容
	 * @return
	 */
	public String showNewsDetail(){
		HttpServletRequest request = ServletActionContext.getRequest();
		//1.得到所有县市区的信息, 用于导航栏
	    List<FenJuInfo> fenJuList = fenJuInfoService.findAllFenJuInfoByView();
	    fenJuList.remove(0);
	    request.setAttribute("fenJuList", fenJuList);
	    //2.
	    String newsId = request.getParameter("newsId");
	    request.setAttribute("newsId", newsId);

	    String sid = request.getParameter("sid");
	    request.setAttribute("sid", sid);
	    
	    //3.根据指定的分局Id获得分局的信息
		String fjId = request.getParameter("fjId");
		
		FenJuInfo fjInfo = fenJuInfoService.findFenJuInfoById(Integer.parseInt(fjId));
		request.setAttribute("fjInfo", fjInfo);
		
	    //4.
		return "news";
	}
	
	/**
	 * 由新闻页面返回首页面
	 * @return
	 */
	public String reVisit(){
		HttpServletRequest request = ServletActionContext.getRequest();
		//1.得到所有县市区的信息
	    List<FenJuInfo> fenJuList = fenJuInfoService.findAllFenJuInfoByView();
	    fenJuList.remove(0);
	    request.setAttribute("fenJuList", fenJuList);
         
	    String fjId = request.getParameter("fjId");
	    //request.getSession().setAttribute("fjId", fjId);
	    ActionContext.getContext().getSession().put("fjId", fjId);
	    //2.得到所有一级栏目、二级栏目、三级栏目的信息
	    List<FirstTopic> firstList = firstTopicService.findAllFirstTopic();
	    for(FirstTopic f : firstList) {
	    	String fid = f.getFid();
	    	List<SecondTopic> secondList = secondTopicService.findAllSecondTopicByfId(fid);
	    	//将所有二级菜单栏关联到一级菜单栏上
	    	f.setSecondTopic(secondList);
	    }
	    request.setAttribute("firstList", firstList);
	    
	    //3.转发到welcome2.jsp页面
		return "reVisit";
	}
}
