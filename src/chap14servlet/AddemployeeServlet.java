package chap14servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddemployeeServlet
 */
@WebServlet("/sample/employee/add")
public class AddemployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddemployeeServlet() {
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
		String eno = request.getParameter("eno");
		String ename = request.getParameter("ename");
		String dno = request.getParameter("dno");
		
		String sql = "INSERT INTO employee (eno, ename, dno) "
					+ " VALUES (?,?,?)";
		String user = "C##MYDBMS";
		String password = "admin";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		
		try {
		//1.드라이버로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.연결생성
		Connection con = DriverManager.getConnection(url, user, password);
		//3.statement생성
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(eno));
		pstmt.setString(2, ename);
		pstmt.setInt(3, Integer.parseInt(dno));
		//4.쿼리 실행
		pstmt.executeUpdate();
		//5.결과처리
		
		//6.statement,연결닫기
		pstmt.close();
		con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
