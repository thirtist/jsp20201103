package chap17.sample3;

import java.io.IOException;
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

import chap05.Post;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/sample3/post/view")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		Post post = getPost(id);

		String path = "/WEB-INF/view/chap17/view.jsp";

		request.setAttribute("post", post);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected Post getPost(String id) {

		String sql = "SELECT id, title, body FROM post WHERE id =" + id;
		String user = "C##MYDBMS";
		String password = "admin";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";

		Post post = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// 1.드라이버로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2.연결생성
			con = DriverManager.getConnection(url, user, password);
			// 3.statement생성
			stmt = con.createStatement();
			// 4.쿼리 실행
			rs = stmt.executeQuery(sql);
			// 5.결과처리
			// SELECT id, title FROM post
			if (rs.next()) {
				post= new Post();
				post.setId(rs.getInt(1));
				post.setTitle(rs.getString(2));
				post.setBody(rs.getString(3));
			}

			// 6.statement,연결닫기
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) {					
					stmt.close();
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
		
		return post;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
