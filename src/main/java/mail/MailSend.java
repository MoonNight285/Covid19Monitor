package mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
    private String toAddress;
    private String msgTitle;
    private String msgContent;

    public MailSend() {

    }

    public MailSend(String toAddress, String msgTitle, String msgContent) {
        this.toAddress = toAddress;
        this.msgTitle = msgTitle;
        this.msgContent = msgContent;
    }

    public void MailSend() {
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.naver.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
        
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("subbackya77@naver.com", "코로나 모니터"));
            InternetAddress to = new InternetAddress(toAddress);
            msg.setRecipient(Message.RecipientType.TO, to);
            msg.setSubject(msgTitle, "UTF-8");
            msg.setText(msgContent, "UTF-8");
            
            Transport.send(msg);
            
        } catch(AddressException ae) {
            System.out.println("AddressException : " + ae.getMessage());
        } catch(MessagingException me) {
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());
        }
        
    }
}
