package mybean.data;

import java.util.Map;

public class MemberInform {
	String logname,email,phone,message,pic,backNews;

	public String getLogname() {
		return logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getBackNews() {
		return backNews;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
	public MemberInform(Map<String,Object> map){
		this.logname = (String)map.get("logname");
		this.message = (String)map.get("message");
		this.email = (String)map.get("email");
		this.phone = (String)map.get("phone");
		this.pic = (String)map.get("pic");
	}
	public MemberInform(){
		
	}
	
	
}
