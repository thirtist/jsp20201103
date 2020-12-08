package chap17.sample3;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap05.Post;

/**
 * Servlet implementation class RemoveServlet
 */
@WebServlet(name = "RemoveServlet2", urlPatterns = { "/sample3/post/remove" })
public class RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		String sql = "DELETE FROM post WHERE id=?";
		
		// delete jdbc code
		remove(sql, id);
		
		response.sendRedirect(request.getContextPath()+"/sample3/post/main");
	}
	
	protected void remove(String sql, String id) {

		String user = "C##MYDBMS";
		String password = "admin";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";

		Connection con = null;
		PreparedStatement pstmt = null;
		int i = 0;
		
		try {
			// 1.드라이버로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2.연결생성
			con = DriverManager.getConnection(url, user, password);
			// 3.statement생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.valueOf(id));
			// 4.쿼리 실행
			i = pstmt.executeUpdate();
			// 5.결과처리
			// SELECT id, title FROM post
			if (i != 0) {
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}

			// 6.statement,연결닫기
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {					
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(con != null) {
					con.close();					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
