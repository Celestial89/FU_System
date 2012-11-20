package com.threads;

import com.servlet.Convert;

public class ConvertThread extends Thread{
	
	private volatile boolean flag = true;
	private static String server_path1;
	
	public ConvertThread(String server_path){
		server_path1 = server_path;
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
				Convert.convert(server_path1);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		
			try {
				Thread.sleep(30000);
			}catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
