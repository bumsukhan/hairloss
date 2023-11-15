package com.hair.loss.commons;

import java.util.UUID;

public class CommonUtils
{
	public static String getRandomString()
	{
		System.out.println("test");

		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
