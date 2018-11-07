package com.internousdev.myecsite01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.myecsite01.dto.BuyItemDTO;
import com.internousdev.myecsite01.util.DBConnector;

public class BuyItemDAO {

	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();

	public List<BuyItemDTO> getBuyItemInfo(){
		ArrayList<BuyItemDTO> biDTOList = new ArrayList<BuyItemDTO>();
		String sql = "SELECT id, item_name, item_price FROM item_info_transaction";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				BuyItemDTO biDTO = new BuyItemDTO();
				biDTO.setId(rs.getInt("id"));
				biDTO.setItemName(rs.getString("item_name"));
				biDTO.setItemPrice(rs.getString("item_price"));

				biDTOList.add(biDTO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return biDTOList;
	}

}
