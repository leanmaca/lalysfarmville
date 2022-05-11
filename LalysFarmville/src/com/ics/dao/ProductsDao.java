package com.ics.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ics.bean.ProductsBean;


public class ProductsDao {
	public List<ProductsBean> selectProducts() throws ClassNotFoundException {
		List<ProductsBean> products = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from products")) {

			ResultSet rs = preparedStatement.executeQuery("select * from products");
			while (rs.next()) {
				ProductsBean productsBean = new ProductsBean();
				 productsBean.setProductId(rs.getInt("productid"));
				 productsBean.setProductName(rs.getString("productname"));
				 productsBean.setProductDesc(rs.getString("productdesc"));
				 productsBean.setImage(rs.getString("image"));
				 products.add(productsBean);
			}
			//System.out.println();
		} catch (Exception p) {
			System.out.println(p);
		}

		return products;
	}
	public void addProduct(String productName, String productDesc, String imageFileName) {
	    
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root" , "2001may19");
    		Statement stat = conn.createStatement();
    		
    		
    		stat.execute("INSERT INTO products(productname, productdesc, image) VALUES('"+ productName +"', '"+ productDesc +"', '"+ imageFileName +"')");
    		System.out.println("Added staff successfully");
    	}
    	catch(Exception e) {
    		
    	}
    		
    }
	
	public void updateProduct(String productId, String productName, String productDesc) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
		
			stat.execute("UPDATE products set productname='"+ productName +"', productdesc='"+ productDesc +"' WHERE productid="+ productId +"");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
