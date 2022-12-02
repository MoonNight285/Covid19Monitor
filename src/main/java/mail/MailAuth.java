package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "subbackya77@naver.com";
        String mail_pw = "fhfflvkq11!";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
