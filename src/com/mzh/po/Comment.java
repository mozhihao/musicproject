package com.mzh.po;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int comment_id;
	private int ablum_id;
	private String comment_time;
	private String comment;
	private String user_name;
	private String ablum_name;
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_time() {
		return comment_time;
	}
	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getAblum_name() {
		return ablum_name;
	}
	public void setAblum_name(String ablum_name) {
		this.ablum_name = ablum_name;
	}
	public int getAblum_id() {
		return ablum_id;
	}
	public void setAblum_id(int ablum_id) {
		this.ablum_id = ablum_id;
	}

}
