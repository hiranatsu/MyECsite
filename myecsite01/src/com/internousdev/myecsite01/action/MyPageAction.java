package com.internousdev.myecsite01.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.myecsite01.dao.MyPageDAO;
import com.internousdev.myecsite01.dto.MyPageDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware{
	public Map<String, Object> session;
	private MyPageDAO mpDAO = new MyPageDAO();
	private ArrayList<MyPageDTO> mpList = new ArrayList<MyPageDTO>();
	private String deleteFlg;
	private String message;

	public String execute() throws SQLException{
		if(!session.containsKey("id")){
			return ERROR;
		}

		//履歴の削除がされているか否かチェックをする。
		if(deleteFlg == null){
			String item_transaction_id = session.get("id").toString();
			String user_master_id = session.get("login_user_id").toString();
			mpList = mpDAO.getMyPageUserInfo(item_transaction_id, user_master_id);

			}else if(deleteFlg.equals("1")){
				delete();
			}
		String result = SUCCESS;
		return result;
	}

	public void delete() throws SQLException{
		String item_transaction_id = session.get("id").toString();
		String user_master_id = session.get("login_user_id").toString();

		int res = mpDAO.buyItemHistoryDelete(item_transaction_id, user_master_id);

		if(res > 0){
			mpList=null;
			setMessage("商品情報を正しく削除しました。");
		}else if(res == 0){
			setMessage("商品情報の削除に失敗しました。");
		}
	}

	public void setDeleteFlg(String deleteFlg){
		this.deleteFlg = deleteFlg;
	}

	@Override
	public void setSession(Map<String, Object> session){
		this.session = session;
	}

	public ArrayList<MyPageDTO> getMpList(){
		return this.mpList;
	}

	public String getMessage(){
		return this.message;
	}

	public void setMessage(String message){
		this.message = message;
	}

}
