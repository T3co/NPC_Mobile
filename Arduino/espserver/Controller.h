<!DOCTYPE html>
<html lang="en" class="js-focus-visible">

<title> Controller </title>
  <style>

  .bodytext {
      font-family: "Verdana", "Arial", sans-serif;
      font-size: 24px;
      text-align: left;
      font-weight: light;
      border-radius: 5px;
      display:inline;
    }
    .navbar {
      width: 100%;
      height: 50px;
      margin: 0;
      padding: 10px 0px;
      background-color: #FFF;
      color: #000000;
      border-bottom: 5px solid #293578;
    }
    .fixed-top {
      position: fixed;
      top: 0;
      right: 0;
      left: 0;
      z-index: 1030;
    }
    .navtitle {
      float: left;
      height: 50px;
      font-family: "Verdana", "Arial", sans-serif;
      font-size: 50px;
      font-weight: bold;
      line-height: 50px;
      padding-left: 20px;
    }
   .navheading {
     position: fixed;
     left: 60%;
     height: 50px;
     font-family: "Verdana", "Arial", sans-serif;
     font-size: 20px;
     font-weight: bold;
     line-height: 20px;
     padding-right: 20px;
   }

   .category {
      font-family: "Verdana", "Arial", sans-serif;
      font-weight: bold;
      font-size: 32px;
      line-height: 50px;
      padding: 20px 10px 0px 10px;
      color: #000000;
    }
    .heading {
      font-family: "Verdana", "Arial", sans-serif;
      font-weight: normal;
      font-size: 28px;
      text-align: left;
    }


 /*Forward button css*/
.Fbtn{
    font-family: "Roboto", sans-serif;
    font-size: 18px;
    font-weight: bold;
    background: #1E90FF;
    width: 160px;
    padding: 20px;
    text-align: center;
    display: block;
    margin: 5%;
    left: 100px;;
    text-decoration: none;
    text-transform: uppercase;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: box-shadow, transform;
    transition-property: box-shadow, transform;
}

 /*Backward button css*/
.Bbtn{
    font-family: "Roboto", sans-serif;
    font-size: 18px;
    font-weight: bold;
    background: #1E90FF;
    width: 160px;
    padding: 20px;
    text-align: center;
    position: fixed;
    margin: 5%;
    left: 84px;;
    text-decoration: none;
    text-transform: uppercase;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: box-shadow, transform;
    transition-property: box-shadow, transform;
}

 /*Right Button css*/
.Rbtn{
    font-family: "Roboto", sans-serif;
    font-size: 18px;
    font-weight: bold;
    background: #1E90FF;
    width: 160px;
    padding: 20px;
    text-align: center;
    position: fixed;
    left: -10px;
    top: 31%;
    text-decoration: none;
    text-transform: uppercase;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: box-shadow, transform;
    transition-property: box-shadow, transform;
}

/*Left Button css*/
.Lbtn{
    font-family: "Roboto", sans-serif;
    font-size: 18px;
    font-weight: bold;
    background: #1E90FF;
    width: 160px;
    padding: 20px;
    text-align: center;
    position: fixed;
    left: 265px;
    top: 31%;
    text-decoration: none;
    text-transform: uppercase;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: box-shadow, transform;
    transition-property: box-shadow, transform;
}

</style>

  <body style="background-color: #efefef" onload="process()">


     <!--Forward Button ---------------------------------------------->

    <head>

        <link rel="stylesheet" href="Controller style.css">
    </head>
    <body>

        <a href="#" class="Fbtn">Forward</a>

    </body>



     <!--Backward Button ---------------------------------------------->
    <head>

        <link rel="stylesheet" href="Controller style.css">
    </head>
    <body>

        <a href="#" class="Bbtn">Backward</a>

    </body>

     <!--Right Button ---------------------------------------------->   
    <head>

        <link rel="stylesheet" href="Controller style.css">
    </head>
    <body>

        <a href="#" class="Rbtn">Right</a>

    </body>

    <!--Right Button ---------------------------------------------->  
    <head>

        <link rel="stylesheet" href="Controller style.css">
    </head>
    <body>

        <a href="#" class="Lbtn">Left</a>

    </body>




  </body>




</html>