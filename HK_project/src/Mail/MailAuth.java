package Mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
    public PasswordAuthentication getPasswordAuthentication() {
        
    	// 네이버나 Gmail사용자 계정 설정.
        // Gmail의 경우 @gmail.com을 제외한 아이디만 입력한다.
        return new PasswordAuthentication("gyrud6744@gmail.com", "kimhk0489@");
    }
}