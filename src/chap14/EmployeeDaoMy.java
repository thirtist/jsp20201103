package chap14;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDaoMy {

	public static List<String> listEmplyeeName() {

		List<String> list = new ArrayList<String>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT ename FROM employee";

		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "c##mydbms";
		String password = "admin";

		// 1. 클래스 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. 커넥션 생성
			conn = DriverManager.getConnection(url, user, password);

			// 3. Statement 생성
			stmt = conn.createStatement();

			// 4. 쿼리 실행
			rs = stmt.executeQuery(sql);

			// 5. 결과 처리

			while (rs.next()) {
				list.add(rs.getString("ename"));
			};

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 6. statement 닫고
			try {
				if(stmt !=null) {
					stmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 7. connection 닫고
			try {
				if(conn !=null) {
					conn.close();					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return list;
	}

}
