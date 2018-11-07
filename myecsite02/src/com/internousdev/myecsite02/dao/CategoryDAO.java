package com.internousdev.myecsite02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.internousdev.myecsite02.dto.CategoryDTO;
import com.internousdev.myecsite02.util.DBConnector;

public class CategoryDAO {

	public List<CategoryDTO> getCategoryList(){
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		List<CategoryDTO> categoryDTOList = new ArrayList<CategoryDTO>();
		String sql = "select * from item_category";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				CategoryDTO cdto = new CategoryDTO();
				cdto.setId(rs.getInt("id"));
				cdto.setCategoryId(rs.getInt("catgoryId"));
				cdto.setCategoryName(rs.getString("categoryName"));
				cdto.setCategoryDescription(rs.getString("categoryDescription"));
				cdto.setInsertDate(rs.getDate("insertDate"));
				cdto.setUpdateDate(rs.getDate("updateDate"));

				categoryDTOList.add(cdto);

			}
			Iterator<CategoryDTO> iterator = categoryDTOList.iterator();
			if(!(iterator.hasNext())){
				categoryDTOList = null;
			}

		}catch(SQLException e){
			e.printStackTrace();
		}
		finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return categoryDTOList;

	}

}
