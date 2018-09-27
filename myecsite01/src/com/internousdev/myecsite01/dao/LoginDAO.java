package com.internousdev.myecsite01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.internousdev.myecsite01.dto.LoginDTO;
import com.internousdev.myecsite01.util.DBConnector;

public class LoginDAO {
	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();
	private LoginDTO lgDTO = new LoginDTO();

	public LoginDTO getLoginUserInfo(String loginUserId, String loginPassword){

		String sql = "SELECT * FROM login_user_transaction WHERE login_id=? AND login_pass=?";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ps.setString(2, loginPassword);
			ResultSet rs = ps.executeQuery();

			if(rs.next()){
				lgDTO.setLoginId(rs.getString("login_id"));
				lgDTO.setLoginPassword(rs.getString("login_pass"));
				lgDTO.setUserName(rs.getString("user_name"));

				if(!(rs.getString("login_id").equals(null))){
					lgDTO.setLoginFlg(true);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return lgDTO;
	}

	public LoginDTO getLgDTO(){
		return lgDTO;
	}

}
