package com.mzh.po;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Buyrecord {

	private int brid;
	private int userid;
	private int musicid;
	private String musicname;
	private int ablumid;
	private String ablumname;
	private String ablumpic;
	private int state;
	private double price;
	private String date;
	public String getMusicname() {
		return musicname;
	}
	public void setMusicname(String musicname) {
		this.musicname = musicname;
	}
	public String getAblumname() {
		return ablumname;
	}
	public void setAblumname(String ablumname) {
		this.ablumname = ablumname;
	}
	@Id
	@GeneratedValue
	public int getBrid() {
		return brid;
	}
	public void setBrid(int brid) {
		this.brid = brid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getMusicid() {
		return musicid;
	}
	public void setMusicid(int musicid) {
		this.musicid = musicid;
	}
	public int getAblumid() {
		return ablumid;
	}
	public void setAblumid(int ablumid) {
		this.ablumid = ablumid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAblumpic() {
		return ablumpic;
	}
	public void setAblumpic(String ablumpic) {
		this.ablumpic = ablumpic;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	
}
