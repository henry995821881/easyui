package com.henry.servlet;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONStreamAware;
import com.alibaba.fastjson.asm.Type;
import com.henry.po.Cart;
import com.henry.po.Product;
import com.sun.xml.internal.bind.v2.model.core.ID;

/**
 * Servlet implementation class ShopCart
 */
public class ShopCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShopCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		ServletInputStream is = request.getInputStream();
		int len = -1;
		byte[] buff = new byte[1024];
		StringBuffer sb = new StringBuffer();
		while ((len = is.read(buff)) != -1) {

			sb.append(new String(buff, 0, len));

		}

		is.close();
		String data = sb.toString();

	
		Cart cart =  JSON.parseObject(data, Cart.class);
		
		System.out.println(cart.getTotal()+"-->"+cart.getRows());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
