package com.mzh.action;
import java.util.ArrayList;
import java.util.List;

public class displayfunc {
	private int pageSize=4;//һҳ���ٶ���
	private int pageNow=1;//Ĭ����ʾ��һҳ
	private int pageCount;//��ֵ��ͨ��pageSize��rowCount
	
	public int showpageCount(int rowCount){
		if(rowCount%pageSize==0){
			return pageCount=rowCount/pageSize;
			}else{
			return pageCount=rowCount/pageSize+1;
			}
	}
	
	public int showpageCount2(int rowCount,int pageSize){
		if(rowCount%pageSize==0){
			return pageCount=rowCount/pageSize;
			}else{
			return pageCount=rowCount/pageSize+1;
			}
	}
	
	
	public List dispaly(List l,int UpageNow,int rowCount){
	//�����ĸ���ҳ���õ��ı���
	if(UpageNow>1){
		//���յ���pageNow
		pageNow=UpageNow;
		}
//rowCount��Сҳ
//	if(rowCount%pageSize==0){
//		pageCount=rowCount/pageSize;
//		}else{
//		pageCount=rowCount/pageSize+1;
//		}
//
	List tmp=new ArrayList();
	for(int i=0;i<pageSize;i++){
		if((pageNow-1)*pageSize+i>=l.size()){
			break;
		}else{
		tmp.add(l.get((pageNow-1)*pageSize+i));
		}
	}
	return tmp;
	}
	
	public List dispaly2(List l,int UpageNow,int rowCount,int pageSize){
		//�����ĸ���ҳ���õ��ı���
		if(UpageNow>1){
			//���յ���pageNow
			pageNow=UpageNow;
			}
	//rowCount��Сҳ
//		if(rowCount%pageSize==0){
//			pageCount=rowCount/pageSize;
//			}else{
//			pageCount=rowCount/pageSize+1;
//			}
	//
		List tmp=new ArrayList();
		for(int i=0;i<pageSize;i++){
			if((pageNow-1)*pageSize+i>=l.size()){
				break;
			}else{
			tmp.add(l.get((pageNow-1)*pageSize+i));
			}
		}
		return tmp;
		}
}
