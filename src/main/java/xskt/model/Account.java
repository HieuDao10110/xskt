package xskt.model;

public class Account {
    private String usr, pwd, salt;
    private int role;
    private String name, phone, signUp, login;
    private int status;

    public Account() {}

    public Account(String usr, String pwd, int role, int status, String signUp, String login, String name, String phone) {
        this.usr = usr;
        this.pwd = pwd;
        this.role = role;
        this.status = status;
        this.signUp = signUp;
        this.login = login;
        this.name = name;
        this.phone = phone;
    }

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSignUp() {
		return signUp;
	}

	public void setSignUp(String signUp) {
		this.signUp = signUp;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	public boolean isValib() {
		boolean kq = false;
//		make sure that email is valid
//		A-Z matches a single character in the range between A (index 65) and Z (index 90)
//		a-z matches a single character in the range between a (index 97) and z (index 122)
//		0-9 matches a single character in the range between 0 (index 48) and 9 (index 57)
//		+_.- matches a single character in the list +_.-
//		@ matches the character @ with index 6410 (4016 or 1008) literally
//		1st Capturing Group (.+)
//		. matches any character (except for line terminators)
//		+ matches the previous token between one and unlimited times, as many times as possible, giving back as needed (greedy)
        String regexMail = "^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
        //^                 # start-of-string
        //(?=.*[0-9])       # a digit must occur at least once
        //(?=.*[a-z])       # a lower case letter must occur at least once
        //(?=.*[A-Z])       # an upper case letter must occur at least once
        //(?=.*[@#$%^&+=.\-_*])  # a special character must occur at least once
        //(?=.*[@#$%^&+=.\-_*])([a-zA-Z0-9@#$%^&+=*.\-_])          # Match a single character present in the this list
        //{8,}              # anything, at least eight places though
        //$                 # end-of-string
        String regexPass = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.\\-_*])([a-zA-Z0-9@#$%^&+=*.\\-_]){8,}$";
        if(this.pwd.matches(regexPass)&&this.usr.matches(regexMail)) {
            kq = true;
        }else {
        	kq = false;
        }
        
		return kq;
	}  
}
