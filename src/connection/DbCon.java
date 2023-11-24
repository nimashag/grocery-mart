package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {

	
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
        	
        	try {
        		
        		Class.forName("com.mysql.jdbc.Driver");
                connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db","root","Root1234@");
                System.out.print("connected");
        	}
        	
        	catch  (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle any potential exceptions here
            }
            
        }
        return connection;
    }
	
}
