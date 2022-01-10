package tag;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class TagDAO {
	
	public int write(TagDTO tagDTO) {
		String SQL = "INSERT INTO TAG VALUES (NULL, 0, ?, ?, ?, ?, ?, ?, ?, ?, now())";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, tagDTO.getTagID());
			pstmt.setString(2, tagDTO.getTagKR());
			pstmt.setString(3, tagDTO.getTagEN());
			pstmt.setString(4, tagDTO.getUOM());
			pstmt.setString(5, tagDTO.getPlant());
			pstmt.setString(6, tagDTO.getProcess());
			pstmt.setString(7, tagDTO.getEquip());
			pstmt.setString(8, tagDTO.getTagUse());
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -1; // DB오류
	}
	
	public ArrayList<TagDTO> getList (String plant, String process, String equip, String tagID, String tagKR, String tagUse) {
		if (tagUse == "전체") {
			tagUse = "";
		}
		
		ArrayList<TagDTO> tagList = null;
		String SQL = "SELECT * FROM TAG WHERE plant = ? AND process LIKE ? AND equip LIKE ? AND tagID LIKE ? AND " +
					"tagKR LIKE ? AND tagUse LIKE ? ORDER BY no ASC";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, plant);
			pstmt.setString(2, "%" + process + "%");
			pstmt.setString(3, "%" + equip + "%");
			pstmt.setString(4, "%" + tagID + "%");
			pstmt.setString(5, "%" + tagKR + "%");
			pstmt.setString(6, tagUse);
			
			rs = pstmt.executeQuery();
			tagList = new ArrayList<TagDTO>();
			while (rs.next()) {
				TagDTO tag = new TagDTO(
					rs.getInt(1),
					rs.getInt(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8),
					rs.getString(9),
					rs.getString(10),
					rs.getTimestamp(11)
				);
				tagList.add(tag);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		return tagList;
	}

}
