package com.hanriver;

import java.util.ArrayList;
import java.sql.Connection;
import com.frame.Biz;

public class HanRiverBiz<T,V> extends Biz<T,V>{
	HanRiverDao<T,V> dao;

	public HanRiverBiz() {
		dao = new HanRiverDao<>();
	}
	
	@Override
	public void register(T obj) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(V id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(T obj) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public T get(V id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<T> get() throws Exception {
		ArrayList<T> list = null;
		Connection con = getConnection();
		try {
			list = dao.select(con);
		}catch(Exception e) {
			throw e;
		}finally {
			if(con != null) con.close();
		}
		return list;
	}
}
