package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/TagGrid?useSSL=false&autoReconnection=true&characterEncoding=utf8";
			String dbID = "root";
			String dbPassword = "gowlsWkd2784";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

}
