<?php
error_reporting(0);
$bgColor = $s0['background'];
$primaryColor = $s0['primary_color'];
$secondaryColor = $s0['secondary_color'];
$textColor = $s0['text_color'];
$buttonColor = $s0['button_color'];
$buttonHover = $s0['button_hover'];
?>
<style type="text/css">
:root {
    --primary-color: <?php echo $primaryColor; ?>!important;
    --secondary-color: <?php echo $secondaryColor; ?>!important;
    --font-color: <?php echo $textColor; ?>!important;
    --bg-color: <?php echo $bgColor; ?>!important;
    --heading-color: <?php echo $primaryColor; ?>!important;
    --bg-cardcolor : <?php echo $primaryColor; ?>!important;
    --secondary-50 : 255.0000000000003 11.1% 92.9%;
}

body {
   background-color: <?php echo $bgColor; ?>!important;
   color: <?php echo $textColor; ?>!important;
}

a {
  color: <?php echo $textColor; ?>!important;
}
a:hover {
  color: <?php echo $buttonHover; ?>!important;
}

.btn-primary {
  background-color: <?php echo $buttonColor; ?>!important;
  border-radius: 25px!important;
  color: #fff!important;
  border: 0!important;
  height: 40px!important;
  line-height: 23px;
}

.btn-primary:hover {
  background-color: <?php echo $buttonHover; ?>!important;
  border-radius: 25px!important;
  color: #fff!important;
  border: 0!important;
  height: 40px!important;
  line-height: 23px;
}

.btn-danger {
  border-radius: 25px!important;
  color: #fff!important;
  border: 0!important;
  height: 40px!important;
  line-height: 23px;
}

.btn-danger:hover {
  border-radius: 25px!important;
  color: #fff!important;
  border: 0!important;
  height: 40px!important;
  line-height: 23px;
}

.form-control {
  border: 1px solid rgb(255,255,255,0.3)!important;
  border-radius: 25px;
  background-color: #fff!important;
  color: #495057 !important;
  height: 40px!important;
}

.form-control:focus{
  border: 1px solid <?php echo $buttonColor; ?>!important;
  border-radius: 25px;
  background-color: #fff!important;
  color: #495057 !important;
}

input::placeholder {
  color: #9c9c9c !important;
  font-size: 15px;
  opacity: .5 !important;
}

.shadow-sm {
  box-shadow: 0 4px 80px hsla(0,0%,77%,.13),0 1.6711px 33.4221px hsla(0,0%,77%,.09),0 .893452px 17.869px hsla(0,0%,77%,.08),0 .500862px 10.0172px hsla(0,0%,77%,.07),0 .266004px 5.32008px hsla(0,0%,77%,.05),0 .11069px 2.21381px hsla(0,0%,77%,.04)!important;
}

.strip-primary {
  background-color: #fff!important;
  position: absolute;
  width: 50px;
  height: 5px;
  border-radius: 2px;
  margin-bottom: 50px;
}

/* Header */

header div.navigasi {
  background-color: <?php echo $primaryColor; ?>!important;
}

header nav div.dropdown-menu {
  background-color: <?php echo $primaryColor; ?>!important;
}

/* Body */

.row {
  margin-right: -12.5px;
  margin-left: -12.5px;
}

.game {
  justify-content: center;
  width: auto;
}

.zoom {
  transition: transform .5s; /* Animation */
}

.zoom:hover {
  transform: scale(1.1);
}

.box_content {
  display: none;
  transition: transform .5s;
}

.box_image {
  height: 225px!important;
}

.box_hover:hover .box_content {
  display: block;
  width: 100%;
  height: 225px!important;
  border-radius: 10px;
  border: 2px solid <?php echo $buttonColor; ?>!important;
}

ul.nav-tabs {
  border-bottom: 0px!important;
}

ul.nav-tabs li.nav-item a.nav-link {
  border-bottom: 2px solid <?php echo $bgColor; ?>!important;
  border-radius: 0px!important;
  margin-right: 5px;
  color: <?php echo $textColor; ?>!important;
}

ul.nav-tabs li.nav-item a.nav-link:hover {
  background: none!important;
  border-bottom: 2px solid <?php echo $buttonColor; ?>!important;
  border-radius: 0px!important;
  margin-right: 5px;
  color: <?php echo $buttonColor; ?>!important;
}

ul.nav-tabs li.nav-item a.nav-link.active {
  background: none!important;
  border-bottom: 2px solid <?php echo $buttonColor; ?>!important;
  border-radius: 0px!important;
  margin-right: 5px;
  color: <?php echo $buttonColor; ?>!important;
}

