package com.zdcq.s2sh.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdcq.s2sh.dao.FenJuInfoDao;
import com.zdcq.s2sh.domain.FenJuInfo;

@Repository("fenJuInfoDao")
public class FenJuInfoDaoImpl implements FenJuInfoDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public FenJuInfo findById(int fenJuId) {

/*		Session session = factory.openSession();
		Query query = session.createQuery("from FenJuInfo where fjId = ?");
		query.setString(0, Integer.toString(fenJuId));
		
		FenJuInfo info = (FenJuInfo) query.uniqueResult();
		session.close();	
		return info;*/
		//from User u where u.loginname=? and u.password=?
		return (FenJuInfo) this.hibernateTemplate.find("from FenJuInfo where fjId = ?", fenJuId).get(0);
	}
	/**
	 * 后台分局信息的管理
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<FenJuInfo> findAllInfo() {
		
/*		Session session = factory.openSession();
		List<FenJuInfo> list = (List<FenJuInfo>)session.createQuery("from FenJuInfo order by fjId").list();
		session.close();
		
		return list;*/
		return this.hibernateTemplate.find("from FenJuInfo order by fjId");
	}
	/**
	 * 用于导航栏的显示
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<FenJuInfo> findAllInfoByView() {
/*		Session session = factory.openSession();
		List<FenJuInfo> list = (List<FenJuInfo>)session.createQuery("from FenJuInfo where view = 1 order by fjId").list();
		session.close();
		
		return list;*/
		return this.hibernateTemplate.find("from FenJuInfo where view = 1 order by fjId");
	}
	@Override
	public void save(FenJuInfo info) {
/*		Session session = factory.openSession();
		Transaction trans =  session.beginTransaction();
		System.out.println(info.toString());
		session.save(info);
		trans.commit();
		session.close();*/
		
		this.hibernateTemplate.save(info);
		this.hibernateTemplate.flush();
		
	}
	@Override
	public void update(FenJuInfo info) {
/*		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		
		FenJuInfo fjInfo = (FenJuInfo) session.get(FenJuInfo.class, info.getFjId());
		fjInfo.setFjName(info.getFjName());
		fjInfo.setIpAddress(info.getIpAddress());
		fjInfo.setFjLocation(info.getFjLocation());
		fjInfo.setView(info.getView());
		session.update(fjInfo);
		
		trans.commit();
		session.close();*/
		this.hibernateTemplate.update(info);
		this.hibernateTemplate.flush();
		
	}
	@Override
	public void deleteByID(int id) {
/*		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		FenJuInfo fjInfo = (FenJuInfo) session.get(FenJuInfo.class, id);
		session.delete(fjInfo);
		
		trans.commit();
		session.close();*/
		FenJuInfo info = this.hibernateTemplate.load(FenJuInfo.class, id);
		this.hibernateTemplate.delete(info);
		this.hibernateTemplate.flush();
		
		
	}
	@Override
	public FenJuInfo findByfjLocation(String fjLocation) {
		
		return (FenJuInfo) this.hibernateTemplate.find("from FenJuInfo where fjLocation = ?", fjLocation).get(0);
	}


}
