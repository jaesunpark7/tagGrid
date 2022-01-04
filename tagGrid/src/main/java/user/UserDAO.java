package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	public int join(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, false)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserPlant());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(6, user.getUserEmailHash());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -1;
	}
	
	public int login(String userID, String password) {
		String SQL = "SELECT password FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			// DB에서 가져온 비밀번호가 사용자가 입력한 것과 일치하는 지 확인
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					return 1;
				} else {
					return 0;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -1;
	}
	
}
