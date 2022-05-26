package xskt.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import xskt.context.DBContext;
import xskt.model.Account;
import xskt.model.UserSearchHistory;

public class ListAccountDAO {
    //return the list of account
    public List<Account> list() throws Exception {
        List<Account> items = new ArrayList<>();
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select * from VesoDB.dbo.Account";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
                    String userMail = rs.getString(1);
//                    String password = rs.getString(2);
                    int role = rs.getInt(3);
                    int status = rs.getInt(4);
                    String signUp = rs.getString(5);
                    String login = rs.getString(6);
                    String userName = rs.getString(7);
                    String phone = rs.getString(8);
                    Account acc = new Account(userMail, "", role, status, signUp, login, userName, phone);
                    items.add(acc);
                }  
                rs.close();
                stm.close();
                conn.close();
            }
        }
        return items;
    }
    
    //return an account
    public Account getAccount(String acc) throws Exception {
        Account anAccount = new Account();
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select * from VesoDB.dbo.Account where user_mail = '"+acc+"'";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
                    String userMail = rs.getString(1);
//                  String password = rs.getString(2);
                    int role = rs.getInt(3);
                    int status = rs.getInt(4);
                    String signUp = rs.getString(5);
                    String login = rs.getString(6);
                    String userName = rs.getString(7);
                    String phone = rs.getString(8);
                    
                    anAccount.setUsr(userMail);
                    anAccount.setPwd("");
                    anAccount.setRole(role);
                    anAccount.setStatus(status);
                    anAccount.setSignUp(signUp);
                    anAccount.setLogin(login);
                    anAccount.setName(userName);
                    anAccount.setPhone(phone);
                }  
                rs.close();
                stm.close();
                conn.close();
            }
        }
        return anAccount;
    }
    
  //return an account
    public Account getAccountPassword(String acc) throws Exception {
        Account anAccount = new Account();
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select * from VesoDB.dbo.Account where user_mail = '"+acc+"'";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
//                    String userMail = rs.getString(1);
                    String password = rs.getString(2);
                    int role = rs.getInt(3);
                    int status = rs.getInt(4);
//                    String signUp = rs.getString(5);
//                    String login = rs.getString(6);
//                    String userName = rs.getString(7);
//                    String phone = rs.getString(8);
                    String salt = rs.getString(9);
                    
//                    anAccount.setUsr(userMail);
                    anAccount.setPwd(password);
                    anAccount.setRole(role);
                    anAccount.setStatus(status);
//                    anAccount.setSignUp(signUp);
//                    anAccount.setLogin(login);
//                    anAccount.setName(userName);
//                    anAccount.setPhone(phone);
                    anAccount.setSalt(salt);
                }  
                rs.close();
                stm.close();
                conn.close();
            }
        }
        return anAccount;
    }
    
    // check account existence
    // if account exist return true, else return false
    public boolean checkAccount(String acc) throws Exception {
    	boolean kq = false;
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select * from VesoDB.dbo.Account where user_mail = '"+acc+"'";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
                	kq = true;
                	
                	break;
                } 
                rs.close();
            } catch(Exception e) {
            	e.printStackTrace();
            	kq = true;
            }  
            stm.close();
            conn.close();
        }
        return kq;
    }
    
    //return search history of an account for admin
    public List<String> getSearchHistory(String acc) throws Exception {
        String[] history = new String[4];
        List<String> listHistory = new ArrayList<String>();
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select * from VesoDB.dbo.VeDo where user_mail = '"+acc+"'";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
                    String user_mail = rs.getString(1);
                    String tg_do = rs.getString(2);
                    String tinh_do = rs.getString(3);
                    String so_ve = rs.getString(4);
                    
                    history[0] = user_mail;
                    history[1] = tg_do;
                    history[2] = tinh_do;
                    history[3] = so_ve;
                    
                    String his = Arrays.toString(history);
                    listHistory.add(his);
                }  
                rs.close();
                stm.close();
                conn.close();
            }
        }
        return listHistory;
    }
  //return search history of an account for user
    public List<UserSearchHistory> getSearchHistory2(String acc) throws Exception {
    	
        List<UserSearchHistory> listHistory = new ArrayList<UserSearchHistory>();
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select * from VesoDB.dbo.VeDo where user_mail = '"+acc+"'";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
//                    String user_mail = rs.getString(1);
                    String tg_do = rs.getString(2);
                    String tinh_do = rs.getString(3);
                    String so_ve = rs.getString(4);
                    String ngay_do = rs.getString(5);
                    
                    UserSearchHistory searchHIS = new UserSearchHistory(tg_do, tinh_do, so_ve, ngay_do);
                    
                    listHistory.add(searchHIS);
                }  
                rs.close();
                stm.close();
                conn.close();
            }
        }
        return listHistory;
    }
//    public static void main(String[] args) {
//    	ListAccountDAO a = new ListAccountDAO();
//    	try {
//			System.out.print(a.checkAccount("hieu@gmail.com"));
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//    }
}
