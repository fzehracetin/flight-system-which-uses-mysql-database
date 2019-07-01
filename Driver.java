import java.sql.*;

public class Driver {

	public static void main(String[] args) {
		
		try {
			
			// 1. Get a connection to database
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/giraffe?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey", "root", "1234" );
			
			// 2. Create a statement
			Statement myStmt = myConn.createStatement();
			
			// 3. Execute SQL query
			ResultSet myRs = myStmt.executeQuery("SELECT * FROM ucus_noktasi");
			
			// 4. Process the result set
			while (myRs.next() ) {
				System.out.println(myRs.getString("sehir") + " ," + myRs.getString("liman_kod") + " ," + myRs.getString("liman_id"));
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		
		
		
		
		
			
		
	}

}
