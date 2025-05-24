package crud_operation;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class crud_operation{

	public static void main(String[] args) {
		crud_operation objTest=new crud_operation();
  
	objTest.create_data("103", "manoj", 55);
	objTest.create_data("104", "karthick", 65);
    
}

public void create_data(String sl_no,String name,int mark){
	db_connection obj_DB_Connection=new db_connection();
	Connection connection=obj_DB_Connection.getConnection();
	PreparedStatement ps=null;
	try {
		String query="insert into student values (?,?,?)";
		ps=connection.prepareStatement(query);
		ps.setString(1, sl_no);
		ps.setString(2, name);
		ps.setInt(3, mark);
		System.out.println(ps);
		ps.executeUpdate();
	} catch (Exception e) {
		System.out.println(e);
	}
}

}