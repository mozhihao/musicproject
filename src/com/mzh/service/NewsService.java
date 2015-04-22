package com.mzh.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.NewsDao;
import com.mzh.po.News;

@Component
public class NewsService {
	@Resource
	private NewsDao newsDao;

	public void addNews(News n){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		n.setTime(df.format(new Date()));
		newsDao.addNews(n);
	}
	
	public List getAllNews() { 
		return newsDao.getAllNews();
	}
	
	public News getNewsByid(int id){
		return newsDao.getNewsByid(id);
	}
	
	//统计新闻数量
	public String getNewsNum(){
		return newsDao.getNewsNum();
	}
	
	public void upNews(News news) { 
		 newsDao.upNews(news);
	}

	public void delNews(News news) { 
		newsDao.delNews(news);
	}
	
	
	
}
