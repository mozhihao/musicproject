package com.mzh.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mzh.po.Ablum;
import com.mzh.po.Music;

@Component
public class MusicDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	//��������
	public void add(Music m){
		System.out.println("MusicDao.add()"+"music��:"+m.getMusic_name());
		hibernateTemplate.save(m);
		hibernateTemplate.clear();
	}
	
	//id->music
	public Music getMusicByid(int id){
		Music music=(Music)this.hibernateTemplate.get(Music.class, id); 
		hibernateTemplate.clear();
		return music;
	}
		
	//��������ģ����ѯ
	public List<Music> getMusicByName(String music_name) { 
		System.out.println("��music_nameΪ"+music_name+"������");
		List<Music> list=this.hibernateTemplate.find("from Music where music_name like ? ","%"+music_name+"%");
		System.out.println(list+"!!");
		hibernateTemplate.clear();
		return list;
	} 
	
	//ĳר���µ���������
	public List<Music> getMusicByAblumId(int ablumId) { 
		List<Music> list=this.hibernateTemplate.find("from Music where album_id = ? ",ablumId);
		hibernateTemplate.clear();
		return list;
	} 
		
	//�����
	public List<Ablum> getAblumByMusicType() { 
		List<Ablum> list=this.hibernateTemplate.find("from Music  order by type DESC ");
		hibernateTemplate.clear();
		return list;
		}
	//�����
	public List<Ablum> getAblumByMusicTypeName(String type) { 
		List<Ablum> list=this.hibernateTemplate.find("from Music where type=? order by type DESC ",type);
		hibernateTemplate.clear();
		return list;
		}
		
	//��������
//	public List<Music> getMusicByType(String type) { 
//		List<Music> list=this.hibernateTemplate.find("from Music where type = ? ",type);
//		return list;
//	} 
	
	//��������
	public List<Music> getAllMusic() { 
		System.out.println("UserDao.getAllMusic()");
		List<Music> music = this.hibernateTemplate.find("from Music");
		hibernateTemplate.clear();
		return music;
}	
	//update����
	public void upMusic(Music music) { 
		System.out.println("UserDao.upMusic()");
		this.hibernateTemplate.update(music);  
		hibernateTemplate.clear();
}

	
	
	
	//ɾ��del
	public void delMusic(Music music) { 
		System.out.println("UserDao.delMusic()");
		this.hibernateTemplate.delete(music);  
		hibernateTemplate.clear();
}	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
