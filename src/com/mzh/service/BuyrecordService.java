package com.mzh.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.AblumDao;
import com.mzh.dao.BuyrecordDao;
import com.mzh.dao.MusicDao;
import com.mzh.po.Ablum;
import com.mzh.po.Buyrecord;
import com.mzh.po.Music;

@Component
public class BuyrecordService {
	@Resource
	private BuyrecordDao buyrecordDao;
	@Resource
	private AblumDao ablumDao;
	@Resource
	private MusicDao musicDao;
	
	/**
	 * 获取记录
	 * @param userId
	 * @return
	 */
	public List<Ablum> getAblumRecordByUserId(int userId) { 
		List<Buyrecord> list=buyrecordDao.getRecordByUserId(userId);
		List<Ablum> ablum =new ArrayList<Ablum>();
		for(Buyrecord tmp:list){
			if(tmp.getAblumid()!=0){
				ablum.add(ablumDao.getAblumById(tmp.getAblumid()));
			}
		}
		return ablum;
	}
	
	/**
	 * 获取音乐记录
	 * @param userId
	 * @return
	 */
	public List<Music> getMusicRecordByUserId(int userId) { 
		List<Buyrecord> list=buyrecordDao.getRecordByUserId(userId);
		List<Music> music =new ArrayList<Music>();
		for(Buyrecord tmp:list){
			if(tmp.getMusicid()!=0){
				music.add(musicDao.getMusicByid(tmp.getMusicid()));
			}
		}
		return music;
		
	}
	/**
	 * 添加记录，购买时添加
	 * @param buyrecord
	 */
	public void saveRecord(Buyrecord buyrecord) {  
		buyrecordDao.saveRecord(buyrecord);
	}
	
	public Buyrecord getRecordById(int brid) { 
		if(	 buyrecordDao.getRecordById(brid).size()<1){
			return null;
		}
		
			return  (Buyrecord) buyrecordDao.getRecordById(brid).get(0);
	}
	
	 public void upRecord(Buyrecord buyrecord) {  
		 buyrecordDao.upRecord(buyrecord);
	 }
	
	public List<Buyrecord> getRecordByUserId(int userId) { 
		return buyrecordDao.getRecordByUserId(userId);
	}
	public List getRecordByUserIdState(int userId) {
		return buyrecordDao.getRecordByUserIdState(userId);
	}
	public List getRecordByUserIdState0(int userId) {
		return buyrecordDao.getRecordByUserIdState0(userId);
	}
	
	public BuyrecordDao getBuyrecordDao() {
		return buyrecordDao;
	}

	public void setBuyrecordDao(BuyrecordDao buyrecordDao) {
		this.buyrecordDao = buyrecordDao;
	}

	public void delRecord(Buyrecord buyrecord){
		buyrecordDao.delRecord(buyrecord);
	}
	
	public AblumDao getAblumDao() {
		return ablumDao;
	}

	public void setAblumDao(AblumDao ablumDao) {
		this.ablumDao = ablumDao;
	}

	public MusicDao getMusicDao() {
		return musicDao;
	}

	public void setMusicDao(MusicDao musicDao) {
		this.musicDao = musicDao;
	}
	
	
}
