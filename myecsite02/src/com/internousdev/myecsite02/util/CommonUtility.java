package com.internousdev.myecsite02.util;

public class CommonUtility {
	public Object getRandomValue(){
		String value="";
		for(int i=0; i<16; i++){
			value +=(int)(Math.random()*10);
		}
		return value;
	}

	public String concealPassword(String password){
		String macked;
		int end = password.length() > 1 ? 2 : 1;
		macked = (new StringBuilder("****************")).replace(0, end, password.substring(0,end)).toString();

		return macked;
	}

}
