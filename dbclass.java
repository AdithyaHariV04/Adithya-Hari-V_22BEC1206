package mongodbconnector;
import java.sql.*;
public class dbclass {
	public static void main(String [] args){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vit", "root", "Adivarsha04$");
			System.out.println(con);
			Statement st=con.createStatement();
			ResultSet res=st.executeQuery("Select * from worker");
			while(res.next()){
				System.out.println(res.getInt(1)+" "+res.getString(2)+" "+res.getString(3)+" "+res.getInt(4)+" "+res.getString(5)+" "+res.getString(6));
			}
			con.close();
		}
		catch(Exception e){
			System.out.println("Sorry for inconvinence");

			
		}
	}

}
