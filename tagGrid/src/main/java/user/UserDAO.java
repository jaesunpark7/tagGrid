package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.UserDTO;
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
		
		return -1; // 회원가입 실패
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
	
	// 이메일 검증된 사용자 인 지 확인
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection() ; // DB와 연결하는 conn 객체를 만들어 주는 것
			pstmt = conn.prepareStatement(SQL) ;
			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getBoolean(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// DB에 접근하는데에 사용했던 변수들 사용중지해주는것
			try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
			
		}
		return false; // DB오류, 회원가입 실패
	} 
	
	// 이메일 검증이 끝난 사용자라는 것을 업데이트해주기
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection() ; // DB와 연결하는 conn 객체를 만들어 주는 것
			pstmt = conn.prepareStatement(SQL) ;
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// DB에 접근하는데에 사용했던 변수들 사용중지해주는것
			try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			
		}
		return false; // DB오류, 회원가입 실패
	} 
	
	// 특정 사용자의 이메일 자체를 반환해주는 함수 정의
	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection() ; // DB와 연결하는 conn 객체를 만들어 주는 것
			pstmt = conn.prepareStatement(SQL) ;
			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// DB에 접근하는데에 사용했던 변수들 사용중지해주는것
			try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
			
		}
		return null ; // DB오류, 회원가입 실패
	} 
	

	
}
