
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Fetch
 */
@WebServlet("/Fetch")
public class Fetch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetch() {
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
		String type = request.getParameter("type");
		String sel_val = request.getParameter("sel");
		String name =request.getParameter("name");
		String number= request.getParameter("number");
		String mail= request.getParameter("email");
		ResultSet rs=null;
		String check_dept= new String("dept_name");
		String check_desig = new String("post_name");
		String check_name = new String("p_name");
		String check_no = new String("p_no");
		String check_mail = new String("email");
		String check_complete = new String("complete");
		response.setContentType("text/html");

		  List dataList	= new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false" ,"root","Prakhar123@");
			Statement stmt = con.createStatement();
		if(type.equals(check_dept)) {
			  stmt.executeQuery("select *from database_d where department='"+sel_val+"'");
			rs = stmt.getResultSet();
				
		}
		else if(type.contentEquals(check_name))
		{
			 stmt.executeQuery("select *from database_d where person='"+name+"'");
				rs = stmt.getResultSet();
		}
		else if(type.contentEquals(check_no))
		{
			 stmt.executeQuery("select *from database_d where phone_o='"+number+"'");
				rs = stmt.getResultSet();
		}
		else if(type.contentEquals(check_mail))
		{
			 stmt.executeQuery("select *from database_d where email='"+mail+"'");
				rs = stmt.getResultSet();
		}
		else if(type.contentEquals(check_complete))
		{
			 stmt.executeQuery("select *from database_d");
				rs = stmt.getResultSet();
		}
		else
		{
			//rs = stmt.executeQuery("select *from database_d where department='"+dept+"'");	
			 PrintWriter out= response.getWriter();
				//out.println(dept);
				out.println(check_dept);
		}
			while(rs.next()) { 
				dataList.add(rs.getInt("s_no"));
				dataList.add(rs.getString("person"));
				dataList.add(rs.getString("department"));
				dataList.add(rs.getString("designation"));
				dataList.add(rs.getString("email"));
				dataList.add(rs.getInt("phone_o"));
				dataList.add(rs.getInt("phone_h"));
				dataList.add(rs.getString("office_no"));
				//dataList.add(rs.getString("house_no"));
				//response.sendRedirect("home.jsp");
			}
//			else
//			{
//				PrintWriter out= response.getWriter();
//				out.println("Something wrong ");
//			}
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		  request.setAttribute("data",dataList);

		  //Disptching request

		  RequestDispatcher dispatcher = request.getRequestDispatcher("details.jsp");

		  if (dispatcher != null){

		  dispatcher.forward(request, response);

		  } 
	}

}
