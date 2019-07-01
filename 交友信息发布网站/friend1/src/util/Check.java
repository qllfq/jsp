package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Check {
	 public static boolean isMobileNO(String mobiles) {  
		    boolean flag = false;  
		    try {  
		        //13********* ,15********,18*********  
		        Pattern p = Pattern.compile("^((13[0-9])|(15[0,9])|(18[0,9]))\\d{8}$");  
		        Matcher m = p.matcher(mobiles);  
		        flag = m.matches();  
		    } catch (Exception e) {  
		        flag = false;  
		    } 
		 
		    System.out.println(flag);
		    return flag;  
		}  
	 public static boolean checkEmail(String email){
		  boolean flag = false;
		  try{
		    String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		    Pattern regex = Pattern.compile(check);
		    Matcher matcher = regex.matcher(email);
		    flag = matcher.matches();
		   }catch(Exception e){
		    flag = false;
		   }
		  System.out.println(flag);
		  return flag;
		 }
	 public static boolean checkName(String userName) {
	       // String validateStr = "^[\\w\\-гнг▀[0-9]\u4e00-\u9fa5\uFF21-\uFF3A\uFF41-\uFF5A]+$";
	        boolean rs = true;
	       // rs = matcher(validateStr, userName);
	      //  if (rs) {
	            int strLenth = getStrLength(userName);
	            if (strLenth < 4 || strLenth > 20) {
	                rs = false;
	            }
	            System.out.println(rs);
	        return rs;
	    }
	 public static int getStrLength(String value) {
	        int valueLength = 0;
	        String chinese = "[\u0391-\uFFE5]";
	        for (int i = 0; i < value.length(); i++) {
	            String temp = value.substring(i, i + 1);
	            if (temp.matches(chinese)) {
	                valueLength += 2;
	            } else {
	                valueLength += 1;
	            }
	        }
	        return valueLength;
	    }
	private static boolean matcher(String reg, String string) {
	        boolean tem = false;
	        Pattern pattern = Pattern.compile(reg);
	        Matcher matcher = pattern.matcher(string);
	        tem = matcher.matches();
	        System.out.println(tem);
	        return tem;
	    }
	 public static boolean checkPassword(String password){
		  boolean flag = false;
		  try{
		    String check = "(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
		    Pattern regex = Pattern.compile(check);
		    Matcher matcher = regex.matcher(password);
		    flag = matcher.matches();
		   }catch(Exception e){
		    flag = false;
		   }
		  System.out.println(flag);
		  return flag;
		 }

}
