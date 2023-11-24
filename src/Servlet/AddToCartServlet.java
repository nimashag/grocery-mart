package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    response.setContentType("text/html; charset=utf-8");
		    
			String action = request.getParameter("action");
			String id = request.getParameter("id");
			
		
			if(action.equals("addtocart")) {
				try (PrintWriter out = response.getWriter()) {
					ArrayList<Cart> cartList = new ArrayList<>();
					int product_id = Integer.parseInt(request.getParameter("id"));
					Cart cm = new Cart();
					cm.setProduct_id(product_id);
					cm.setQty(1);

					HttpSession session = request.getSession();
					ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

					if (cart_list == null) {
						cartList.add(cm);
						session.setAttribute("cart-list", cartList);
						response.sendRedirect("products.jsp");
					}

					else {
						cartList = cart_list;
						boolean exist = false;

						for (Cart c : cart_list) {
							if (c.getProduct_id() == product_id) {
								exist = true;
								/*
								 * out.println(
								 * "<h3 style='color:crimson; text-align:center'>Item already exist in cart.<a href='cart.jsp'>Go to Cart Page</a>"
								 * );
								 */
							    out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'style='text-decoration: none; color: #007BFF;'>GO to Cart Page</a></h3>");
							    
							    
							
							}
							
							
						}

						if (!exist) {
							cartList.add(cm);
							out.println("product added. <a href='cart.jsp'style='text-decoration: none; color: #007BFF;'>GO to Cart Page</a>");
							
						}

					}

				}
			}
			
		

	}
}
