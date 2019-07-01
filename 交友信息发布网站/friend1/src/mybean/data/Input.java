package mybean.data;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;



public class Input {
	String logname,leaveMessage,backNews="",nowTime;
	

	int type;
	
	public String getNowTime() {
		return nowTime;
	}

	public void setNowTime(String nowTime) {
		this.nowTime = nowTime;
	}

	public String getLeaveMessage() {
		return leaveMessage;
	}

	public void setLeaveMessage(String leaveMessage) {
		this.leaveMessage = leaveMessage;
	}

	public String getBackNews() {
		return backNews;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}

	public String getLogname() {
		return logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Input(Map<String,Object> map) {
		this.logname = (String)map.get("logname");
		this.leaveMessage = (String)map.get("leavemsg");
		this.type = Integer.parseInt(map.get("type").toString());
//		System.out.println(map.get("nowTime").getClass());
		String stime = null;
		if(map.get("nowTime")==null || ("").equals(map.get("nowTime"))){
			stime = "";
		}else{
			Timestamp tt = (Timestamp)map.get("nowTime");
			Date d = new Date(tt.getTime());
			stime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
		}
		this.nowTime = stime;

		
	}

	public Input() {
		
		

	}

	


}