.card {
  background-color: <?php echo $primaryColor; ?>!important;
  color: <?php echo $textColor; ?>!important;
}

.img_product {
  width: 150px;
  height: 150px;
  border-radius: 10px;
  margin-top: -100px;
}

.circle-primary {
  background-color: none;
  border : 2px solid <?php echo $buttonColor; ?>!important;
  border-radius: 50%;
  height: 35px;
  width: 35px;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  font-size: 21px;
  font-weight: 600;
  color: #fff!important;
}

.radio-nominale {
    color: white;
    display: none;
    margin: 10px;
    cursor: pointer;
    min-height: 75px;
}

.radio-nominale + label {
  text-align: left;
  color: <?php echo $textColor; ?>!important;
  display: inline-block;
  padding: 13px;
  background-color: <?php echo $secondaryColor; ?>!important;
  border: 2px solid <?php echo $primaryColor; ?>!important;
  cursor: pointer;
  border-radius: 10px;
  width: 100%;
  min-height: 75px;
  font-size: 10px;
}

.radio-nominale:checked + label {
  text-align: left;
  background-image: none;
  background-color: <?php echo $secondaryColor; ?>!important;
  color: #fff;
  border: 2px solid <?php echo $buttonColor; ?>!important;
  cursor: pointer;
  border-radius: 5px;
  width: 100%;
    min-height: 75px;
  font-size: 10px;
}

.radio-nominale:checked + label::after {
  position: absolute;
  top: 7px;
  right: 6px;
  width: 28px;
  height: 26px;
  content: "";
  background: url('../../upload/verified.png') top/cover;
  text-align: center;
}

.radio-nominal {
    color: white;
    display: none;
    margin: 10px;
    cursor: pointer;
}

.radio-nominal + label {
  text-align: left;
  color: #000!important;
  display: inline-block;
  padding: 5px;
  background-color: #fff;
  border: 2px solid #fff;
  cursor: pointer;
  border-radius: 5px;
  width: 100%;
  font-size: 10px;
}

.radio-nominal:checked + label {
  text-align: left;
  background-image: none;
  background-color: #fff;
  color: #fff;
  border: 2px solid <?php echo $buttonColor; ?>!important;
  cursor: pointer;
  border-radius: 5px;
  width: 100%;
  font-size: 10px;
}

.radio-nominal:checked + label::after {
  position: absolute;
  top: 6px;
  right: 7px;
  width: 28px;
  height: 26px;
  content: "";
  background: url('../../upload/verified.png') top/cover;
  text-align: center;
}

.accordion .card {
    background: <?php echo $secondaryColor; ?>!important;
    border: 1px solid <?php echo $secondaryColor; ?>!important;;
    border-radius: 10px!important;
    margin-bottom: 10px;
}

.accordion .card .card-header {
    background: <?php echo $secondaryColor; ?>!important;;
}

.accordion .card .card-header button {
    color: var(--font-color)!important;
}

