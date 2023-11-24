package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import model.*;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDao(Connection con) {
		
		this.con = con;
	}
	
	public List<Product> getAllProducts()
	{
		List<Product> products = new ArrayList<Product>();
		
		try 
		{
			query = "select * from grocery_db.products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next())
			{
				//product object is created,its properties are using the data from the result set,
				//added to the product list.
				Product row = new Product();
				row.setProduct_id(rs.getInt("product_id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setUnitprice(rs.getDouble("unitprice"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
				
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return products;
	}
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList)
	{
		List<Cart> products = new ArrayList<Cart>();
		
		try 
		{
			if(cartList.size() > 0)
			{
				for(Cart item:cartList)
				{
					query = "select * from grocery_db.products where product_id=? ";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getProduct_id());
					rs = pst.executeQuery();
					while(rs.next())
					{
						Cart row = new Cart();
						row.setProduct_id(rs.getInt("product_id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setUnitprice(rs.getDouble("unitprice")*item.getQty());
						row.setQty(item.getQty());
						products.add(row);
					}
				}
			}
			
		}
		
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			//e.printStackTrace();
		}
		
		return products;
	}
	
	public double getToatalCartPrice(ArrayList<Cart> cartList)
	{
		double sum =0 ;
		
		try 
		{
			if(cartList.size()>0)
			{
				for(Cart item:cartList)
				{
					query = "select unitprice from grocery_db.products where product_id=? ";
					pst = this.con.prepareStatement(query);
					pst.setInt(1,item.getProduct_id());
					rs = pst.executeQuery();
					
					while(rs.next())
					{
						sum += rs.getDouble("unitprice")* item.getQty();
					}
				}
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return sum;
	}
}