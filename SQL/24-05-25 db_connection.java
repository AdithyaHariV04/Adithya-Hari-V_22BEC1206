package sqlconnect;
import java.sql.*;
import java.util.*;
public class db_connection {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		db_connection newdb= new db_connection();
		System.out.println(newdb.getConnection());

	}
	public Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vit", "root", "Adivarsha04$");
		}
		catch(Exception e){
			System.out.println(e);
		}
		return con;
	}

}
