package com.itwill.book.dao.test;

import com.itwill.book.dao.CartDao;
import com.itwill.book.dto.Book;
import com.itwill.book.dto.Cart;

public class cartDaoTest {

		

		public static void main(String[] args) throws Exception{
			
			CartDao cartDao = new CartDao();
			Cart newCart = new Cart(0,1,"hunjeong", new Book(1,"자기개발서","마시멜로이야기",12000,"달콤한 유혹에서 이겨낼 때 비로소 얻게 된다",	"1_marshmallow","호아킴 데 포사다",	"한국경제신문사"));
//			System.out.println("--------cart add(insert1)------");
//			System.out.println(cartDao.cartInsert(newCart));
//			newCart = new Cart(0,1,"hunjeong", new Book(2,"test","test",124000,"test",	"test","ddd",	"test"));
//			System.out.println("--------cart add(insert2)------");
//			System.out.println(cartDao.cartInsert(newCart));
//			//c_no 고정으로 바꿔야함
//			
//			newCart = new Cart(0,3,"hunjeong", new Book(1,"자기개발서","마시멜로이야기",12000,"달콤한 유혹에서 이겨낼 때 비로소 얻게 된다",	"1_marshmallow","호아킴 데 포사다",	"한국경제신문사"));
//			System.out.println("--------cart update------");
//			System.out.println(cartDao.cartInsert(newCart));
//			
//			System.out.println("--------cart deleteByNo------");
//			System.out.println(cartDao.cartDeleteByNo(1));
//			
//			System.out.println("--------cart deleteAll------");
//			System.out.println(cartDao.cartDeleteAll("hunjeong"));
//			
//			System.out.println("--------cart selectById------");
//			System.out.println(cartDao.cartList("hunjeong"));
			
			System.out.println("--------cart Book Count------");
			System.out.println(cartDao.cartBookCount(newCart));
			
			
		}
	}

