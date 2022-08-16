package com.itwill.guest.test;

import com.itwill.guest.DataSource;

public class DauaSourceTestMain {

	public static void main(String[] args) throws Exception{
		DataSource dataSource = new DataSource();
		System.out.println(dataSource.getConnection());

	}

}
