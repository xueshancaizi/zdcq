package com.zdcq.s2sh.test;

import java.util.List;

import org.junit.Test;

import com.zdcq.s2sh.domain.FirstTopic;
import com.zdcq.s2sh.service.FirstTopicService;

public class FirstTopicTest extends SpringUtils{
	
	@Test
	public void testFindAllFirstTopic(){
		FirstTopicService service = (FirstTopicService) context.getBean("firstTopicService");
	    List<FirstTopic> list = service.findAllFirstTopic();
	    for(FirstTopic t:list){
	    	System.out.println(t.getName());
	    }
	}
	
	@Test
	public void testFindFirstTopicById(){
		FirstTopicService service = (FirstTopicService) context.getBean("firstTopicService");
	    FirstTopic ft = service.findFirstTopicById("79");
	    System.out.println(ft.getName());
	}
	
	@Test
	public void testUpdateFirstTopic(){
		FirstTopicService service = (FirstTopicService) context.getBean("firstTopicService");
		FirstTopic ft = new FirstTopic();
		ft.setFid("79");
		ft.setName("征地信息公开专栏123");
        service.updateFirstTopic(ft);
	}
	
	@Test
	public void testDeleteFirstTopicById(){
		FirstTopicService service = (FirstTopicService) context.getBean("firstTopicService");
        service.deleteFirstTopicById("100");
	}
	
	@Test
	public void testSaveFirstTopic(){
		FirstTopicService service = (FirstTopicService) context.getBean("firstTopicService");
        FirstTopic t = new FirstTopic();
        t.setFid("100");
        t.setName("新增栏目");
        service.saveFirstTopic(t);
	}
}
