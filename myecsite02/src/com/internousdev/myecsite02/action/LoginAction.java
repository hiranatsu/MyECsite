package com.internousdev.myecsite02.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.myecsite02.dao.CategoryDAO;
import com.internousdev.myecsite02.dao.UserInfoDAO;
import com.internousdev.myecsite02.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware{
	private Map<String, Object>session;
	private String loginId;
	private String password;
	private boolean saveFlag;

	public String execute() throws SQLException{
		String result="logined";
		if(!session.containsKey("categoryDTOList")){
			session.put("categoryDTOList", (new CategoryDAO()).getCategoryList());
		}
		if(!session.containsKey("logined")){
			result=ERROR;
			session.remove("loginIdErrorMessageList");
			session.remove("passwordErrorMessageList");
			session.remove("errorMessage");

			List<String>loginIdErrorMessageList = new ArrayList<String>();
			List<String>passwordErrorMessageList = new ArrayList<String>();

			//入力された値を検証
			InputChecker ic = new InputChecker();
			loginIdErrorMessageList = ic.doCheck("ログインID", loginId, 1, 8, true, false, false, true, false, false, false);
			passwordErrorMessageList = ic.doCheck("パスワード", password, 1, 16, true, false, false, true, false, false, false);

			//loginIdErrorMessageListが空でない場合、sessionにListの内容をput、ログイン状態をremove
			if(loginIdErrorMessageList.size()!=0){
				session.put("loginIdErrorMessageList", loginIdErrorMessageList);
				session.remove("logined");
			}
			//passwordErrorMessageListが空でない場合、sessionにListの内容をput、ログイン状態をremove
			if(passwordErrorMessageList.size()!=0){
				session.put("passwordErrorMessageList", passwordErrorMessageList);
				session.remove("logined");
			}

			//
			UserInfoDAO uiDAO = new UserInfoDAO();

		}
	}

}
