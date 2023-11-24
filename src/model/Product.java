package model;


	
public class Product {
		private int product_id;
		private String name;
		private String category;
		private Double unitprice;
		private String image;
		
		public Product()
		{
			
		}

		public Product(int product_id, String name, String category, Double unitprice, String image) {
			
			this.product_id = product_id;
			this.name = name;
			this.category = category;
			this.unitprice = unitprice;
			this.image = image;
		}

		public int getProduct_id() {
			return product_id;
		}

		public void setProduct_id(int product_id) {
			this.product_id = product_id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public Double getUnitprice() {
			return unitprice;
		}

		public void setUnitprice(Double unitprice) {
			this.unitprice = unitprice;
		}

		public String getImage() {
			return image;
		}

		public void setImage(String image) {
			this.image = image;
		}

		@Override
		public String toString() {
			return "Product [product_id=" + product_id + ", name=" + name + ", category=" + category + ", unitprice="
					+ unitprice + ", image=" + image + "]";
		}
		
		
		
		
		
	    
		
}


