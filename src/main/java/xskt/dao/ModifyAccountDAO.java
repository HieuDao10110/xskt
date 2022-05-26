package xskt.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import xskt.context.DBContext;
import xskt.context.HashPasswordContext;

public class ModifyAccountDAO {
	// delete multiple accounts
    public String deleteManyAccount(String[] manyacc) throws Exception {
    	String kq = "failed";
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
        	conn.setAutoCommit(false);
        	
            try {
            	for(String acc : manyacc) {
            		//account_role = 0 to make sure delete USER account
            		stm.executeUpdate("update VesoDB.dbo.Account set status = 2 WHERE user_mail = '"+acc+"' and account_role = 0");
            	}
                conn.commit();
                kq = "succes";
            } catch (Exception e) {
            	  e.printStackTrace();
            	  conn.rollback();
            } finally {
            	  conn.setAutoCommit(true);
            }
            stm.close();
            conn.close();
        }       
        return kq;
    }
    
    //update account 
    public String updateAccount(String[] acc) throws Exception {
    	String kq = "failed";
    	String email = acc[0];
    	// array length save number of field for update
    	int arrayLength = 0;
    	//this prepare for a part of the query and count number of field for update
    	String str[] = new String[7];
    	if(!acc[7].isEmpty()) {
    		str[0] = "user_mail = '"+acc[7]+"'";
    		arrayLength ++;
    	}
    	if(!acc[1].isEmpty()) {
    		str[1] = "password = '"+acc[1]+"'";   		
    		arrayLength ++;
    	}
     	if(!acc[2].isEmpty()) {
    		str[2] = "account_role = "+acc[2]; 
    		arrayLength ++;
    	} 
    	if(!acc[3].isEmpty()) {
    		str[3] = "status = "+acc[3];
    		arrayLength ++;
    	}     	
    	if(!acc[4].isEmpty()) {
    		str[4] = "user_name = '"+acc[4]+"'"; 
    		arrayLength ++;
    	}
    	if(!acc[5].isEmpty()) {
    		str[5] = "user_phone = '"+acc[5]+"'"; 
    		arrayLength ++;
    	}
    	if(!acc[6].isEmpty()) {
    		str[6] = "salt = '"+acc[6]+"'"; 
    		arrayLength ++;
    	}
    	
    	//check query
    	if(arrayLength == 0) {		//arrayLength == 0 => no field update
    		kq = "succes";
    		return kq;
    	
    	} else if(arrayLength > 7 || arrayLength < 0) {		// out of range field
    		kq = "failed";
    		return kq;
    	} else {	// create array only contain fields for update. e.g {user_phone = '0123', user_name = 'tom'}
    		String[] str1 = new String[arrayLength];
    		int i = 0;
    		for(String a : str) {
    			if(a != null) {
    				str1[i] = a;
    				i++;
    			}
    		}
    		//create query set to ... e.g "column1 = value1, column2 = value2, ..."
    		String newQuery = Arrays.toString(str1);
    		
    		int newQuery1Length = newQuery.length() - 1;
    		String newQuery1 = newQuery.substring(1, newQuery1Length); //remove [] of string
    		
    		//execute update
    		String finalQuery = "update VesoDB.dbo.Account set "+newQuery1+" WHERE user_mail = '"+email+"'";
            try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {        	
                try {
                	stm.executeUpdate(finalQuery);
                    kq = "succes";
                } catch (Exception e) {
                	  e.printStackTrace();
                	  kq = "failed";
                }
                stm.close();
                conn.close();
            }
    	}       
        return kq;
    }
    
  //create account 
    public String createAccount(String[] acc) throws Exception {
    	String kq = "failed";
    	
    	HashPasswordContext hash = new HashPasswordContext();
    	byte[] salt = hash.getSalt();
    	String hashPass = hash.getSecurePassword(acc[1], salt);
    	String hashSalt = hash.saltToString(salt);
        String query = "INSERT INTO VesoDB.dbo.Account (user_mail, password, account_role, status, user_name, user_phone, salt) "
        		+ "VALUES ('"+acc[0]+"', '"+hashPass+"', "+acc[2]+", "+acc[3]+", '"+acc[4]+"', '"+acc[5]+"', '"+hashSalt+"');";
		try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {        	
            try {
            	stm.executeUpdate(query);
                kq = "succes";
            } catch (Exception e) {
            	  e.printStackTrace();
            	  kq = "failed";
            }
            stm.close();
            conn.close();
        }	      
        return kq;
    } 
    //set login date
    public void setLoginDate(String email) throws SQLException, Exception {
    	String query = "update VesoDB.dbo.Account set lastTime_logIn = CONVERT (date, GETDATE()) WHERE user_mail = '"+email+"'";
        		
		try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {        	
            try {
            	stm.executeUpdate(query);
            } catch (Exception e) {
            	  e.printStackTrace();
            }
            stm.close();
            conn.close();
        }	      
    }
    //resign-up
    public String reSignUp(String email, String pass) throws SQLException, Exception {
    	String kq = "failed";
    	
    	HashPasswordContext hash = new HashPasswordContext();
    	byte[] salt = hash.getSalt();
    	String hashPass = hash.getSecurePassword(pass, salt);
    	String hashSalt = hash.saltToString(salt);
    	String query = "update VesoDB.dbo.Account set status = 0, password = '"+hashPass+"', salt = '"+hashSalt+"' WHERE user_mail = '"+email+"'";
        		
		try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {        	
            try {
            	stm.executeUpdate(query);
            	kq = "succes";
            } catch (Exception e) {
            	  e.printStackTrace();
            }
            stm.close();
            conn.close();
        }	
		return kq;
    }
    //save search ticket history of account 
    public void addSearchHistory(String email, String tinh, String ve, String ngay) throws SQLException, Exception {
    	String query = "INSERT INTO VesoDB.dbo.VeDo (user_mail, tg_do, tinh_do, so_ve, ngay_do) "
        		+ "VALUES ('"+email+"', CURRENT_TIMESTAMP, '"+tinh+"', "+ve+", '"+ngay+"');";
		try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {        	
            try {
            	stm.executeUpdate(query);       
            } catch (Exception e) {
            	e.printStackTrace();      	 
            }
            stm.close();
            conn.close();
        }
    }
    //verify account
    public String verifyAccount(String email) throws SQLException, Exception {
    	String kq = "Verify failed";
    	String query = "update VesoDB.dbo.Account set status = 1 WHERE user_mail = '"+email+"'";
		
		try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {        	
            try {
            	stm.executeUpdate(query);
            	kq = "Verify success, login to use";
            } catch (Exception e) {
            	  e.printStackTrace();
            }
            stm.close();
            conn.close();
        }	
    	return kq;
    }
}
