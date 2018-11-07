package com.internousdev.myecsite01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.myecsite01.dto.MyPageDTO;
import com.internousdev.myecsite01.util.DBConnector;

public class MyPageDAO {

	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();

	//DBから購入履歴を取得するメソッド
	public ArrayList<MyPageDTO> getMyPageUserInfo(String item_transaction_id, String user_master_id) throws SQLException{
		ArrayList<MyPageDTO> mpDTOList = new ArrayList<MyPageDTO>();
		String sql = "SELECT ubit.id, iit.item_name, iit.item_price, ubit.total_price, ubit.total_count, ubit.pay, ubit.insert_date "
				+ " FROM user_buy_item_transaction ubit"
				+ " LEFT JOIN item_info_transaction iit"
				+ " ON ubit.item_transaction_id = iit.id"
				+ " WHERE ubit.item_transaction_id = ? AND ubit.user_master_id = ?"
				+ " ORDER BY insert_date DESC";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, item_transaction_id);
			ps.setString(2, user_master_id);

			ResultSet rs = ps.executeQuery();

			//取得した結果を1件ずつDTOに格納して、そのDTOをArrayListに格納する。
			while(rs.next()){
				MyPageDTO mpDTO = new MyPageDTO();
				mpDTO.setId(rs.getString("id"));
				mpDTO.setItemName(rs.getString("item_name"));
				mpDTO.setUnitPrice(rs.getString("item_price"));
				mpDTO.setTotalPrice(rs.getString("total_price"));
				mpDTO.setTotalCount(rs.getString("total_count"));
				mpDTO.setPayment(rs.getString("pay"));
				mpDTO.setInsert_date(rs.getString("insert_date"));

				mpDTOList.add(mpDTO);

			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		return mpDTOList;
	}

	//DBから購入履歴を削除するメソッド
	public int buyItemHistoryDelete(String item_transaction_id, String user_master_id) throws SQLException{
		String sql = "DELETE FROM user_buy_item_transaction"
				+ " WHERE item_transaction_id = ? AND user_master_id = ?";

		PreparedStatement ps;
		int result = 0;
		try{
			ps = con.prepareStatement(sql);
			ps.setString(1, item_transaction_id);
			ps.setString(2, user_master_id);

			result = ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		//Actionくらすに削除下件数を返す。
		return result;
	}

}
