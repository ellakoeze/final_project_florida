import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class dbAccess {

	public static void main(String[] args) {
		Connection conn;
		Statement stmt;
		try {
			// load the JDBC driver
			Class.forName("org.postgresql.Driver");
			
			// establish connection
			String url = "jdbc:postgresql://localhost:5432/final_project_florida";
			conn = DriverManager.getConnection(url, "ellakoeze", "");
			
			// query the database
			String sql = "select ST_AsText(geom) as geom from airports_2015";
			stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(sql);
			
			// print the result
			if (res != null) {
				while (res.next()) {
					System.out.println("geom: " + res.getString("geom"));
				}
			}
			
			// clean up
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
