package com.common;

import java.text.SimpleDateFormat;

public class CreateFileName {

	public  static  synchronized   String   createtFileName()   {
		
		java.util.Date dt = new java.util.Date(System.currentTimeMillis());
		SimpleDateFormat fmt = new   SimpleDateFormat( "yyyyMMddHHmmssSSS");
		String fileName = fmt.format(dt);

		return fileName;
	}
	
}
