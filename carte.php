<?php

include 'actions/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:user_login.php');
};

if(isset($_POST['delete'])){
   $carte_id = $_POST['carte_id'];
   $delete_carte_item = $conn->prepare("DELETE FROM `carte` WHERE id = ?");
   $delete_carte_item->execute([$carte_id]);
}

if(isset($_GET['delete_all'])){
   $delete_carte_item = $conn->prepare("DELETE FROM `carte` WHERE user_id = ?");
   $delete_carte_item->execute([$user_id]);
   header('location:carte.php');
}

if(isset($_POST['update_qty'])){
   $carte_id = $_POST['carte_id'];
   $qty = $_POST['qty'];
   $qty = filter_var($qty, FILTER_SANITIZE_STRING);
   $update_qty = $conn->prepare("UPDATE `carte` SET qty = ? WHERE id = ?");
   $update_qty->execute([$qty, $carte_id]);
   $message[] = 'carte qty updated';
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>shopping carte</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'actions/user_header.php'; ?>

<section class="products shopping-carte">

   <h3 class="heading">shopping carte</h3>

   <div class="box-container">

   <?php
      $grand_total = 0;
      $select_carte = $conn->prepare("SELECT * FROM `carte` WHERE user_id = ?");
      $select_carte->execute([$user_id]);
      if($select_carte->rowCount() > 0){
         while($fetch_carte = $select_carte->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" method="post" class="box">
      <input type="hidden" name="carte_id" value="<?= $fetch_carte['id']; ?>">
      <a href="quick_view.php?product_id=<?= $fetch_carte['product_id']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_carte['image']; ?>" alt="">
      <div class="name"><?= $fetch_carte['name']; ?></div>
      <div class="flex">
         <div class="price">$<?= $fetch_carte['price']; ?>/-</div>
         <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="<?= $fetch_carte['qty']; ?>">
         <button type="submit" class="fas fa-edit" name="update_qty"></button>
      </div>
      <div class="sub-total"> sub total : <span>$<?= $sub_total = ($fetch_carte['price'] * $fetch_carte['qty']); ?>/-</span> </div>
      <input type="submit" value="delete item" onclick="return confirm('delete this from carte?');" class="delete-btn" name="delete">
   </form>
   <?php
   $grand_total += $sub_total;
      }
   }else{
      echo '<p class="empty">your carte is empty</p>';
   }
   ?>
   </div>

   <div class="carte-total">
      <p>grand total : <span>$<?= $grand_total; ?>/-</span></p>
      <a href="shop.php" class="option-btn">continue shopping</a>
      <a href="carte.php?delete_all" class="delete-btn <?= ($grand_total > 1)?'':'disabled'; ?>" onclick="return confirm('delete all from carte?');">delete all item</a>
      <a href="checkout.php" class="btn <?= ($grand_total > 1)?'':'disabled'; ?>">proceed to checkout</a>
   </div>

</section>













<?php include 'actions/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>