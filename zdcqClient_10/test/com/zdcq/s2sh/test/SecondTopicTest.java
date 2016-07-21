package com.zdcq.s2sh.test;

import java.util.List;

import org.junit.Test;

import com.zdcq.s2sh.domain.FirstTopic;
import com.zdcq.s2sh.domain.SecondTopic;
import com.zdcq.s2sh.service.SecondTopicService;

public class SecondTopicTest extends SpringUtils {
	@Test
	public void testFindAllSecondTopic(){
		SecondTopicService service = (SecondTopicService) context.getBean("secondTopicService");
		List<SecondTopic> list = service.findAllSecondTopic();
		
		for(SecondTopic st:list){
			System.out.println(st.getName());
		}
	}
	@Test
	public void testFindAllSecondTopicByfId(){
		SecondTopicService service = (SecondTopicService) context.getBean("secondTopicService");
		List<SecondTopic> list = service.findAllSecondTopicByfId("79");
		
		for(SecondTopic st:list){
			System.out.println(st.getName());
		}
	}
	@Test
	public void testFindSecondTopicByID(){
		SecondTopicService service = (SecondTopicService) context.getBean("secondTopicService");
		SecondTopic st = service.findSecondTopicByID("63");
	    System.out.println(st.getName());
	}
	@Test
	public void testSaveSecondTopic(){
		SecondTopicService service = (SecondTopicService) context.getBean("secondTopicService");
		SecondTopic st = service.findSecondTopicByID("63");
	    System.out.println(st.getName());
	}
	
	@Test
	public void testUpdateSecondTopic(){
		SecondTopicService service = (SecondTopicService) context.getBean("secondTopicService");
		SecondTopic st = new SecondTopic();
		st.setSid("100");
		st.setName("征地有关法律法规政策1");
		FirstTopic ft = new FirstTopic();
		ft.setFid("80");
		st.setFirstTopic(ft);
		service.saveSecondTopic(st);
				
	}
}
