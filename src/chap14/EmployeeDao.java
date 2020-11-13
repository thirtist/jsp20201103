package chap14;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

	public static List<String> getNameLike3(String name){
		List<String> list = new ArrayList<>();
		String sql = "SELECT ename " + "FROM employee " + "WHERE ename LIKE '%" + name + "%'";
		list = getBySql(sql, name);
		return list;
	}

	
	public static List<String> getBySql(String sql, String str) {
		
		List<String> list = new ArrayList<>();
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "c##mydbms";
		String password = "admin";
		
		// 1. 드라이버 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// try-resource문 -autoClosable을 상속하고 있어야함
		try (
				// 2. 커넥션 생성 (try-resource문으로 자동닫기) -autoClosable을 상속하고 있어야함
				// 3. Statement 생성 (try-resource문으로 자동닫기) -autoClosable을 상속하고 있어야함
				Connection conn = DriverManager.getConnection(url, user, password);
				Statement stmt = conn.createStatement();) {

			// 4. 쿼리 실행
			ResultSet rs = stmt.executeQuery(sql);
			// 5. 결과 처리
			while (rs.next()) {
				list.add(rs.getString(str));
			}

		} catch (Exception e) {

		}
		;
		return list;
	}

	public static List<String> getNameLike2(String name) {
		List<String> list = new ArrayList<>();

		name = name.toUpperCase();

		String sql = "SELECT ename " + "FROM employee " + "WHERE ename LIKE '%" + name + "%'";

		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "c##mydbms";
		String password = "admin";

		// 1. 드라이버 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// try-resource문 -autoClosable을 상속하고 있어야함
		try (
				// 2. 커넥션 생성 (try-resource문으로 자동닫기) -autoClosable을 상속하고 있어야함
				// 3. Statement 생성 (try-resource문으로 자동닫기) -autoClosable을 상속하고 있어야함
				Connection conn = DriverManager.getConnection(url, user, password);
				Statement stmt = conn.createStatement();) {

			// 4. 쿼리 실행
			ResultSet rs = stmt.executeQuery(sql);
			// 5. 결과 처리
			while (rs.next()) {
				list.add(rs.getString("ename"));
			}

		} catch (Exception e) {

		}
		;
		return list;
	}

	public static List<String> getNameLike(String name, boolean asc) {
		List<String> list = new ArrayList<>();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		name = name.toUpperCase();

		String sql = "SELECT ename " + "FROM employee " + "WHERE ename LIKE '%" + name + "%' " + "ORDER BY ename ";
		if (asc) {
			sql += "ASC";
		} else {
			sql += "DESC";
		}

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
			}
			;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 6. statement 닫고
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 7. connection 닫고
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return list;

	}

	public static List<String> getNameLike(String name) {
		List<String> list = new ArrayList<>();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		name = name.toUpperCase();

		String sql = "SELECT ename " + "FROM employee " + "WHERE ename LIKE '%" + name + "%'";

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
			}
			;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 6. statement 닫고
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 7. connection 닫고
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return list;
	}

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
			}
			;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 6. statement 닫고
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 7. connection 닫고
			try {
				if (conn != null) {
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
