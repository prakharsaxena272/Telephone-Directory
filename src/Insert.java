

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String department = request.getParameter("department");
		String designation = request.getParameter("designation");
		String name =request.getParameter("Name");
		String phone_o= request.getParameter("Telephone_office");
		String phone_h= request.getParameter("Telephone_house");
		String mail= request.getParameter("EMail");
		String office= request.getParameter("office_no");
		String house_no= request.getParameter("house");
		ResultSet rs=null;
		ResultSet rs1=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false" ,"root","Prakhar123@");
			Statement stmt = con.createStatement();
			//rs1=stmt.executeQuery("select s_no from database_d order by s_no desc limit 1");
			int val = stmt.executeUpdate("insert into database_d(person,department,designation,email,phone_o,phone_h,office_no,house_no) values('"+name+"','"+department+"','"+designation+"','"+mail+"','"+phone_o+"','"+phone_h+"','"+office+"','"+house_no+"')");
		
			if(val>0) { 
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				response.sendRedirect("welcome.jsp");
			}
			else
			{
				PrintWriter out= response.getWriter();
				out.println(name);
				//out.println(pass);
				out.println("wrong password");
			}
		
		} catch (ClassNotFoundException e) {
			PrintWriter out = null;
			// TODO Auto-generated catch block
			out.println("connection made");
			e.printStackTrace();
		} catch (SQLException e) {
			PrintWriter out = null;
			// TODO Auto-generated catch block
			out.println("connection not made");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
