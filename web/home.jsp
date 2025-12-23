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
    <header>
        <input type="checkbox" name="" id="toggler">
        <label for="toggler" class="fas fa-bars"></label>
        <a href="#" class="logo">flower<span>.</span></a>

        <nav class="navbar">
            <a href="#home">home</a>
            <a href="#about">about</a>
            <a href="#products">products</a>
            <a href="#review">review</a>
            <a href="#contact">contact</a>
        </nav>

        <div class="icons">
            <a href="wishlist.html" class="fas fa-heart" ></a>
            <a href="cart.html" class="fas fa-shopping-cart"></a>
            <a href="#" class="fas fa-user"></a>
        </div>
    </header>

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

    <!-- product section starts -->
    <section class="products" id="products">
    <h1 class="heading">latest <span>products</span></h1>
     <div class="box-container">
       <div class="box">
        <span class="discount">-10%</span>
          <div class="image">
            <img src="images/img8.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('flower pot', 580, 'images/img8.jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>flower pot</h3>
            <div class="price"> ₹580 <span>₹690</span></div>
          </div>
       </div>
      <div class="box">
        <span class="discount">-15%</span>
          <div class="image">
            <img src="images/img4.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('yellow red rose', 680, 'images/img4.jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>yellow red rose</h3>
            <div class="price"> ₹680 <span>₹790</span></div>
          </div>
       </div>
       <div class="box">
        <span class="discount">-40 %</span>
          <div class="image">
            <img src="images/img7.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('Blue Rose', 400, 'images/img7.jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>blue rose</h3>
            <div class="price"> ₹400 <span>₹897</span></div>
          </div>
       </div>
       <div class="box">
        <span class="discount">-29%</span>
          <div class="image">
            <img src="images/img5.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('petels pink rose', 360, 'images/img5.jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>petels pink rose</h3>
            <div class="price"> ₹360 <span>₹580</span></div>
          </div>
       </div>

       <div class="box">
        <span class="discount">-29%</span>
          <div class="image">
            <img src="images/img3.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('jasmine water rose', 580, 'images/img3.jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>jasmine water rose</h3>
            <div class="price"> ₹580 <span>₹880</span></div>
          </div>
       </div>

       <div class="box">
        <span class="discount">-29%</span>
          <div class="image">
            <img src="images/img9.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('Blue petels Rose', 380, 'images/img9.jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>blue petels rose</h3>
            <div class="price"> ₹380 <span>₹600</span></div>
          </div>
       </div>
        <div class="box">
        <span class="discount">-29%</span>
          <div class="image">
            <img src="images/img6 (1).jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('purple mixed rose', 480, 'images/img6 (1).jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>purple mixed rose</h3>
            <div class="price"> ₹480 <span>₹500</span></div>
          </div>
       </div>
         <div class="box">
        <span class="discount">-29%</span>
          <div class="image">
            <img src="images/img9.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('Blue Rose', 580, 'images/img9.jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>blue rose</h3>
            <div class="price"> ₹580 <span>₹880</span></div>
          </div>
       </div>
       
       
        <div class="box">
        <span class="discount">-29%</span>
          <div class="image">
            <img src="images/img4.jpg" alt="">
            <div class="icons">
                <a href="#" class="fas fa-heart" onclick="addToWishlist('Blue Rose',580, 'images/img4.jpg')"></a>
                <a href="#" class="cart-btn">add to cart</a>
                <a href="#" class="fas fa-share"></a>
            </div>
          </div>
          <div class="content">
            <h3>blue rose</h3>
            <div class="price"> ₹580 <span>₹789</span></div>
          </div>
       </div>

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
