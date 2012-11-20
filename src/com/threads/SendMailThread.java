package com.threads;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import com.common.Connect;

public class SendMailThread extends Thread{

	private volatile boolean flag = true;
	private HttpServletRequest request;
	private String from;
	private String password;
	private String host;
	
	public SendMailThread(HttpServletRequest request) {
		this.request = request;
	}
	
	public void setFlag(boolean flag) {
        this.flag = flag;
    }
	
	public synchronized void stopCurrentThread() {
        this.flag = false;
    }
	
	public void run() {
		
		try{
			Connection conn  = Connect.getconn();
			Statement statement = conn.createStatement();
			String sql;
			sql = "select * from email_info where id = 2";

			ResultSet rs = statement.executeQuery(sql);

			if(rs.next()) {	
			  host = rs.getString("host");
			  from = rs.getString("username");
			  password = rs.getString("password");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//String host = null;
		//if(from.indexOf("@gmail") >= 0)
		//	host = "smtp.gmail.com";//邮件服务器的SMTP服务 我注册的是www.gmail.com信箱服务器
		//if(from.indexOf("@qq") >= 0 || from.indexOf("@vip.qq") >= 0)
		//	host = "smtp.qq.com";
		//if(from.indexOf("@163") >= 0)
		//	host = "smtp.163.com";
		
		System.setProperty("mail.smtp.auth","true");//这句话必须加 否则服务器验证一般都会提示验证失败 这个让我苦恼了不少时间
		// Get system properties
		Properties props = System.getProperties();

		// Setup mail server
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		
		if (from.indexOf("@gmail") >= 0) {
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.setProperty("mail.smtp.socketFactory.fallback", "false");
			props.setProperty("mail.smtp.port", "465");
			props.setProperty("mail.smtp.socketFactory.port", "465");
		}
		
		String path = request.getSession().getServletContext().getRealPath(""); 
		
		// Get session
		Session session =  Session.getInstance(props, null);
		
		while(flag) {
			Connection conn  = Connect.getconn();	
			try{
				Statement statement = conn.createStatement();
				Statement statement2 = conn.createStatement();
				String sql = "select * from member_signature, member_info where issend = '0' and member_info.uid = member_signature.member_id";
				ResultSet rs = statement.executeQuery(sql);
				while(rs.next())
				{	
					String fileAttachment = path + "/User/UserSignature/" + rs.getString("name") + ".png";//要发送附件的位置
					String to = rs.getString("email");//发送给谁
				
					// Define message
					MimeMessage message = new MimeMessage(session);
					try {
						message.setFrom(new InternetAddress(from));
						message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
						message.setSubject("copy of signature");
					
						// create the message part
						MimeBodyPart messageBodyPart = new MimeBodyPart();
					
						//fill message
						messageBodyPart.setText("Hi," + rs.getString("firstname") +"\nthis is the copy of your signatrue, please keep it carefully.\nRegards");//邮件正文内容
	
						Multipart multipart = new MimeMultipart();
						multipart.addBodyPart(messageBodyPart);

						// Part two is attachment
						messageBodyPart = new MimeBodyPart();
						DataSource source = new FileDataSource(fileAttachment);
						messageBodyPart.setDataHandler(new DataHandler(source));
						messageBodyPart.setFileName(fileAttachment);
						multipart.addBodyPart(messageBodyPart);

						// Put parts in message
						message.setContent(multipart);
						message.saveChanges();
						Transport transport = session.getTransport("smtp");
						// transport.connect();
						transport.connect(host, from, password);//发信服务器，自己信箱的用户名，密码
						transport.sendMessage(message, message.getAllRecipients());
						transport.close();
						statement2.executeUpdate("UPDATE member_signature SET issend = '1' WHERE id = '" + rs.getString("id") + "'");
						// Send the message
						// Transport.send( message );
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			try {
				conn.close();
				Thread.sleep(60000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
