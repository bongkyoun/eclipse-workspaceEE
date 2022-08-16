package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// #1. HttpServlet을 상속받는다.
public class HelloServlet extends HttpServlet {
	// #2. service(doGet, doPost)메쏘드를 재정의한다.
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// #2-1 클라이언트에 전송 할 데이터 타입 설정
		response.setContentType("text/html;charset=UTF-8");
		// #2-2 클라이언트에 데이터를 출력(전송)하기 위한 출력스트림 생성	
		PrintWriter out = response.getWriter();
		// #2-3 클라이언트에 데이터(html) 전송
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>Insert title here</title>");
		out.println("</head>");
		out.println("<body>");
		int no = (int) (Math.random()*10);
		for(int i=0; i<10; i++) {			
			out.println("<h3>Hello html[dynamic resource "+(i+1)+"]</h3><hr>");
		}
		out.println("</body>");
		out.println("</html>");
		
	}

}
