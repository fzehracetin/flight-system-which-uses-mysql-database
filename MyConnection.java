
import java.sql.Connection;
import java.sql.DriverManager;


public class MyConnection {
    public static Connection getConnection(){
        Connection con = null;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/giraffe?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey","root","1234");
        }catch(Exception ex){
        System.out.println(ex.getMessage());
    }
        
        return con;
    }
}