package com.mzh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.AblumDao;
import com.mzh.dao.BgimgDao;
import com.mzh.po.Ablum;

@Component
public class BgimgService {
	@Resource
	private BgimgDao bgimgDao;

	public String getBgImg(){
		return bgimgDao.getBgImg();
	}


	
	
}
