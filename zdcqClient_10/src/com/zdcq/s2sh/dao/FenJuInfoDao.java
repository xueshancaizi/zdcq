package com.zdcq.s2sh.dao;

import java.util.List;

import com.zdcq.s2sh.domain.FenJuInfo;

/**
 * 分局信息Dao层核心接口
 * @author m3800
 *
 */
public interface FenJuInfoDao {
    /**
     * 根据分局ID号查找分局的信息
     * @param fenJuId
     * @return
     */
	FenJuInfo findById(int fenJuId);
    /**
     * 找到所有的分局信息，根据ID号进行排序
     * @return
     */
	List<FenJuInfo> findAllInfo();
	/**
	 * 只有view为可显示时，才将记录取出
	 * @return
	 */
	List<FenJuInfo> findAllInfoByView();
	/**
	 * 新增分局信息
	 */
    void save(FenJuInfo info);
    /**
     * 修改分局信息
     */
    void update(FenJuInfo info);
    /**
     * 根据ID号删除分局信息
     */
    void deleteByID(int id);
    /**
     * 根据分局Location查找分局的信息
     */
    FenJuInfo findByfjLocation(String fjLocation);

}
