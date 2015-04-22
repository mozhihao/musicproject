package com.mzh.po;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class News {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int News_id;
	private String News_title;
	private String News_content;
	private String time;
	public int getNews_id() {
		return News_id;
	}
	public void setNews_id(int news_id) {
		News_id = news_id;
	}
	public String getNews_title() {
		return News_title;
	}
	public void setNews_title(String news_title) {
		News_title = news_title;
	}
	public String getNews_content() {
		return News_content;
	}
	public void setNews_content(String news_content) {
		News_content = news_content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	

}
