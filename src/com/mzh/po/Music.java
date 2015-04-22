package com.mzh.po;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Music {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int musicId;
	private String music_name;
	private String author;
	private String introdution;
	private String file_Location;
	private String tmp_file_Location;
	private String album;
	private int album_id;
	private double price;
	private String type;
	
	public int getMusicId() {
		return musicId;
	}
	public void setMusicId(int musicId) {
		this.musicId = musicId;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getIntrodution() {
		return introdution;
	}
	public void setIntrodution(String introdution) {
		this.introdution = introdution;
	}
	public String getFile_Location() {
		return file_Location;
	}
	public void setFile_Location(String file_Location) {
		this.file_Location = file_Location;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}
	public String getTmp_file_Location() {
		return tmp_file_Location;
	}
	public void setTmp_file_Location(String tmp_file_Location) {
		this.tmp_file_Location = tmp_file_Location;
	}
}
