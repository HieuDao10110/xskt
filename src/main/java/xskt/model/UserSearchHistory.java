package xskt.model;

public class UserSearchHistory {
	private String time, province, number, date;

	public UserSearchHistory() {		
	}
	
	public UserSearchHistory(String time, String province, String number, String date) {		
		this.time = time;
		this.province = province;
		this.number = number;
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
