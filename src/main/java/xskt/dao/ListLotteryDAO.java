package xskt.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import xskt.context.DBContext;
import xskt.model.Lottery;

public class ListLotteryDAO {
	//return the list of lottery
    public List<Lottery> list() throws Exception {
        List<Lottery> items = new ArrayList<>();
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select * from VesoDB.dbo.CTyVeSo";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
                    String tinhDo = rs.getString(1);
                    String ngay = rs.getString(2);
                    String db = rs.getString(3);
                    String g1 = rs.getString(4);
                    String g2 = rs.getString(5);
                    String g3 = rs.getString(6);
                    String g4 = rs.getString(7);
                    String g5 = rs.getString(8);
                    String g6 = rs.getString(9);
                    String g7 = rs.getString(10);
                    String g8 = rs.getString(11);
                    String email = rs.getString(12);
                    Lottery acc = new Lottery(tinhDo, ngay, db, g1, g2, g3, g4, g5, g6, g7, g8, email);
                    items.add(acc);
                }  
                rs.close();
                stm.close();
                conn.close();
            }
        }
        return items;
    }
    
    //return an lottery with parameter tinhdo and ngaydo
    public Lottery getLottery(String tinhdo, String ngaydo) throws Exception {
    	Lottery anLottery = new Lottery();
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select * from VesoDB.dbo.CTyVeSo where tinh_do = '"+tinhdo+"' and ngay = '"+ngaydo+"'";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
                	String tinhDo = rs.getString(1);
                    String ngay = rs.getString(2);
                    String db = rs.getString(3);
                    String g1 = rs.getString(4);
                    String g2 = rs.getString(5);
                    String g3 = rs.getString(6);
                    String g4 = rs.getString(7);
                    String g5 = rs.getString(8);
                    String g6 = rs.getString(9);
                    String g7 = rs.getString(10);
                    String g8 = rs.getString(11);
                    String email = rs.getString(12);
                    
                    anLottery.setTinhDo(tinhDo);
                    anLottery.setNgay(ngay);
                    anLottery.setDb(db);
                    anLottery.setG1(g1);
                    anLottery.setG2(g2);
                    anLottery.setG3(g3);
                    anLottery.setG4(g4);
                    anLottery.setG5(g5);
                    anLottery.setG6(g6);
                    anLottery.setG7(g7);
                    anLottery.setG8(g8);
                    anLottery.setEmail(email);
                }  
                rs.close();
                stm.close();
                conn.close();
            }
        }
        return anLottery;
    }
  //return an lottery with parameter tinhdo and ngaydo is the nearest date
    public Lottery getLastLottery(String tinhdo) throws Exception {
    	Lottery anLottery = new Lottery();
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
            String sql = "select top 1 * from VesoDB.dbo.CTyVeSo where tinh_do = '"+tinhdo+"' order by ngay desc";
            try (ResultSet rs = stm.executeQuery(sql)) {
                while(rs.next()) {
                	String tinhDo = rs.getString(1);
                    String ngay = rs.getString(2);
                    String db = rs.getString(3);
                    String g1 = rs.getString(4);
                    String g2 = rs.getString(5);
                    String g3 = rs.getString(6);
                    String g4 = rs.getString(7);
                    String g5 = rs.getString(8);
                    String g6 = rs.getString(9);
                    String g7 = rs.getString(10);
                    String g8 = rs.getString(11);
                    String email = rs.getString(12);
                    
                    anLottery.setTinhDo(tinhDo);
                    anLottery.setNgay(ngay);
                    anLottery.setDb(db);
                    anLottery.setG1(g1);
                    anLottery.setG2(g2);
                    anLottery.setG3(g3);
                    anLottery.setG4(g4);
                    anLottery.setG5(g5);
                    anLottery.setG6(g6);
                    anLottery.setG7(g7);
                    anLottery.setG8(g8);
                    anLottery.setEmail(email);
                }  
                rs.close();
                stm.close();
                conn.close();
            }
        }
        return anLottery;
    }
}
