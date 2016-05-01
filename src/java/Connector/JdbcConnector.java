package Connector;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 *
 * @author Tian
 */
public class JdbcConnector {

    private static String mysJDBCDriver = "com.mysql.jdbc.Driver";
    private static String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/qixchen";
    private static String mysUserID = "qixchen";
    private static String mysPassword = "108605598";
    private static Connection conn = null;

    public static ResultSet excuteQuery(String query) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Properties sysprops = System.getProperties();
            sysprops.put("user", mysUserID);
            sysprops.put("password", mysPassword);
            conn = DriverManager.getConnection(mysURL,sysprops);
            ResultSet rs;
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            try {
//                conn.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
        }
        return null;
    }

    public static boolean excuteUpdate(String query) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Properties sysprops = System.getProperties();
            sysprops.put("user", mysUserID);
            sysprops.put("password", mysPassword);
            conn = DriverManager.getConnection(mysURL, sysprops);
            ResultSet rs;
            Statement stmt = conn.createStatement();
            int u = stmt.executeUpdate(query);
            if (u > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            try {
//                conn.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
        }
        return false;
    }
    public static void close() throws SQLException{
        conn.close();
    }
}
