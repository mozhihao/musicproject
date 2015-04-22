package com.mzh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.mzh.dao.MusicDao;
import com.mzh.po.Ablum;
import com.mzh.po.Music;

@Component
public class MusicService {
	@Resource
	private MusicDao musicdao;

	public void addMusic(Music music){
		musicdao.add(music);
	}
	
	public List<Music> showAllMusic(){
		return musicdao.getAllMusic();
	}
	
	public List<Music> getMusicByName(String music_name) { 
		return musicdao.getMusicByName(music_name);
	}
	
//	public List<Music> getMusicByType(String type) { 
//		return musicdao.getMusicByType(type);
//	}
	
	public Music getMusicByid(int id){
		return musicdao.getMusicByid(id);
	}
	
	public void delMusic(Music music) { 
		 musicdao.delMusic(music);
	}

	public void upMusic(Music music) { 
		musicdao.upMusic(music);
	}
	
	//·ç¸ñ
	public List<Ablum> getMusicByMusicType(String type) {
		if(type==null){
		return musicdao.getAblumByMusicType();
		}
		else{
			return musicdao.getAblumByMusicTypeName(type);
		}
	}
	
	
	public List<Music> getMusicByAblumId(int ablumId) { 
		return musicdao.getMusicByAblumId(ablumId);
	}
	
	public MusicDao getMusicdao() {
		return musicdao;
	}
	public void setMusicdao(MusicDao musicdao) {
		this.musicdao = musicdao;
	}
	
	
	
}
