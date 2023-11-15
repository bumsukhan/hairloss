package com.hair.loss.commons;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SecurityUtil {

	private static final Logger logger = LoggerFactory.getLogger(SecurityUtil.class);
	
	public static String getSalt() {
		Random random = new Random();
		byte[] salt = new byte[10];
		
		random.nextBytes(salt);
		
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < salt.length; i++) {
			sb.append(String.format("%02x", salt[i]));
		}
		
		return sb.toString();
	}
	
	public static String encrytSHA256(String str) {

		String sha = "";

		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i< byteData.length; i++) {
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			sha = sb.toString();	
		} catch(NoSuchAlgorithmException e) {
			logger.debug("Encrypt Error - NoSuchAlgorithmException");
			sha = null;
		}
		return sha;
	}
	
	
	public static String encrytSHA256(String str, String salt) {
		String sha = "";

		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i< byteData.length; i++) {
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			System.out.println("sb.toString 찍자. " + sb.toString());
			sha = sb.toString().concat(salt);	
		} catch(NoSuchAlgorithmException e) {
			logger.debug("Encrypt Error - NoSuchAlgorithmException");
			sha = null;
		}
		return sha;
	}
	
}
