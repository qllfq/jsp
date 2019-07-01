package mybean.data;

public class Login {
	String logname,password,backNews="";
	public String getBackNews() {
		return backNews;
	}
	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	boolean success=false;
	public void setLogname(String name){
		logname=name;
	}
	public String getLogname(){
		return logname;
	}
	public void setPassword(String pw){
		password=pw;
	}
	public String getPassword(){
		return password;
	}
	
}
