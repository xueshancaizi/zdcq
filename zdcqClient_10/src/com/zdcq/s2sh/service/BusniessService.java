package com.zdcq.s2sh.service;

import java.util.List;

import com.zdcq.s2sh.domain.FenJuInfo;
import com.zdcq.s2sh.domain.FirstTopic;
import com.zdcq.s2sh.domain.SecondTopic;

/**
 * 
 * 核心业务类接口
 * @author panww
 *
 */
public interface BusniessService {
    /**
     * 根据分局编号查找分局信息
     * @param FenJuId
     * @return
     */
	public FenJuInfo findFenJuInfoById(int FenJuId);

	public List<FenJuInfo> findAllFenJuInfo();
	public List<FenJuInfo> findAllFenJuInfoByView();
    
	public void addFenJuInfo(FenJuInfo info);
	
	public void updateFenJuInfo(FenJuInfo info);
	
	public void deleteFenJuInfoById(int id);
	
	public List<FirstTopic> findAllFirstTopic();

	public List<SecondTopic> FindAllSecondTopic();

	public List<SecondTopic> FindAllSecondTopicByfId(String fid);

	public SecondTopic findSecondTopicByID(String sid);

	public FirstTopic findFirstTopicById(String fid);

	public void updateFirstTopic(FirstTopic ft);

	public void deleteFirstTopicById(String fid);

	public void addFirstTopic(FirstTopic model);

	public void updateSecondTopic(SecondTopic model);

	public void deleteSecondTopicById(String sid);

	public void addSecondTopic(SecondTopic st);


}
