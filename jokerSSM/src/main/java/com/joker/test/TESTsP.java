package com.joker.test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TESTsP {
	public static void main(String []args) {
		String a="5-1-4";
		String []ad=a.split("-");
		//System.out.println(ad[1]);
		List<Integer> d=new ArrayList<>();
		
		for(String p:ad) {
			d.add(Integer.parseInt(p));
			System.out.println(Integer.parseInt(p));
		}
		Iterator it=d.iterator();
		
		
		while(it.hasNext()) {
			Object l=it.next();
			System.out.println(l);
		}
	}

}
