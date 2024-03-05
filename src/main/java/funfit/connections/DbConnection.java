package funfit.connections;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/funfit", "root", "@KarthikMysql123");
		} catch (Exception e) {
			System.out.println("Something went wrong " + e);
		}
		
		return conn;
	}
}
