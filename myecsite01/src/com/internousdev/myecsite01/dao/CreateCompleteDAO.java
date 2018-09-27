package com.internousdev.myecsite01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.myecsite01.util.DBConnector;
import com.internousdev.myecsite01.util.DateUtil;

public class CreateCompleteDAO {

	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();
	private DateUtil du = new DateUtil();

	private String sql = "INSERT INTO login_user_transaction (login_id, login_pass, user_name, insert_date) VALUES (?,?,?,?)";

	public void createUser(String loginUserId, String loginPassword, String userName) throws SQLException{
		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ps.setString(2, loginPassword);
			ps.setString(3, userName);
			ps.setString(4, du.getDate());

			ps.execute();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		con.close();
	}

}


}