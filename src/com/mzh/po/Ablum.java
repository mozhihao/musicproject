package com.mzh.po;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Ablum {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int albumId;
	private String albumPic;
	private String albumName;
	private String albumAuthor;
	private double ablumPrice;
	private String fileLocation;
	private int downloadNum;
	private int hot;
	public int getAlbumId() {
		return albumId;
	}
	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}
	
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getAlbumPic() {
		return albumPic;
	}
	public void setAlbumPic(String albumPic) {
		this.albumPic = albumPic;
	}
	public String getAlbumAuthor() {
		return albumAuthor;
	}
	public void setAlbumAuthor(String albumAuthor) {
		this.albumAuthor = albumAuthor;
	}
	public double getAblumPrice() {
		return ablumPrice;
	}
	public void setAblumPrice(double ablumPrice) {
		this.ablumPrice = ablumPrice;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	public int getDownloadNum() {
		return downloadNum;
	}
	public void setDownloadNum(int downloadNum) {
		this.downloadNum = downloadNum;
	}
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}

}
