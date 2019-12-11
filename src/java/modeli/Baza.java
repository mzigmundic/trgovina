package modeli;
import java.sql.*;

public class Baza {
    public Connection conn;
    public Statement stmt;
    public Baza() { conn=null; stmt=null; }
    public void connect() throws SQLException, ClassNotFoundException {
        // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Class.forName("com.mysql.jdbc.Driver");
        // conn = DriverManager.getConnection( "jdbc:sqlserver://localhost", "sa", "SQL" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost", "root", "" );
        stmt = conn.createStatement();
        stmt.executeUpdate("USE Trgovina");
    }
    public void  disconnect() throws SQLException {
        stmt.close();
        conn.close();
    }
    public ResultSet selectupit(String s) throws SQLException {
        Statement st = conn.createStatement();
        return st.executeQuery(s);
    }
    public int upit(String s) throws SQLException {
        return stmt.executeUpdate(s);
    }
}
