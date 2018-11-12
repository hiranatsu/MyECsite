package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyItemDAO;
import com.internousdev.ecsite.dao.LoginDAO;
import com.internousdev.ecsite.dto.BuyItemDTO;
import com.internousdev.ecsite.dto.LoginDTO;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware{

	private String loginUserId;
	private String loginPassword;
	public Map<String, Object> session;
	private LoginDAO LDAO = new LoginDAO();
	private LoginDTO LDTO = new LoginDTO();
	private BuyItemDAO BIDAO = new BuyItemDAO();

	public String execute(){
		String result =ERROR;
		LDTO = LDAO.getLoginUserInfo(loginUserId, loginPassword);
		session.put("loginUser", LDTO);

		/*入力値からユーザー情報の検索を行う。
		 * ログイン認証が成功した場合、
		 * 次の画面で「商品情報」がひつようなため商品情報を取得している。*/
		if(((LoginDTO) session.get("loginUser")).getLoginFlg()){
			result = SUCCESS;
			BuyItemDTO BIDTO = BIDAO.getBuyItemInfo();

			session.put("login_user_id", LDTO.getLoginId());
			session.put("id", BIDTO.getId());
			session.put("buyItem_name", BIDTO.getItemName());
			session.put("buyItem_price", BIDTO.getItemPrice());

			return result;
		}
		return result;
	}

	public String getLoginUserId(){
		return loginUserId;
	}
	public void setLoginUserId(String loginUserId){
		this.loginUserId = loginUserId;
	}

	public String getLoginPassword(){
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword){
		this.loginPassword = loginPassword;
	}

	@Override
	public void setSession(Map<String, Object> session){
		this.session = session;
	}



}
