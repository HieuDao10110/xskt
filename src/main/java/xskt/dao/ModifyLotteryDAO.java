package xskt.dao;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Arrays;

import xskt.context.DBContext;

public class ModifyLotteryDAO {
	// delete multiple lottery
    public String deleteManyLottery(String[] manylot) throws Exception {
    	String kq = "failed";
        try (Connection conn = new DBContext().getConnection(); Statement stm = conn.createStatement()) {
        	conn.setAutoCommit(false);
        	
            try {
            	for(String acc : manylot) {
            		int index = acc.indexOf(" ");
            		String ngay = acc.substring(0,index);
            		String tinhDo = acc.substring(index+1);
            		stm.executeUpdate("Delete FROM VesoDB.dbo.CTyVeSo WHERE tinh_do = '"+tinhDo+"' and ngay = '"+ngay+"'");
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
    
    //update lottery
    public String updateLottery(String[] lot) throws Exception {
    	String kq = "failed";
    	String tinhDo = lot[0];
    	String ngay = lot[1];
    	if(!tinhDo.isEmpty() && !ngay.isEmpty()) {
    		// array length save number of field for update
        	int arrayLength = 0;
        	//this prepare for a part of the query and count number of field for update
        	String str[] = new String[12] ;
        	str[0] = "tinh_do = '"+lot[0]+"'";
        	arrayLength ++;
        	str[1] = "ngay = '"+lot[1]+"'";
        	arrayLength ++;
        	if(!lot[2].isEmpty()) {
        		str[2] = "db = '"+lot[2]+"'";
        		arrayLength ++;
        	}
        	if(!lot[3].isEmpty()) {
        		str[3] = "g1 = '"+lot[3]+"'";
        		arrayLength ++;
        	} 
        	if(!lot[4].isEmpty()) {
        		str[4] = "g2 = '"+lot[4]+"'";
        		arrayLength ++;
        	}     	
        	if(!lot[5].isEmpty()) {
        		str[5] = "g3 = '"+lot[5]+"'";
        		arrayLength ++;
        	}
        	if(!lot[6].isEmpty()) {
        		str[6] = "g4 = '"+lot[6]+"'";
        		arrayLength ++;
        	}
        	if(!lot[7].isEmpty()) {
        		str[7] = "g5 = '"+lot[7]+"'";
        		arrayLength ++;
        	}
        	if(!lot[8].isEmpty()) {
        		str[8] = "g6 = '"+lot[8]+"'";
        		arrayLength ++;
        	}
        	if(!lot[9].isEmpty()) {
        		str[9] = "g7 = '"+lot[9]+"'";
        		arrayLength ++;
        	}
        	if(!lot[10].isEmpty()) {
        		str[10] = "g8 = '"+lot[10]+"'";
        		arrayLength ++;
        	}
        	if(!lot[11].isEmpty()) {
        		str[11] = "user_mail = '"+lot[11]+"'";
        		arrayLength ++;
        	}
        	
        	//check query
        	if(arrayLength == 0) {		//arrayLength == 0 => no field update
        		kq = "succes";
        		return kq;
        	
        	} else if(arrayLength > 12 || arrayLength < 0) {		// out of range field
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
        		String finalQuery = "update VesoDB.dbo.CTyVeSo set "+newQuery1+" WHERE tinh_do = '"+tinhDo+"' and ngay = '"+ngay+"'";
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
    	}
        return kq;
    }
    
  //create lottery 
    public String createLottery(String[] acc) throws Exception {
    	String kq = "failed";
    		
        String query = "INSERT INTO VesoDB.dbo.CTyVeSo (tinh_do, ngay, db, g_1, g_2, g_3, g_4, g_5, g_6, g_7, g_8, user_mail) "
        		+ "VALUES ('"+acc[0]+"', '"+acc[1]+"', "+acc[2]+", "+acc[3]+", '"+acc[4]+"', '"+acc[5]+"', '"+acc[6]+"', '"+acc[7]+"', '"+acc[8]+"', '"+acc[9]+"', '"+acc[10]+"', '"+acc[11]+"');";
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
}
