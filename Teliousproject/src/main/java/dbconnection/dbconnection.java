package dbconnection;

import java.sql.*;

public class dbconnection{

	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/pythondb_test","pythondb_test","PYt3StDB75S");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

}