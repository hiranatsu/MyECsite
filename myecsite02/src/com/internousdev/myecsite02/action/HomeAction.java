package com.internousdev.myecsite02.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.myecsite02.dao.CategoryDAO;
import com.internousdev.myecsite02.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	public String execute(){
		if(session.containsKey("reserve")){
			session.put("loginId", session.get("reserve"));
			session.put("logined", "logined");
			session.remove("reserve");
		}else if(!session.containsKey("loginId")){
			if(!session.containsKey("tempUserId")){
				session.put("tempUserId", (new CommonUtility()).getRandomValue());
			}
		}
		if(!session.containsKey("categoryDTOList")){
			session.put("categoryDTOList", (new CategoryDAO()).getCategoryList());
		}
		return SUCCESS;
	}

	public Map<String, Object> getSession(){
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session){
		this.session = session;
	}
}
