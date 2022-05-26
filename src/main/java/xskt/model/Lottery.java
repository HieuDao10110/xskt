package xskt.model;

public class Lottery {
	private String tinhDo, ngay, db, g1, g2, g3, g4, g5, g6, g7, g8, email;
	public Lottery() {}
	public Lottery(Lottery lot) {
		this.tinhDo = lot.getTinhDo();
		this.ngay = lot.getNgay();
		this.db = lot.getDb();
		this.g1 = lot.getG1();
		this.g2 = lot.getG2();
		this.g3 = lot.getG3();
		this.g4 = lot.getG4();
		this.g5 = lot.getG5();
		this.g6 = lot.getG6();
		this.g7 = lot.getG7();
		this.g8 = lot.getG8();
		this.email = lot.getEmail();
	}
	public Lottery(String tinhDo, String ngay, String db, String g1, String g2, String g3, String g4, String g5, String g6, String g7, String g8, String email) {
		this.tinhDo = tinhDo;
		this.ngay = ngay;
		this.db = db;
		this.g1 = g1;
		this.g2 = g2;
		this.g3 = g3;
		this.g4 = g4;
		this.g5 = g5;
		this.g6 = g6;
		this.g7 = g7;
		this.g8 = g8;
		this.email = email;
	}
	public String getTinhDo() {
		return tinhDo;
	}
	public void setTinhDo(String tinhDo) {
		this.tinhDo = tinhDo;
	}
	public String getNgay() {
		return ngay;
	}
	public void setNgay(String ngay) {
		this.ngay = ngay;
	}
	public String getDb() {
		return db;
	}
	public void setDb(String db) {
		this.db = db;
	}
	public String getG1() {
		return g1;
	}
	public void setG1(String g1) {
		this.g1 = g1;
	}
	public String getG2() {
		return g2;
	}
	public void setG2(String g2) {
		this.g2 = g2;
	}
	public String getG3() {
		return g3;
	}
	public void setG3(String g3) {
		this.g3 = g3;
	}
	public String getG4() {
		return g4;
	}
	public void setG4(String g4) {
		this.g4 = g4;
	}
	public String getG5() {
		return g5;
	}
	public void setG5(String g5) {
		this.g5 = g5;
	}
	public String getG6() {
		return g6;
	}
	public void setG6(String g6) {
		this.g6 = g6;
	}
	public String getG7() {
		return g7;
	}
	public void setG7(String g7) {
		this.g7 = g7;
	}
	public String getG8() {
		return g8;
	}
	public void setG8(String g8) {
		this.g8 = g8;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isEmpty() {
		if(db != null) {
			return false;
		}else {
			return true;
		}		
	}
	public String checkPrize(String x) {
		String lot = "";
		int xlength = x.length();
		
		String checkdb = db.trim();
		int dby = checkdb.length();
		if(xlength == dby) {
			if(checkdb.contains(x));
			lot += "Giai dac biet ";
		}
		
		String checkg1 = db.trim();
		int g1y = checkg1.indexOf(" ");
		if(xlength == g1y) {
			if(checkg1.contains(x));
			lot += "Giai nhat ";
		}
		
		String checkg2 = db.trim();
		int g2y = checkg2.indexOf(" ");
		if(xlength == g2y) {
			if(checkg2.contains(x));
			lot += "Giai nhi ";
		}
		
		String checkg3 = db.trim();
		int g3y = checkg3.indexOf(" ");
		if(xlength == g3y) {
			if(checkg3.contains(x));
			lot += "Giai ba ";
		}
		
		String checkg4 = db.trim();
		int g4y = checkg4.indexOf(" ");
		if(xlength == g4y) {
			if(checkg4.contains(x));
			lot += "Giai tu ";
		}
		
		String checkg5 = db.trim();
		int g5y = checkg5.indexOf(" ");
		if(xlength == g5y) {
			if(checkg5.contains(x));
			lot += "Giai nam ";
		}
		
		String checkg6 = db.trim();
		int g6y = checkg6.indexOf(" ");
		if(xlength == g6y) {
			if(checkg6.contains(x));
			lot += "Giai sau ";
		}
		
		String checkg7 = db.trim();
		int g7y = checkg7.indexOf(" ");
		if(xlength == g7y) {
			if(checkg7.contains(x));
			lot += "Giai bay ";
		}
		
		if(g8 != null) {
			String checkg8 = db.trim();
			int g8y = checkg8.indexOf(" ");
			if(xlength == g8y) {
				if(checkg8.contains(x));
				lot += "Giai tam ";
			}		
		}
		return lot;
	}
}
