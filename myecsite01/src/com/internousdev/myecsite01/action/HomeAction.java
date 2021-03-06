package com.internousdev.myecsite01.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.myecsite01.dao.BuyItemDAO;
import com.internousdev.myecsite01.dto.BuyItemDTO;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware{

	public Map<String, Object> session;

	public String execute(){
		String result = "login";

		//ログイン済み判定を行う。
		//一度ログインしている場合、ログイン認証画面に遷移せず商品画面にいく。
		if(session.containsKey("id")){
			BuyItemDAO biDAO = new BuyItemDAO();
			List<BuyItemDTO> biDTOList = biDAO.getBuyItemInfo();
			session.put("buyItemList", biDTOList);

			result = SUCCESS;
		}
		return result;
	}

	@Override
	public void setSession(Map<String, Object> session){
		this.session = session;
	}
	public Map<String, Object> getSession(){
		return this.session;
	}

}
