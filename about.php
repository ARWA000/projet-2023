<?php

include 'actions/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>about</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'actions/user_header.php'; ?>

<section class="about">

   <div class="row">

      <div class="image">
         <img src="images/logo1.jpg" alt="">
      </div>

      <div class="content">
         <h3>why choose us?</h3>
         <p>We offer you:<br>
           largest range of products – more than 25000 kinds of jewellery<br>
           many years of experience<br>
           lowest possible prices<br>
           carefully selected quality foreign jewellery<br>
           fast delivery<br>
           problem-free handling of claims<br>
           secure shopping</p>
         <a href="contact.php" class="btn">contact us</a>
      </div>

   </div>

</section>


<?php include 'actions/footer.php'; ?>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".reviews-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      0: {
        slidesPerView:1,
      },
      768: {
        slidesPerView: 2,
      },
      991: {
        slidesPerView: 3,
      },
   },
});

</script>

</body>
</html>