package com.Entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Card {
	static Map<Integer, BookTing> bktMap=new HashMap<Integer, BookTing>();
	public static void addBookTing(BookTing bkt){
//		if (!bktMap.containsKey(bkt)) {
//			bkt.setNum(1);
//			bktMap.put(bkt.getId(), bkt);
//		}else {
	//		bkt.setNum(bkt.getNum()+1);
			bktMap.put(bkt.getId(), bkt);
//		}
	}
	public static void delBookTing(int id){
		bktMap.remove(id);
	}
	public static Map<Integer, BookTing> findAllBookTing(){
		
		return bktMap;
	}
	public static float settleAccounts(){
		float sum=0;
		for(Integer id:bktMap.keySet()){
			BookTing bt=bktMap.get(id);
			sum+=bt.getPrice()*bt.getNum();
		}
		return sum;
	}
	public static void removeMap(Map<Integer, BookTing> bkts){
		for (Integer id: bkts.keySet()) {
			bktMap.remove(id);
		}
	}
}
