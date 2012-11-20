package com.threads;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import com.common.ClassifyAttach;
import com.servlet.PraseMimeMessage;

public class MessageThread extends Thread {

	private volatile boolean flag = true;
	private String server_path1;
	
	public MessageThread(String server_path){
		this.server_path1  = server_path;
	}
	
	public void setFlag(boolean flag) {
        this.flag = flag;
    }
	
	public synchronized void stopCurrentThread() {
        this.flag = false;
    }

	public void run() {
		while(flag) {
			try {
				PraseMimeMessage pmm = new PraseMimeMessage();
				pmm.getmessage(server_path1);
			} catch(IOException e) {
				e.printStackTrace();
			}
			
			ClassifyAttach cAttach = new ClassifyAttach(server_path1);
			ArrayList<String> fileName = cAttach.classify();
			
			for(String name : fileName) {
				File f = new File(server_path1 + "/User/temp/" + name);
				f.delete();
			}
			
			try {
				Thread.sleep(30000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
