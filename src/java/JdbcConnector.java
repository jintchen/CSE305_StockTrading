
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

/**
 *
 * @author Tian
 */
public class JdbcConnector {

    private static String mysJDBCDriver = "com.mysql.jdbc.Driver";
    private static String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu/jintchen";
    private static String mysUserID = "jintchen";
    private static String mysPassword = "109222754";
    private static Connection conn = null;

    public static ResultSet excuteQuery(String query) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Properties sysprops = System.getProperties();
            sysprops.put("user", mysUserID);
            sysprops.put("password", mysPassword);
            conn = DriverManager.getConnection(mysURL, sysprops);
            ResultSet rs;
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

}
