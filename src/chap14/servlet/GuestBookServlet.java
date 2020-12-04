package chap14.servlet;

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
 * Servlet implementation class GuestBookServlet
 */
@WebServlet("/sample/guestBook")
public class GuestBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestBookServlet() {
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
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		
		String sql = "INSERT INTO guest_book (title, body, inserted) "
					+ " VALUES (?,?,sysdate)";
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
		pstmt.setString(1, title);
		pstmt.setString(2, body);
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