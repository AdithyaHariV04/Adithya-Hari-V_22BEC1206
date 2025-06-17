package sqlconnect;

import java.util.*;
import java.sql.*;

public class crud_operation{

	public static void main(String[] args) {
		crud_operation objTest=new crud_operation();
		 String sno, name;
	        int mark;
	        Scanner sc = new Scanner(System.in);

	        System.out.print("Enter number of students: ");
	        int n = sc.nextInt();
	        for (int i = 0; i < n; i++) {
	            System.out.println("Enter details for student " + (i + 1));

	            System.out.print("Enter student number (sno): ");
	            sno = sc.nextLine();

	            System.out.print("Enter student name: ");
	            name = sc.nextLine();

	            System.out.print("Enter marks: ");
	            mark = sc.nextInt();
	            sc.nextLine();
	            objTest.create_data(sno, name, mark);
	        }*/
	        objTest.read_data1("104");
	        objTest.update_data("104", "raj", 100);
	        objTest.read_data();

	        sc.close();
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
public void read_data() {
    db_connection obj_DB_Connection = new db_connection();
    Connection connection = obj_DB_Connection.getConnection();
    PreparedStatement ps = null;
    ResultSet res = null;

    try {
        String query = "SELECT * FROM student";
        ps = connection.prepareStatement(query);
        res = ps.executeQuery(); 

        while (res.next()) {
            System.out.println(res.getString(1) + " " + res.getString(2) + " " + res.getInt(3));
        }
    } catch (Exception e) {
        System.out.println("Error: " + e);
    }
    }
public void read_data1(String s){
	 db_connection obj_DB_Connection = new db_connection();
	    Connection connection = obj_DB_Connection.getConnection();
	    PreparedStatement ps = null;
	    ResultSet res = null;

	    try {
	        String query = "SELECT * FROM student where s1_no = ?";
	        ps = connection.prepareStatement(query);
	       ps.setString(1, s);
	       res = ps.executeQuery();

	        if(res.next()) {
	            System.out.println(res.getString(1) + " " + res.getString(2) + " " + res.getInt(3));
	        }
	        else{
	        	System.out.println("No data is found");
	        }
	    } catch (Exception e) {
	        System.out.println("Error: " + e);
	    }
	    }
	

public void update_data(String s1_no, String name, int marks) {
    db_connection obj_DB_Connection = new db_connection();
    Connection connection = obj_DB_Connection.getConnection();
    PreparedStatement ps = null;

    try {
        String query = "UPDATE student SET name = ?, mark = ? WHERE s1_no = ?";
        ps = connection.prepareStatement(query);
        ps.setString(1, name);
        ps.setInt(2, marks);
        ps.setString(3, s1_no);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            System.out.println("Record updated successfully for ID: " + s1_no);
        } else {
            System.out.println("No record found with ID: " + s1_no);
        }

    } catch (Exception e) {
        System.out.println("Error during update: " + e);
    }
}
public void delete_data(String sl_no) {
    db_connection obj_DB_Connection = new db_connection();
    Connection connection = obj_DB_Connection.getConnection();
    PreparedStatement ps = null;

    try {
        String query = "DELETE FROM student WHERE s1_no = ?";
        ps = connection.prepareStatement(query);
        ps.setString(1, sl_no);

        int rowsDeleted = ps.executeUpdate();

        if (rowsDeleted > 0) {
            System.out.println("Record deleted successfully for ID: " + sl_no);
        } else {
            System.out.println("No record found with ID: " + sl_no);
        }

    } catch (Exception e) {
        System.out.println("Error during deletion: " + e);
    } finally {
        try {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        } catch (Exception ex) {
            System.out.println("Error closing resources: " + ex);
        }
    }
}

}

