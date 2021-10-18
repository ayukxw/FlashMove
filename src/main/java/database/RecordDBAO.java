package database;

import java.sql.*;
import javax.sql.*;

import javax.naming.*;
import java.util.*;
import exception.*;
import enums.RecordType;
import enums.TransportationType;

public class RecordDBAO {
	private static final Map<Integer, String> typeMap = new HashMap();
    private ArrayList records;
    Connection con;
    private boolean conFree = true;
    
    // Database configuration
    public static String url = "jdbc:mysql://localhost:3306/FlashMove";
    public static String dbdriver = "com.mysql.jdbc.Driver";
    public static String username = "root";
    public static String password = "12345678zZ";
    
    public RecordDBAO() throws Exception {
        try {
            /*
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/BookDB");
            con = ds.getConnection();
            */
            Class.forName(dbdriver);
            con = DriverManager.getConnection(url, username, password);
            
        } catch (Exception ex) {
            System.out.println("Exception in RecordDBAO: " + ex);
            throw new Exception("Couldn't open connection to database: " +
                    ex.getMessage());
        }
    }
    
    public void remove() {
        try {
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    protected synchronized Connection getConnection() {
        while (conFree == false) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
        
        conFree = false;
        notify();
        
        return con;
    }
    
    protected synchronized void releaseConnection() {
        while (conFree == true) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
        conFree = true;
        notify();
    }
    
    public List getRecords() throws Exception {
    	records = new ArrayList();
        
        try {
            String selectStatement = "select * " + "from tb_record";
            getConnection();
            
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            ResultSet rs = prepStmt.executeQuery();
            
            while (rs.next()) {
            	RecordDetails recordsDetails =
                        new RecordDetails(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4),rs.getString(5),
                        rs.getInt(6),rs.getString(7));
            	recordsDetails.setStatusName(RecordType.getByKey(recordsDetails.getStatus())); 
            	recordsDetails.setTypeName(TransportationType.getByKey(recordsDetails.getType()));    
            	records.add(recordsDetails);
            	System.out.println("Debugging message22");
            }
            
            prepStmt.close();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        }
        
        releaseConnection();
        
        return records;
    }
    
}
