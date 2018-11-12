package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyItemDAO;
import com.internousdev.ecsite.dto.BuyItemDTO;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware{
	public Map<String, Object> session;

	public String execute(){
		String result = "login";
		if(session.containsKey("id")){
			BuyItemDAO BIDAO = new BuyItemDAO();
			BuyItemDTO BIDTO = BIDAO.getBuyItemInfo();
			session.put("id", BIDTO.getId());
			session.put("buyItem_name", BIDTO.getItemName());
			session.put("buyItem_price", BIDTO.getItemPrice());

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
