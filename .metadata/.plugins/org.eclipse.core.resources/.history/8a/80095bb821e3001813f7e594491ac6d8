package com.internousdev.myecsite02.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

public class InputChecker {

	public List<String> doCheck (String propertyName, String value, int minLength, int maxLength,
			boolean alphabet, boolean kanji, boolean hiragana, boolean halfDigit, boolean halfSymbols, boolean katakana, boolean fullWidthSymbols){
		List<String> stringList = new ArrayList<String>();
		if(StringUtils.isEmpty(value)){
			stringList.add(propertyName + "を入力してください。");
			value="";
		}else if(!(value=="")){
			String regularExpression = "";
			List<String> characterTypeList = new ArrayList<String>();
			if(alphabet || kanji || hiragana || halfDigit || halfSymbols || katakana || fullWidthSymbols){
				regularExpression = "[";
			}
			if(alphabet){
				regularExpression += "a-zA-Z";
				characterTypeList.add("半角英語");
			}
			if(kanji){
				regularExpression += "一-龯";
				characterTypeList.add("漢字");
			}
			if(hiragana){
				regularExpression += "ぁ-んー";
				characterTypeList.add("ひらがな");
			}
			if(halfDigit){
				regularExpression += "0-9";
				characterTypeList.add("半角数字");
			}
			if(halfSymbols){
				regularExpression += "@.,;:!#$%&'*+-/=?^_`{|{~";
				characterTypeList.add("半角記号");
			}
			if(katakana){
				regularExpression += "ｱ-ン";
				characterTypeList.add("カタカナ");
			}
			if(fullWidthSymbols){
				regularExpression += "＠．，；：！＃＄％＆’＊＋／＝？＾＿｀｛｜｝～";
				characterTypeList.add("全角記号");
			}
			if(!StringUtils.isEmpty(regularExpression)){
				regularExpression += "]+";
			}

			String characterType = "";
			for(int i=0; i<characterTypeList.size(); i++){
				if(0<i){
					characterType +="、";
				}
				characterType += characterTypeList.get(i).toString();
			}
			if(!value.matches(regularExpression)){
				stringList.add(propertyName + "は" + characterType + "で入力してください。");
			}
		}
		if(value.length() < minLength || value.length() > maxLength){
			stringList.add(propertyName + "は" + minLength + "文字以上" + maxLength + "文字以下で入力してください。");
		}
		return stringList;
	}

	public List<String> doPasswordCheck (String password, String reConfirmationPassword){
		List<String> stringList = new ArrayList<String>();
		if(!password.equals(reConfirmationPassword)){
			stringList.add("入力されたパスワードが異なります。");
		}
		return stringList;
	}

}
