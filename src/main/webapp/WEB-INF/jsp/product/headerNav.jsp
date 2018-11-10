<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="../../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- 폰트 추가 -->
    <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="../../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- Custom styles for this template -->
    <link href="../../../css/clean-blog.css" rel="stylesheet">
    
    </head>
    <!-- Category Navigation -->
      <hr class="Fhr">
    <nav class="navbar navbar-expand-lg">
      <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#categoryNav" aria-controls="categoryNav" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="categoryNav">
          <ul class="navbar-nav ml-auto mr-auto" id="mainUl">
            <li class="nav-item">
              <a class="nav-link" href="index.html" id="menu01">인기수업</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html" id="menu02">디자인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="post.html" id="menu03">음악</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.html" id="menu04">뷰티</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">프로그래밍</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="post.html">취미</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.html">외국어</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">운동</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="post.html">실무역량</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.html">프리마켓</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <hr class="FhrBotMargin">
    <div id="menusubs" class="menusubs">
    <ul id="menu01_sub" class="localNav"> 
        <li><a href="#">메뉴1_1</a></li>
        <li><a href="#">메뉴1_2</a></li> 
        <li><a href="#">메뉴1_3</a></li> 
    </ul>
    <ul id="menu02_sub" class="localNav"> 
        <li><a href="#">메뉴2_1</a></li>
        <li><a href="#">메뉴2_2</a></li> 
        <li><a href="#">메뉴2_3</a></li> 
    </ul>
    <ul id="menu03_sub" class="localNav"> 
        <li><a href="#">메뉴3_1</a></li>
        <li><a href="#">메뉴3_2</a></li> 
        <li><a href="#">메뉴3_3</a></li> 
    </ul>
    <ul id="menu04_sub" class="localNav"> 
        <li><a href="#">메뉴4_1</a></li>
        <li><a href="#">메뉴4_2</a></li> 
        <li><a href="#">메뉴4_3</a></li> 
    </ul>
    </div>
    

    <!-- Bootstrap core JavaScript -->
    <script src="../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="../../../js/clean-blog.min.js"></script>
    
    <!-- 카테고리 서브메뉴 -->
    <script>
        $(document).ready(function(){
      var submenu=new Array();
      var sub_tmps=document.getElementById("menusubs").getElementsByTagName("ul");
      for (var i=0, len=sub_tmps.length; i<len; i++) {
         if (sub_tmps[i].className=="localNav"){
            submenu.push(sub_tmps[i]);
         }
      }
      var menu_tmps=document.getElementById("mainUl").getElementsByTagName("a");
      for (var i=0, len=menu_tmps.length; i<len; i++) {
         if (menu_tmps[i].className=="nav-link") {
            menu_tmps[i].onmouseover=function() {
               for (var j=0, sublen=submenu.length; j<sublen; j++)
                  submenu[j].style.display="none";
               document.getElementById(this.id+"_sub").style.display="block";
            }
            menu_tmps[i].onfocus=menu_tmps[i].onmouseover;
         }
      }
        });
</script>
</html>