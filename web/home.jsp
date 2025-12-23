<%-- 
    Document   : home.jsp
    Created on : 22-Dec-2025, 6:55:51 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <!-- home section starts -->
    <section class="home" id="home">
        <div class="content">
            <h3>Fresh flowers</h3>
            <span>Natural & beauty flowers</span>
            <p>Roses are highly popular ornamental shrubs grown globally for their beautiful flowers, diverse colors, and enchanting fragrance. Cultivated for thousands of years, they come in various forms, including traditional shrubs, climbers, and miniatures, with distinctive prickly stems and toothed, compound leaves. Modern roses offer improved disease resistance, making them easier for even novice gardeners to grow, providing options for ornamental display, commercial perfumery, and even edible uses.  
            Plant Characteristics
            Form: Roses are shrubs that can be erect, climbing, or trailing. 
            Stems: Stems are typically armed with prickles (thorns) of various shapes and sizes. 
            Leaves: Leaves are alternate and pinnately compound, meaning they are composed of multiple leaflets arranged along a central stem. 
            Flowers: Blooms vary in size and shape, from single petals to densely packed layers. They come in a vast array of colors, including red, pink, yellow, white, and orange, though true blue flowers are rare and often achieved with dye. 
            Fruit: Some roses produce berry-like fruits called rose hips. 
            Growing Roses
            </p>
            <a href="login.html" class="btn">Shop now</a>
        </div>
    </section>
    <!-- home section ends -->

    <!-- about section starts -->
    <section class="about" id="about">
        <h1 class="heading"><span>About</span> Us</h1>

        <div class="row">
            <div class="video-container">
                <video src="images/Dubai_s Most Luxurious Flower Delivery - Perfect for Any Occasion(1080P_60FPS).mp4" loop autoplay muted>
                </video>
                <h3>best flower sellers</h3>
            </div>
            <div class="content">
                <h3>why use us?</h3>
                <p class="contentpara">Welcome to Blossom & Bloom, a cozy and colorful flower shop where every petal tells a story. Our shop offers a wide variety of fresh flowers, handcrafted bouquets, and custom floral arrangements for all occasions — from weddings and birthdays to simple everyday smiles.
                We believe flowers are more than just decorations — they’re emotions in bloom. That’s why we focus on quality, creativity, and customer care. Whether you're looking for a romantic rose bouquet, a cheerful sunflower bunch, or a traditional garland, we’ve got something special for everyone.
                Our shop also supports local farmers and promotes eco-friendly packaging, making every purchase a step toward a greener tomorrow.
                </p>
                <a href="#" class="btn">learn more</a>
            </div>
        </div>
    </section>
    <!-- about section ends -->

    <!-- icons section starts -->
    <section class="icons-container">
        <div class="icons">
            <img src="images/food.jpg" alt="">
            <div class="info">
                <h3>free delivery</h3>
                <span>on all orders</span>
            </div>
        </div>
        <div class="icons">
            <img src="images/cartoon-box-package-return-icon-in-comic-style-delivery-box-with-arrow-concept-illustration-pictogram-cargo-shipping-business-splash-effect-concept-vector.jpg" alt="">
            <div class="info">
                <h3>10 days return</h3>
                <span>moneyback guarantee</span>
            </div>
        </div>
        <div class="icons">
            <img src="images/offer.jpg" alt="">
            <div class="info">
                <h3>offers & gifts</h3>
                <span>on all orders</span>
            </div>
        </div>
        <div class="icons">
            <img src="images/secu.jpg" alt="">
            <div class="info">
                <h3>secure payments</h3>
                <span>protected by paypal</span>
            </div>
        </div>
    </section>
    <!-- icons section ends -->
    <--<!-- product -->

<%@page import="java.sql.*"%>

<section class="products" id="products">
<h1 class="heading">latest <span>products</span></h1>

<div class="box-container">

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts",
    "root","Vicky345@"
);

PreparedStatement ps =
    conn.prepareStatement("SELECT * FROM productlist");
ResultSet rs = ps.executeQuery();

while(rs.next()){
    int stock = rs.getInt("stock");
    int price = rs.getInt("price");
    int oldPrice = rs.getInt("old_price");
%>

<div class="box">

    <% if(oldPrice > price){ %>
        <span class="discount">
            <%= ((oldPrice - price) * 100) / oldPrice %>% OFF
        </span>
    <% } %>

    <div class="image">
        <img src="<%=request.getContextPath()%>/images/<%=rs.getString("image")%>" alt="">

        <div class="icons">

            <a href="#" class="fas fa-heart"
               onclick="addToWishlist(
               '<%=rs.getString("name")%>',
               <%=price%>,
               'images/<%=rs.getString("image")%>')">
            </a>

            <% if(stock > 0){ %>
            <a href="addtocart.jsp?pid=<%=rs.getInt("product_id")%>&name=<%=rs.getString("name")%>&price=<%=rs.getInt("price")%>&image=<%=rs.getString("image")%>"
   class="cart-btn">
   Add to Cart
</a>


            <% } else { %>
                <span style="color:red;font-weight:bold;">Out of stock</span>
            <% } %>

            <a href="#" class="fas fa-share"></a>
        </div>
    </div>

    <div class="content">
        <h3><%=rs.getString("name")%></h3>
        <div class="price">
            ₹<%=price%>
            <% if(oldPrice > price){ %>
                <span>₹<%=oldPrice%></span>
            <% } %>
        </div>
    </div>

