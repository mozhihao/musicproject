package com.mzh.action;
import java.util.ArrayList;
import java.util.List;

public class displayfunc {
	private int pageSize=4;//一页多少东西
	private int pageNow=1;//默认显示第一页
	private int pageCount;//该值是通过pageSize和rowCount
	
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
	//定义四个分页会用到的变量
	if(UpageNow>1){
		//接收到了pageNow
		pageNow=UpageNow;
		}
//rowCount多小页
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
		//定义四个分页会用到的变量
		if(UpageNow>1){
			//接收到了pageNow
			pageNow=UpageNow;
			}
	//rowCount多小页
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
