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
    <style>/* ================= REVIEW DESIGN ================= */
/* ================= ENHANCED REVIEW FORM ================= */
/* ================= CONTACT SECTION FIX ================= */

.contact{
    padding:70px 6%;
    background:#fff;
}

.contact .row{
    display:flex;
    align-items:stretch;          /* 🔥 Equal height */
    gap:30px;
}

/* LEFT FORM & RIGHT IMAGE SAME SIZE */
.contact .row form,
.contact .row .image{
    flex:1;
    background:#fff;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

/* FORM STYLING */
.contact .row form{
    padding:35px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.contact .row form .box{
    width:100%;
    padding:14px;
    margin-bottom:15px;
    border-radius:8px;
    border:1px solid #ddd;
    font-size:15px;
}

.contact .row form textarea{
    resize:none;
    height:140px;
}

/* IMAGE FULL HEIGHT */
.contact .row .image{
    overflow:hidden;
}

.contact .row .image img{
    width:100%;
    height:100%;                  /* 🔥 IMPORTANT */
    object-fit:cover;             /* No stretch */
    border-radius:12px;
}

/* MOBILE RESPONSIVE */
@media(max-width:768px){
    .contact .row{
        flex-direction:column;
    }

    .contact .row .image img{
        height:300px;
    }
}

.review-form-section{
    padding:80px 6%;
    background:linear-gradient(135deg,#fff0f5,#ffffff);
}

.review-form{
    max-width:520px;
    margin:auto;
    background:#fff;
    padding:35px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.1);
    text-align:center;
}

/* ⭐ STAR RATING */
.star-rating{
    display:flex;
    justify-content:center;
    flex-direction:row-reverse;
    gap:8px;
    margin-bottom:25px;
}

.star-rating input{
    display:none;
}

.star-rating label{
    font-size:30px;
    color:#ddd;
    cursor:pointer;
    transition:0.3s;
}

.star-rating input:checked ~ label,
.star-rating label:hover,
.star-rating label:hover ~ label{
    color:#f7b731;
}

/* ✍️ FLOATING TEXTAREA */
.input-box{
    position:relative;
    margin-bottom:25px;
}

.input-box textarea{
    width:100%;
    padding:15px;
    border-radius:12px;
    border:1px solid #ccc;
    font-size:15px;
    outline:none;
    resize:none;
    height:120px;
}

.input-box label{
    position:absolute;
    left:15px;
    top:15px;
    color:#999;
    font-size:14px;
    pointer-events:none;
    transition:0.3s;
}

.input-box textarea:focus + label,
.input-box textarea:valid + label{
    top:-10px;
    left:12px;
    background:#fff;
    padding:0 6px;
    font-size:12px;
    color:#e84393;
}

/* 🚀 SUBMIT BUTTON */
.review-btn{
    padding:12px 40px;
    border:none;
    border-radius:30px;
    font-size:16px;
    color:white;
    background:linear-gradient(135deg,#e84393,#ff6fae);
    cursor:pointer;
    transition:0.3s;
}

.review-btn:hover{
    transform:translateY(-3px);
    box-shadow:0 8px 20px rgba(232,67,147,0.4);
}

/* 📝 NOTE */
.review-note{
    margin-top:15px;
    font-size:13px;
    color:#777;
}

.reviews-section{
    padding:70px 6%;
    background:#fff5f8;
}

.reviews-container{
    display:grid;
    grid-template-columns:repeat(auto-fit, minmax(280px, 1fr));
    gap:25px;
    margin-top:40px;
}

.review-card{
    background:#fff;
    padding:25px;
    border-radius:18px;
    box-shadow:0 8px 22px rgba(0,0,0,0.08);
    transition:0.3s;
}

.review-card:hover{
    transform:translateY(-6px);
}

.review-stars{
    color:#f7b731;
    font-size:15px;
    margin-bottom:10px;
}

.review-text{
    font-size:15px;
    line-height:1.6;
    color:#555;
    margin-bottom:18px;
}

.review-user{
    display:flex;
    align-items:center;
    gap:8px;
    font-size:14px;
    color:#888;
}

.review-user i{
    font-size:22px;
    color:#e84393;
}

/* ===== REVIEW FORM ===== */

.review-form-section{
    padding:70px 6%;
    background:#ffffff;
}

.review-form-section form{
    max-width:500px;
    margin:auto;
    background:#fff5f8;
    padding:30px;
    border-radius:18px;
    box-shadow:0 8px 22px rgba(0,0,0,0.08);
}
/* ================= FOOTER ENHANCEMENT ================= */
/* ================= FOOTER COLOR TUNING ================= */
/* ================= FOOTER – FINAL PREMIUM GRADIENT ================= */

.footer{
    background: linear-gradient(135deg, #1a0f14, #0f0f0f, #1a1a1a);
    color:#b5b5b5;
    padding:60px 6% 30px;
    border-top:1px solid rgba(255,126,179,0.25);
}

/* Grid */
.footer .box-container{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:30px;
}

/* Headings */
.footer .box h3{
    color:#ff7eb3;
    font-size:20px;
    margin-bottom:15px;
    font-weight:600;
}

/* Logo */
.footer-logo{
    font-size:26px;
    color:#ff7eb3;
    margin-bottom:10px;
    text-shadow:0 0 12px rgba(255,126,179,0.3);
}

.footer-logo span{
    color:#ffffff;
}

/* Description */
.footer-desc{
    color:#b5b5b5;
    font-size:14px;
    line-height:1.7;
}

/* Links */
.footer .box a{
    display:block;
    color:#cfcfcf;
    font-size:14px;
    margin-bottom:8px;
    text-decoration:none;
    transition:0.3s;
}

.footer .box a:hover{
    color:#ff7eb3;
    padding-left:5px;
}

/* Social Icons */
.social-icons{
    margin-top:15px;
}

.social-icons a{
    display:inline-block;
    width:40px;
    height:40px;
    line-height:40px;
    margin-right:10px;
    border-radius:50%;
    background:#1c1c1c;
    color:#ff7eb3;
    text-align:center;
    transition:0.3s;
}

.social-icons a:hover{
    background:#ff7eb3;
    color:#0f0f0f;
    transform:translateY(-4px);
}

/* Credit */
.footer .credit{
    text-align:center;
    margin-top:30px;
    padding-top:20px;
    border-top:1px solid #333;
    font-size:14px;
    color:#9a9a9a;
}

</style>
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
            <a href="#products" class="btn">Shop now</a>
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

           <a href="addwishlist.jsp?
pid=<%=rs.getInt("product_id")%>
&name=<%=rs.getString("name")%>
&price=<%=rs.getInt("price")%>
&image=<%=rs.getString("image")%>"
class="fas fa-heart"
onclick="return confirm('Add to wishlist?')">
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
<!-- ================= REVIEW SECTION ================= -->
<%@page import="java.sql.*"%>

<section class="reviews-section" id="review">
    <h1 class="heading">Customer <span>Reviews</span></h1>

    <div class="reviews-container">

    <%
    Connection conn2 = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
    );

    PreparedStatement ps2 = conn2.prepareStatement(
        "SELECT * FROM reviews WHERE status='approved' ORDER BY created_at DESC"
    );
    ResultSet rs2 = ps2.executeQuery();

    while(rs2.next()){
    %>

        <div class="review-card">
            <div class="review-stars">
                <% for(int i=1;i<=rs2.getInt("rating");i++){ %>
                    <i class="fas fa-star"></i>
                <% } %>
            </div>

            <p class="review-text">
                <%=rs2.getString("comment")%>
            </p>

            <div class="review-user">
                <i class="fas fa-user-circle"></i>
                <span>
                    <%=rs2.getString("user_email").replaceAll("@.*", "@***")%>
                </span>
            </div>
        </div>

    <%
    }
    conn2.close();
    %>

    </div>
</section>

<%
String user = (String)session.getAttribute("user");
%>

<% if(user != null){ %>
<section class="review-form-section">
    <h1 class="heading">Write A <span>Review</span></h1>

    <form action="savereview.jsp" method="post" class="review-form">

        <!-- STAR RATING -->
        <div class="star-rating">
            <input type="radio" name="rating" id="star5" value="5" required>
            <label for="star5">★</label>

            <input type="radio" name="rating" id="star4" value="4">
            <label for="star4">★</label>

            <input type="radio" name="rating" id="star3" value="3">
            <label for="star3">★</label>

            <input type="radio" name="rating" id="star2" value="2">
            <label for="star2">★</label>

            <input type="radio" name="rating" id="star1" value="1">
            <label for="star1">★</label>
        </div>

        <!-- TEXTAREA -->
        <div class="input-box">
            <textarea name="comment" required></textarea>
            <label>Your honest review</label>
        </div>

        <button type="submit" class="review-btn">
            Submit Review
        </button>

        <p class="review-note">
            Your review will be visible after admin approval 🌸
        </p>
    </form>
</section>

<% } else { %>
<p style="text-align:center;margin:40px;">
    Login to write a review
</p>
<% } %>
<!-- ================= REVIEW SECTION END ================= -->


    <!-- review section ends -->

    <!-- contact section starts -->
    <section class="contact" id="contact">
        <h1 class="heading"><span>Contact </span>Us</h1>
        <div class="row">
            <form action="saveContact.jsp" method="post">
    <input type="text" name="name" placeholder="name" class="box" required>
    <input type="email" name="email" placeholder="email" class="box" required>
    <input type="number" name="phone" placeholder="number" class="box">
    <textarea name="message" class="box" placeholder="message" required></textarea>
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
            <div class="box footer-brand">
    <h3 class="footer-logo">🌸 Blossom<span>&</span>Bloom</h3>
    <p class="footer-desc">
        Fresh flowers, handcrafted bouquets, and emotions in bloom.
        Making every moment special with nature’s beauty.
    </p>
</div>
<div class="social-icons">
    <a href="#"><i class="fab fa-facebook-f"></i></a>
    <a href="#"><i class="fab fa-instagram"></i></a>
    <a href="#"><i class="fab fa-whatsapp"></i></a>
    <a href="#"><i class="fab fa-twitter"></i></a>
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
