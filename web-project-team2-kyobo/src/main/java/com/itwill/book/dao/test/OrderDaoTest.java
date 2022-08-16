package com.itwill.book.dao.test;

import java.util.ArrayList;
import java.util.List;

import com.itwill.book.dao.BookDao;
import com.itwill.book.dao.CartDao;
import com.itwill.book.dao.OrderDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;
import com.itwill.book.dto.OrderDetail;
import com.itwill.book.dto.Orders;

public class OrderDaoTest {

	public static void main(String[] args) throws Exception{
		OrderDao orderDao = new OrderDao();
		CartDao cartDao = new CartDao();
		BookDao bookDao = new BookDao();
		
		int b_no = 1;
		int b_qty = 1;
		//상품에서 주문
		List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		Book book = bookDao.selectByNo(1);
		orderDetailList.add(new OrderDetail(0, b_qty, 0, book));
		
		Orders creatOrder =
				new Orders(0,
							null,
							book.getB_price()*b_qty,
							"seongmin",
							orderDetailList);
		orderDao.creat(creatOrder);			
		
		//장바구니 전체 주문
		List<Cart> cartList = cartDao.cartList("seongmin");
		orderDetailList = new ArrayList<OrderDetail>();
		
		int order_price = 0;
		for (Cart cart : cartList) {
			orderDetailList.add(new OrderDetail(0, cart.getC_qty(), 0, cart.getBook()));
			order_price = cart.getC_qty()*cart.getBook().getB_price();
		}
		creatOrder =
				new Orders(0,
							null,
							order_price,
							"seongmin",
							orderDetailList);
		orderDao.creat(creatOrder);
		
		cartDao.cartDeleteAll("seongmin");
	}
		
		//List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		//OrderDao orderDao = new OrderDao();
		
	

}
