package com.hanriver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.frame.Dao;
import com.frame.Sql;
import com.vo.HanRiver;

public class HanRiverDao<K,V> extends Dao<K,V>{

	@Override
	public void insert(Connection con, K obj) throws Exception {
		
	}

	@Override
	public void delete(Connection con, V id) throws Exception {
		
	}

	@Override
	public void update(Connection con, K obj) throws Exception {
		
	}

	@Override
	public K select(Connection con, V id) throws Exception {
		return null;
	}

	@Override
	public ArrayList<K> select(Connection con) throws Exception {
		ArrayList<HanRiver> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = con.prepareStatement(Sql.selectallHanRiver);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				HanRiver h = null;
				String year = rset.getString("YEAR");
				String region = rset.getString("REGION");
				int total = rset.getInt("TOTAL");
				System.out.println(total);
				int people = rset.getInt("PEOPLE");
				int gym = rset.getInt("GYM");
				int bicycle = rset.getInt("CYCLE");
				int event = rset.getInt("EVENT");
				int park = rset.getInt("PARK");
				h = new HanRiver(year,region,total,people,gym,bicycle,event,park);
				list.add(h);
			}
		}catch(Exception e) {
			throw e;
		}finally {
			if(rset != null) rset.close();
			if(pstmt != null) pstmt.close();
		}
		return (ArrayList<K>) list;
	}

}
