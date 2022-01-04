package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	// gmail smtp 이용하기 위함
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("laurenzoe07@gmail.com", "gowlsWkd!784");
	}
	

}
