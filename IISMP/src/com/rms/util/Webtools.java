/**
 * 
 */
package com.rms.util;

import java.io.IOException;
import org.apache.commons.lang.StringEscapeUtils;


/**
 * @author dong
 *2017-4-26
 * 
 */

public class Webtools {
	

	public static  String Change(String str) throws IOException{
	
		String str1=StringEscapeUtils.escapeHtml(str);
		return str1;
		
		
	}


}
