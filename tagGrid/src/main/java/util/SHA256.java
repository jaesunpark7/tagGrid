package util;

import java.security.MessageDigest;

public class SHA256 {
	
	// 이메일 인증 코드 확인
	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer() ;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256") ;
			byte[] salt = "Hello! This is salt!".getBytes(); // 단순하게 SHA256만 사용하면 해킹위험 높아져서 salt값으로 변환해주는 것
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for (int i = 0; i < chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) result.append("0");
				result.append(hex);
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}

}
