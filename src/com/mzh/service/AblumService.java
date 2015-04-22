package com.mzh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.AblumDao;
import com.mzh.po.Ablum;

@Component
public class AblumService {
	@Resource
	private AblumDao ablumDao;

	public AblumDao getAblumDao() {
		return ablumDao;
	}

	public void setAblumDao(AblumDao ablumDao) {
		this.ablumDao = ablumDao;
	}

	public void addAblum(Ablum a){
		System.out.println("service层"+a.getAlbumPic());
		ablumDao.addAblum(a);
	}
	
	public List getAllAblum() { 
		return ablumDao.getAllAblum();
	}
	public List getAblumByHot(){
		return ablumDao.getAblumByHot();
	}
	
	public void upAblum(Ablum ablum) { 
		 ablumDao.upAblum(ablum);
	}
	/**
	 * 	后台专用
	 * @param albumName
	 * @return
	 */
	public List getAllCommentAblum(){
		return ablumDao.getAllCommentAblum();
	}
	
	public String getAblumNum(){
		return ablumDao.getAblumNum();
	}

	public List getAllCommentAblumbyKey(String key){
		return ablumDao.getAllCommentAblumbyKey(key);
	}
	
	public List getAblumByName(String albumName) { 
		return ablumDao.getAblumByName(albumName);
	}
	public Ablum getAblumById(int id) { 
		return ablumDao.getAblumById(id);
	}
	
	public List<Ablum> getAblumBydownloadNum() { 
		return ablumDao.getAblumBydownloadNum();
	}
	
	
}
