package com.henry.po;

import java.util.List;

public class Cart {

	
	private Integer total;
	private List<Product> rows;
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<Product> getRows() {
		return rows;
	}
	public void setRows(List<Product> rows) {
		this.rows = rows;
	}
	
	
	
}
