package com.hanriver;

import java.util.ArrayList;

import com.vo.HanRiver;

public class Test {

	public static void main(String[] args) {
		
		HanRiverBiz<HanRiver, Integer> biz
		= new HanRiverBiz<>();
		
		ArrayList<HanRiver> list =null;
		try {
			list = biz.get();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