.accordion .card .card-footer {
  background: #fff!important;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}

.area, .circles {
    width: 100%;
    height: 100%;
}
.circles {
  max-height: 238px;
}
.circles {
    position: absolute;
    top: 0;
    left: 0;
    overflow: hidden;
    background: linear-gradient(-90deg, rgba(61,61,61,1) 50%, rgba(30,33,36,1) 100%);
    max-height: 588px;
}
.circles li {
    position: absolute;
    display: block;
    list-style: none;
    width: 20px;
    height: 20px;
    background: #fff;
    animation: animate 25s linear infinite;
    bottom: -150px;
}
.circles li:first-child {
    left: 25%;
    width: 80px;
    height: 80px;
    animation-delay: 0s;
}
.circles li:nth-child(2) {
    left: 10%;
    width: 20px;
    height: 20px;
    animation-delay: 2s;
    animation-duration: 12s;
}
.circles li:nth-child(3) {
    left: 70%;
    width: 20px;
    height: 20px;
    animation-delay: 4s;
}
.circles li:nth-child(4) {
    left: 40%;
    width: 60px;
    height: 60px;
    animation-delay: 0s;
    animation-duration: 18s;
}
.circles li:nth-child(5) {
    left: 65%;
    width: 20px;
    height: 20px;
    animation-delay: 0s;
}
.circles li:nth-child(6) {
    left: 75%;
    width: 110px;
    height: 110px;
    animation-delay: 3s;
}
.circles li:nth-child(7) {
    left: 35%;
    width: 150px;
    height: 150px;
    animation-delay: 7s;
}
.circles li:nth-child(8) {
    left: 50%;
    width: 25px;
    height: 25px;
    animation-delay: 10s;
    animation-duration: 45s;
}
.circles li:nth-child(9) {
    left: 20%;
    width: 15px;
    height: 15px;
    animation-delay: 2s;
    animation-duration: 35s;
}
.circles li:nth-child(10) {
    left: 85%;
    width: 150px;
    height: 150px;
    animation-delay: 0s;
    animation-duration: 11s;
}
@keyframes animate {
    0% {
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }
    to {
        transform: translateY(-1000px) rotate(2turn);
        opacity: 0;
        border-radius: 50%;
    }
}


/* Fppter */

footer.bg-footer {
  background-color : <?php echo $secondaryColor; ?>!important;
}


/* Sidebar */

.sticky-left {
    position: fixed;
    top: 180px;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 99999;
  top: 0;
  left: 0;
  background: <?php echo $buttonColor; ?>!important;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 100px;
}

.sidenav ul.flex-column li.nav-item a.nav-link {
  color: <?php echo $textColor; ?>!important;
  font-size: 16px;
  font-weight: 500;
  -webkit-transition: line-height 0.3s ease-in-out;
  transition: line-height 0.3s ease-in-out;
}

.sidenav ul.flex-column li.nav-item a.nav-link:hover {
  color: <?php echo $buttonHover; ?>!important;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 15px;
  font-size: 36px;
  margin-left: 50px;
  color: #fff;
}

@media screen and (max-width: 778px){
  .navbar-collapse {
    background:var(--bg-color);
  }
}

@media screen and (max-width: 480px){
  .img_product {
    width: 6rem;
    height: 6rem;
    border-radius: 10px;
    margin-top: -70px;
  }

  .box_image {
    height: 150px!important;
  }

  .box_hover:hover .box_content {
    height: 150px!important;
  }

  .area {
    padding-bottom: 30px;
    margin-bottom: 30px;
  }
  .area, .circles {
      width: 100%;
      height: 100%;
  }
  .circles {
    max-height: 238px;
  }
  .circles {
      position: absolute;
      top: 0;
      left: 0;
      overflow: hidden;
      background: linear-gradient(-90deg, rgba(61,61,61,1) 50%, rgba(30,33,36,1) 100%);
      max-height: 300px;
  }
  .circles li {
      position: absolute;
      display: block;
      list-style: none;
      width: 20px;
      height: 20px;
      background: #fff;
      animation: animate 25s linear infinite;
      bottom: -150px;
  }
  .circles li:first-child {
      left: 25%;
      width: 80px;
      height: 80px;
      animation-delay: 0s;
  }
  .circles li:nth-child(2) {
      left: 10%;
      width: 20px;
      height: 20px;
      animation-delay: 2s;
      animation-duration: 12s;
  }
  .circles li:nth-child(3) {
      left: 70%;
      width: 20px;
      height: 20px;
      animation-delay: 4s;
  }
  .circles li:nth-child(4) {
      left: 40%;
      width: 60px;
      height: 60px;
      animation-delay: 0s;
      animation-duration: 18s;
  }
  .circles li:nth-child(5) {
      left: 65%;
      width: 20px;
      height: 20px;
      animation-delay: 0s;
  }
  .circles li:nth-child(6) {
      left: 75%;
      width: 110px;
      height: 110px;
      animation-delay: 3s;
  }
  .circles li:nth-child(7) {
      left: 35%;
      width: 150px;
      height: 150px;
      animation-delay: 7s;
  }
  .circles li:nth-child(8) {
      left: 50%;
      width: 25px;
      height: 25px;
      animation-delay: 10s;
      animation-duration: 45s;
  }
  .circles li:nth-child(9) {
      left: 20%;
      width: 15px;
      height: 15px;
      animation-delay: 2s;
      animation-duration: 35s;
  }
  .circles li:nth-child(10) {
      left: 85%;
      width: 150px;
      height: 150px;
      animation-delay: 0s;
      animation-duration: 11s;
  }
  @keyframes animate {
      0% {
          transform: translateY(0) rotate(0deg);
          opacity: 1;
          border-radius: 0;
      }
      to {
          transform: translateY(-1000px) rotate(2turn);
          opacity: 0;
          border-radius: 50%;
      }
  }
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 14px;}

}
</style>