package com.henry.database;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.henry.po.User;

public class Db {

	private static List<User> list = new ArrayList<>();

	static {

		for (int i = 10000; i < 10030; i++) {

			list.add(new User(i, "henry" + 1, "yang" + i, "1235" + i, i+"123@qq.com" ));
		}
	}

	public static List<User> getUsers() {

		return list;

	}
	
	
	public static boolean updateUsr(User user){
		
		
		int id = user.getId().intValue();
		
		Iterator<User> it = list.iterator();

		while (it.hasNext()) {
			
			User u = it.next();
			if(u.getId().intValue() ==id){
				
				u.setEmail(user.getEmail());
				u.setFirstName(user.getFirstName());
				u.setLastName(user.getLastName());
				u.setPhone(user.getPhone());
				return true;
			}
		}
		
		return false;
		
	}

	public static boolean addUser(User user) {

		boolean flag = true;
		for (User u : list) {

			if (u.getId().intValue() == user.getId().intValue()) {

				flag = false;
			}

		}

		if (flag) {

			list.add(user);

		}

		return flag;

	}

	public static void deleteUserById(int id) {

		Iterator<User> it = list.iterator();

		while (it.hasNext()) {
			User u = it.next();
			if (u.getId().intValue() == id) {

				it.remove();

				break;
			}

		}
	}

}
