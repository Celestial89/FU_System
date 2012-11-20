package com.servlet;

import java.io.*;
import java.security.Security;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.Connect;
import com.common.CreateFileName;
import com.common.SetStartFunction;
import com.sun.mail.pop3.POP3Folder;
import com.threads.MessageThread;

public class PraseMimeMessage extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private MimeMessage mimeMessage = null;
	private String saveAttachPath = "d:/temp";          //�������غ�Ĵ��Ŀ¼
	private StringBuffer bodytext = new StringBuffer();
 
	//����ʼ����ݵ�StringBuffer����
	private String dateformat = "yy-MM-dd HH:mm";    //Ĭ�ϵ���ǰ��ʾ��ʽ
	public static MessageThread mt;
 
	public	 static String host = null; // ��pop.mail.yahoo.com.cn��
	public static 	String username= null; // ��wwp_1124��
	public 	static String password = null; // ��........��
	public static String EmailFrom = null;
 
 
	/**
	 *  ���캯��,��ʼ��һ��MimeMessage����
	 */
	public PraseMimeMessage() {
		
	}
	public PraseMimeMessage(MimeMessage mimeMessage){
		this.mimeMessage = mimeMessage;
	}

	public void setMimeMessage(MimeMessage mimeMessage){
		this.mimeMessage = mimeMessage;
	}
  
	/**
     *  ��÷����˵ĵ�ַ������
     */
	public String getFrom() throws Exception {
		InternetAddress address[] = (InternetAddress[])mimeMessage.getFrom();
		String from = address[0].getAddress();
		if(from == null) from="";
		String personal = address[0].getPersonal();
		if(personal == null) personal="";
		String fromaddr = personal+"<"+from+">";
		return fromaddr;
	}

	/**
	 *  ����ʼ����ռ��ˣ����ͣ������͵ĵ�ַ�����������������ݵĲ����Ĳ�ͬ
	 *  "to"----�ռ��� "cc"---�����˵�ַ "bcc"---�����˵�ַ
	 */

	public String getMailAddress(String type)throws Exception {
		String mailaddr = "";
		String addtype = type.toUpperCase();
		InternetAddress []address = null;
		if(addtype.equals("TO") || addtype.equals("CC") ||addtype.equals("BCC")) {
			if(addtype.equals("TO")){
				address = (InternetAddress[])mimeMessage.getRecipients(Message.RecipientType.TO);
			}
			else if(addtype.equals("CC")){
				address = (InternetAddress[])mimeMessage.getRecipients(Message.RecipientType.CC);
			}
			else{
				address = (InternetAddress[])mimeMessage.getRecipients(Message.RecipientType.BCC);
			}
			if(address != null) {
				for(int i=0;i<address.length;i++){
					String email=address[i].getAddress();
					if(email==null) 
						email="";
					else {
						email=MimeUtility.decodeText(email);
					}
					String personal=address[i].getPersonal();
					if(personal==null) 
						personal="";
					else {
						personal=MimeUtility.decodeText(personal);
					}
					String compositeto=personal+"<"+email+">";
					mailaddr+=","+compositeto;
				}
				mailaddr=mailaddr.substring(1);
			}
		}
		else {
			throw new Exception("Error emailaddr type!");
		}
		return mailaddr;
	}
    
	/**
	 * 	����ʼ�����
	 */
	public String getSubject()throws MessagingException {
		String subject = "";
		try{
			subject = MimeUtility.decodeText(mimeMessage.getSubject());
			if(subject == null) subject="";
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return subject;
	}
    
	/**
	 * ����ʼ���������
	 */
	public String getSentDate()throws Exception {
		Date sentdate = mimeMessage.getSentDate();
		SimpleDateFormat format = new SimpleDateFormat(dateformat);
		return format.format(sentdate);
	}
    
	/**
	 * ����ʼ���������
	 */
	public String getBodyText() {
		return bodytext.toString();
	}
    
	/**
	 * 	�����ʼ����ѵõ����ʼ����ݱ��浽һ��StringBuffer�����У������ʼ�
	 * 	��Ҫ�Ǹ���MimeType���͵Ĳ�ִͬ�в�ͬ�Ĳ�����һ��һ���Ľ���
	 */
	public void getMailContent(Part part) throws Exception {
		String contenttype = part.getContentType();

		int nameindex = contenttype.indexOf("name");
		boolean conname = false;
		if (nameindex != -1)
			conname = true;
		if (part.isMimeType("text/plain") && !conname) {
			bodytext.append((String) part.getContent());
		} 
		else if (part.isMimeType("text/html") && !conname) {
			bodytext.append((String) part.getContent());
		} 
		else if (part.isMimeType("multipart/*")) {
			Multipart multipart = (Multipart) part.getContent();
			int counts = multipart.getCount();
			for (int i = 0; i < counts; i++) {
				getMailContent(multipart.getBodyPart(i));
			}
		} 
		else if (part.isMimeType("message/rfc822")) {
			getMailContent((Part) part.getContent());
		} 
		else {
			
		}
	}

	/**
	 * �жϴ��ʼ��Ƿ���Ҫ��ִ�������Ҫ��ִ����"true",���򷵻�"false"
	 */
	public boolean getReplySign()throws MessagingException {
		boolean replysign = false;
		String needreply[] = mimeMessage.getHeader("Disposition-Notification-To");
		if(needreply != null){
			replysign = true;
		}
		return replysign;
	}
    
	/**
	 * ��ô��ʼ���Message-ID
	 */
	public String getMessageId()throws MessagingException{
		return mimeMessage.getMessageID();
	}
    
	/**
	 * ���жϴ��ʼ��Ƿ��Ѷ������δ�����ط���false,��֮����true��
	 */
	public boolean isNew()throws MessagingException{
	   boolean isnew = false;
	   if(((Message)mimeMessage).isSet(Flags.Flag.SEEN)) {
		   isnew=true;
	   }
	   return isnew;
	}
 
	/**
	 * �жϴ��ʼ��Ƿ��������
	 */
	public boolean isContainAttach(Part part)throws Exception {
		boolean attachflag = false;
		if(part.isMimeType("multipart/*")){
			Multipart mp = (Multipart)part.getContent();
			for(int i=0;i<mp.getCount();i++){
				BodyPart mpart = mp.getBodyPart(i);
				String disposition = mpart.getDisposition();
				if((disposition != null) &&((disposition.equals(Part.ATTACHMENT)) ||(disposition.equals(Part.INLINE))))
					attachflag = true;
				else if(mpart.isMimeType("multipart/*")) {
					attachflag = isContainAttach((Part)mpart);
				}
				else {
					String contype = mpart.getContentType();
					if(contype.toLowerCase().indexOf("application") != -1) attachflag=true;
					if(contype.toLowerCase().indexOf("name") != -1) attachflag=true;
				}
			}
		}
		else if(part.isMimeType("message/rfc822")) {
			attachflag = isContainAttach((Part)part.getContent());
		}
		return attachflag;
	}
   
	/**
	 * �����渽����
	 */
	public void saveAttachMent(Part part)throws Exception {
		String fileName = "";
		if(part.isMimeType("multipart/*")) {
			Multipart mp = (Multipart)part.getContent();
			for(int i=0;i<mp.getCount();i++) {
				BodyPart mpart = mp.getBodyPart(i);
				String disposition = mpart.getDisposition();
				if((disposition != null) &&((disposition.equals(Part.ATTACHMENT)) ||(disposition.equals(Part.INLINE)))) {
					fileName = mpart.getFileName();
					if(fileName.toLowerCase().indexOf("gb2312") != -1){
						fileName = MimeUtility.decodeText(fileName);
					}
					saveFile(fileName,mpart.getInputStream());
				}
				else if(mpart.isMimeType("multipart/*")) {
					saveAttachMent(mpart);
				}
				else {
					fileName = mpart.getFileName();
					if((fileName != null) && (fileName.toLowerCase().indexOf("GB2312") != -1)) {
						fileName=MimeUtility.decodeText(fileName);
						saveFile(fileName,mpart.getInputStream());
					}
				}
			}
		}
		else if(part.isMimeType("message/rfc822")){
			saveAttachMent((Part)part.getContent());
		}
	}
    
	/**
	 * �����ø������·����
	 */
	public void setAttachPath(String attachpath){
		this.saveAttachPath = attachpath;
	}
    
	/**
	 * ������������ʾ��ʽ��
	 */
	public void setDateFormat(String format)throws Exception{
		this.dateformat = format;
	}
    
	/**
	 * ����ø������·����
	 */
	public String getAttachPath(){
		return saveAttachPath;
	}
    
	/**
	 * �������ı��渽����ָ��Ŀ¼�
	 */
	private void saveFile(String fileName,InputStream in)throws Exception{
	
		String imageFormat = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
		//System.out.println("file::::::"+in);
		fileName = CreateFileName.createtFileName()+"."+imageFormat;
		String osName = System.getProperty("os.name");
		String storedir = getAttachPath();
		String separator = "";
		if(osName == null) osName="";
		if(osName.toLowerCase().indexOf("win") != -1) {
			separator = "\\";
			if(storedir == null || storedir.equals("")) storedir="D:\\mailFile" + "" + "" + "" + "" + "";
		}
		else {
			separator = "/";
			storedir = "/mailFile";
		}
 
		//fileName="test."+fileName.split("\\.")[1];
  
		File storefile = new File(storedir+separator+fileName);
		//for(int i=0;storefile.exists();i++){
		//storefile = new File(storedir+separator+fileName+i);
		//}
		BufferedOutputStream bos = null;
		BufferedInputStream  bis = null;
		try {
			bos = new BufferedOutputStream(new FileOutputStream(storefile));
			bis = new BufferedInputStream(in);
			int c;
			while((c=bis.read()) != -1){
				bos.write(c);
				bos.flush();
			}
		}catch(Exception exception) {
			exception.printStackTrace();
			throw new Exception("�ļ�����ʧ��!");
		}finally {
			bos.close();
			bis.close();
		}
	}

	public static Connection conMySql() {

		String url = "jdbc:mysql://10.4.2.254:3306/groupware";
		Connection con=null;
		try {
			Class.forName("com.microsoft.sql.sqlserver.SQLServerDriver");
			con = DriverManager.getConnection(url, "cti", "edgesoftcti");

			// Statement stmt = con.createStatement();
			// stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.getMessage();
		}
		return con;
	}
 
	/**
	 * PraseMimeMessage��ִ��
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection conn  = Connect.getconn();
			Statement statement = conn.createStatement();
			String sql;
			sql = "select * from email_info where id=1";

			ResultSet rs = statement.executeQuery(sql);

			if(rs.next()) {	
			  host = rs.getString("host");
			  username = rs.getString("username");
			  password = rs.getString("password");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		mt = new MessageThread(request.getSession().getServletContext().getRealPath(""));
		mt.setFlag(true);
		mt.start();
		
		//	sfnt = new ScanFileNameThread(request.getRealPath(""));
		//	sfnt.start();
		SetStartFunction.ChangeReading();
		response.sendRedirect("/FU_System/reading.jsp");
	}
	
	public  void getmessage(String server_path) throws IOException {
		
		try {
/*			String host = "pop3.gmail.com"; // ��pop.mail.yahoo.com.cn��
			String username = "ivanren1989@gmail.com"; // ��wwp_1124��
			String password = "********"; // ��........��
*/
			Properties props = null;
			
			if (username.indexOf("@gmail") >= 0) {
				Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
				final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
				
				props = System.getProperties();
				props.setProperty("mail.pop3.socketFactory.class", SSL_FACTORY);
				props.setProperty("mail.pop3.socketFactory.fallback", "false");
				props.setProperty("mail.pop3.port", "995");
				props.setProperty("mail.pop3.socketFactory.port", "995");
			}
			else {
				props = new Properties();
			}
			Session session = Session.getDefaultInstance(props, null); 
			Store store = session.getStore("pop3");
			store.connect(host, username, password);
			POP3Folder folder = (POP3Folder)store.getFolder("INBOX");
			folder.open(Folder.READ_WRITE); // foder �Ĵ�����ȷ���Է��������ʼ��Ķ�дȨ��
			FetchProfile profile = new FetchProfile(); 
			profile.add(UIDFolder.FetchProfileItem.UID); 
			profile.add(FetchProfile.Item.ENVELOPE);
			
			//Message message[] = folder.getMessages();
			
			//��ȡ�ʼ�����
			int messageCount = folder.getMessageCount();
				
			//��ȡδ�����ʼ���Ŀ
		    int unReadMessageCount = folder.getUnreadMessageCount();
			    
		    //��ȡδ�����ʼ�����
		    Message message[] = folder.getMessages(messageCount-unReadMessageCount+1, 
					messageCount);
		    folder.fetch(message, profile);

			PraseMimeMessage pmm = null;
			//��ȡUID��
			for (int i = 0; i < message.length; i++) {
				pmm = new PraseMimeMessage((MimeMessage) message[i]); 
				
				int flag =0;
				Connection conn  = Connect.getconn();	
				Statement statement = null;
		     	statement = conn.createStatement();
		     		  
		     	String   sql = "select * from mailservice where mailcode='"+folder.getUID(message[i])+"'";
		     	ResultSet rs =  statement.executeQuery(sql);
				if(rs.next()){
					flag = Integer.parseInt(rs.getString("id"));
				}
				//ȷ���ʼ���δ����
				if(flag==0){
					sql="insert into mailservice (mailcode) values ('"+folder.getUID(message[i])+"')";
					statement.execute(sql);
					EmailFrom = pmm.getFrom();

					pmm.setDateFormat("yy-MM-dd HH:mm");

					//System.out.println("Message "+i+" sentdate: "+pmm.getSentDate());
					//System.out.println("Message "+i+" Message-ID: "+pmm.getMessageId());

					//pmm.getMailContent((Part) message[i]);
				 
					//System.out.println("Message " + i + " bodycontent: \r\n" + pmm.getBodyText());

					//String sConfigPath = SystemConstants.getConfigPath();
					String a= EmailFrom.substring(EmailFrom.lastIndexOf("<")+1,EmailFrom.length());
					EmailFrom = a.substring(0,a.lastIndexOf(">"));	
					pmm.setAttachPath(server_path +"/User/temp/");
					pmm.saveAttachMent((Part) message[i]);

					// message[i].setFlag(Flags.Flag.DELETED, true); //���ճɹ�ɾ��
					//System.out.println(".........deleted mail.........");
					//message[i].setFlag(Flags.Flag.SEEN, true);
				}
			}
			// folder.setFlags(message, new Flags(Flags.Flag.SEEN), true);
			//System.out.println("......... mail reading ready to end.........");
			folder.close(true);
			//System.out.println("......... mail reading end.........");
			store.close();
		} catch (Exception e) {
			e.getMessage();
			System.out.println(e.getMessage());
		}
	}
}