</div>

<%
}
conn.close();
%>

</div>
</section>


<!-- product section ends -->


    <!-- product section ends -->

    <!-- review section starts -->
    <section class="review" id="review">
        <h1 class="heading">Customer's <span>Review</span></h1>
        <div class="box-container">
            <div class="box">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <p>Roses are highly popular ornamental shrubs grown globally for their beautiful flowers, diverse colors, and enchanting fragrance...</p>
                <div class="user">
                    <img src="images/pathy.jpg" alt="">
                    <div class="user-info">
                        <h3>Joseph Vijay</h3>
                        <span>happy customer</span>
                    </div>
                </div>
                <span class="fas fa-quote-right"></span>
            </div>
            <div class="box">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <p>Roses are highly popular ornamental shrubs grown globally for their beautiful flowers...</p>
                <div class="user">
                    <img src="images/ajith_kumar.jpg" alt="">
                    <div class="user-info">
                        <h3>Ajith Kumar</h3>
                        <span>happy customer</span>
                    </div>
                </div>
                <span class="fas fa-quote-right"></span>
            </div>
            <div class="box">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <p>Roses are highly popular ornamental shrubs grown globally for their beautiful flowers...</p>
                <div class="user">
                    <img src="images/surya.jpg" alt="">
                    <div class="user-info">
                        <h3>Surya</h3>
                        <span>happy customer</span>
                    </div>
                </div>
                <span class="fas fa-quote-right"></span>
            </div>
        </div>
    </section>
    <!-- review section ends -->

    <!-- contact section starts -->
    <section class="contact" id="contact">
        <h1 class="heading"><span>Contact </span>Us</h1>
        <div class="row">
            <form action="">
                <input type="text" placeholder="name" class="box">
                <input type="email" placeholder="email" class="box">
                <input type="number" placeholder="number" class="box">
                <textarea name="" id="" class="box" placeholder="message" cols="30" rows="10"></textarea>
                <input type="submit" value="send message" class="btn">
            </form>
            <div class="image">
                <img src="images/pexels-negativespace-33999.jpg" alt="">
            </div>
        </div>
    </section>
    <!-- contact section ends -->

    <!-- footer section starts -->
    <section class="footer">
        <div class="box-container">
            <div class="box">
                <h3>quick links</h3>
                <a href="#">home</a>
                <a href="#">about</a>
                <a href="#">product</a>
                <a href="#">review</a>
                <a href="#">contact</a>
            </div>
            <div class="box">
                <h3>Extra links</h3>
                <a href="#">my account</a>
                <a href="#">my order</a>
                <a href="#">my favorite</a>
            </div>
            <div class="box">
                <h3>Locations</h3>
                <a href="https://maps.app.goo.gl/XXP4xxvRRsf2T2S99">Velachery</a>
                <a href="https://maps.app.goo.gl/BRpWpbKqUPeCK9y3A">Taramani</a>
                <a href="https://maps.app.goo.gl/tCmDtspXBToQ5rqCA">Anna nagar</a>
                <a href="https://maps.app.goo.gl/grtwc4LhaJruwgoPA">Merina Beach</a>
            </div>
            <div class="box">
                <h3>Contact info</h3>
                <a href="#">+91 9342717829</a>
                <a href="mailto:vignesh2k19bca345@gmail.com?subject=Hello&body=I have one doubt please help me">Poostories@gmail.com</a>
                <a href="#">Taramani,chennai -600098</a>
                <img src="images/cs.jpg" alt="">
            </div>
        </div>
        <div class="credit">created by <span>Mr. Vignesh </span> | all rights reserved</div>
    </section>
    <!-- footer section ends -->
     <script>

    // Add to Cart
    function addToCart(name, price, image) {
      let cart = JSON.parse(localStorage.getItem("cart")) || [];
      cart.push({ name, price, image });
      localStorage.setItem("cart", JSON.stringify(cart));
      alert(name + " added to cart 🛒");
    }

    // Add to Wishlist
    function addToWishlist(name, price, image) {
      let wishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
      if (wishlist.some(item => item.name === name)) {
        alert(name + " is already in your wishlist 💗");
        return;
      }
      wishlist.push({ name, price, image });
      localStorage.setItem("wishlist", JSON.stringify(wishlist));
      alert(name + " added to wishlist 💖");
    }
  </script>
</body>
</html>
