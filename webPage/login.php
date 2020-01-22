<?php

    require_once('../connection/connection.php');

		session_start();

        $_SESSION['error_message']="";
        $user=null;
        $pwd=null;
    

    if(isset($_POST['submit'])){
        
        $user=$_POST['txt'];
        $pwd=$_POST['password'];
        
        if(empty($pwd) && empty($user))
        {
            $_SESSION['error_message']="Please enter both fields";
        }
           else if(empty($user))
        {
            $_SESSION['error_message']="Please enter user name";
        }
        else if(empty($pwd))
        {
            $_SESSION['error_message']="Please enter password";
        }
     
        else
        {
            
        $hpwd = md5($pwd);
            $sql = "SELECT * FROM customer,user where username=id and username='{$user}' limit 1";
            $result = mysqli_query($conn, $sql);

            if (mysqli_num_rows($result) > 0) {
                
                $sql = "SELECT * FROM customer,user where username=id and username='{$user}' and  password='{$hpwd}' limit 1";
                $result = mysqli_query($conn, $sql);

                if (mysqli_num_rows($result) > 0) {
                    $row = mysqli_fetch_assoc($result);
                    
                    $_SESSION['current_user'] = $row['username']; 
                    $_SESSION['pWord'] = $row['password'];
                    $_SESSION['name'] = $row['name'];
                    $_SESSION['mail'] = $row['email'];
                    $_SESSION['pno'] = $row['phone'];
                    
                    header('location:index.php');
                }
                else
                {
                    $_SESSION['error_message'] = "You have provided invalid credentials";

                }
            }
            else {
                $_SESSION['error_message']="User not exsit";
            }
        }
    }
   
    
?>


<html>
  <head>
    
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">     
      <link href="../css/login.css" rel="stylesheet">
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <!------ Include the above in your HEAD tag ---------->
      
      
       <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Home Page | Milano</title>

        <!--title icon-->
        <link rel="icon" type="image/ico" href="../image/logo.png"/>

        <!-- Bootstrap core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

      
  </head>
    
<body id="LoginForm">
    
      <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="../webPage/index.php"><img src="../image/logo.png" style="height:50px;"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto lead">
                    <li class="nav-item active">
                        <a class="nav-link" href="../webPage/index.php">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../webPage/login.php">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../webPage/signup.php">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
    <div class="login-form">
    <div class="main-div">
        <div class="panel">
       <h2>Login</h2>
       </div>
        <form method ="post" action="login.php">

            <div class="form-group">
                <input type="text" class="form-control" value="<?php echo $user;?>" name="txt" placeholder="User Name">
            </div>
            <div class="form-group">
                <input type="password" value="<?php echo $pwd;?>" class="form-control" name="password" placeholder="Password">
            </div>
            <div class="forgot">
            <a href="reset.html">Forgot password?</a>
    </div>
            <button type="submit" class="btn btn-primary" name="submit">Login</button>
            <div>
             <p> <?php echo $_SESSION['error_message'];?></p>
            </div>

        </form>
        </div>
    </div></div>


</body>
</html>