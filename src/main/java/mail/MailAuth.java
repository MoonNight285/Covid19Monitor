package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "kimjyjh321@gmail.com";
        String mail_pw = "VMFFKDehfm11!";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
