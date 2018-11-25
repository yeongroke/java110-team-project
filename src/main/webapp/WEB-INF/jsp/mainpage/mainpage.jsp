<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<html>
<head>
<meta charset="UTF-8">
<title>하루 - Haru</title>

<%-- 부트스트랩 --%>
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<%-- 만든 css --%>
<link rel="stylesheet" href="/css/main-menu.css">

<%-- maincarousel --%>
<link href="/css/owl.carousel.css" rel="stylesheet">
<link href="/css/clean-blog.css" rel="stylesheet">
<link href="/css/common.css" rel="stylesheet">
<link href="/css/main-menu.css" rel="stylesheet">

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <jsp:include page="../headerMain.jsp"></jsp:include>
            </div>
        </div>
    </div>

    <div class="text-center" id="main-carousel">
        <div class="row">
            <!--Carousel Wrapper-->
            <div id="carousel-banner" class="carousel slide carousel-fade" data-ride="carousel">
                <!--Indicators-->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-banner" data-slide-to="0"></li>
                    <li data-target="#carousel-banner" data-slide-to="1" class="active"></li>
                    <li data-target="#carousel-banner" data-slide-to="2"></li>
                </ol>
                <!--/.Indicators-->
                <!--Slides-->
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item">
                        <div class="view">
                            <img class="w-100" src="/upload/img/banner_1.png" alt="First slide">
                            <div class="mask rgba-black-light"></div>
                        </div>
                    </div>
                    <div class="carousel-item active">
                        <!--Mask color-->
                        <div class="view">
                            <img class="w-100 " src="/upload/img/banner_2.png" alt="Second slide">
                            <div class="mask rgba-black-strong"></div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <!--Mask color-->
                        <div class="view">
                            <img class="w-100" src="/upload/img/banner_3.png" alt="Third slide">
                            <div class="mask rgba-black-slight"></div>
                        </div>
                    </div>
                </div> 
                <!--/.Slides-->
            </div>

        </div>
        <!-- main carousel main-->
    </div>
    <!-- main carousel container-->
    <!-- 메인 carousel -->

    <div class="container">
        <div class="row">
            <!-- 카테고리 네비 -->
            <div class="col-12 my-3">
                <jsp:include page="../headerNav.jsp"></jsp:include>
            </div>

            <!-- 사이드바 -->
            <div class="col-12 my-3">
            <div class="row">
                    <div class="col-lg-3 border-right border-secondary">
                        <div class="col">
                            <h2>카테고리</h2>
                            <ul>
                                <c:forEach items="${BTlist}" var="bt">
                                    <li><a href="#">${bt.name}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!-- 인싸예감 클래스(카르셀) -->
                    <div class="col-lg-9">
                        <div class="row">
                            <div class="col">
                                <h2>인싸예감 클래스</h2>
                                <div id="owl-hotCls" class="owl-carousel col-lg-10 mt-2" style="margin:0 auto">

                                </div>
                                <div class="owl-btns">
                                    <div class="cusnextCls"><i class="fas fa-caret-right"></i></div>
                                    <div class="cusprevCls"><i class="fas fa-caret-left"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
        </div>
        <!-- 사이드바 container-->
    </div>

    <!-- 오늘의 추천작품 -->
    <div class="container">
        <hr class="Fhr" />
        <div class="row my-3">
            <div class="col-lg-12">
                <h2>오늘의 추천작품</h2>
                <div class="button_base b01_simple_rollover" onclick="location.href='../product/prdt'">작품 더보기</div>
            </div>
            
        </div><!-- 추천작품 row -->
    </div>
    <!-- 오늘의 추천작품 container-->

    <!-- 오늘의 추천작품 carousel-->
    <div class="container">
        <div class="row">
            <div class="col">
                <div id="owl-hotItem" class="owl-carousel col-lg-10 mt-2 px-1" style="margin:0 auto">

                </div>
                <div class="owl-btns">
                    <div class="cusnextPrdt"><i class="fas fa-caret-right"></i></div>
                    <div class="cusprevPrdt"><i class="fas fa-caret-left"></i></div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="col px-0">
            <jsp:include page="../footer.jsp"></jsp:include>
        </div>
    </footer>
    
    <!-- Bootstrap core JavaScript -->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->
	<!-- js 추가 -->
	<script src="/js/clean-blog.js"></script>
    <script src="/js/owl.carousel.js"></script>
    <script>
    var owlCls = $("#owl-hotCls");
    var owlPrdt = $("#owl-hotItem");
    $(document).ready(function(){
        var dataCls = { "itemsCls" : ${cp_list} };
        var dataPrdt = { "itemsPrdt" : ${pp_list} };
        
        owlCls.owlCarousel({
        nav:false,
        loop:true,
        items:3,
        margin:10,
        jsonPath : 'json/customData.json',
        jsonSuccess : customDataSuccessCls(dataCls),
        
      });
      function customDataSuccessCls(dataCls) {
          var content = "";
          for ( var i in dataCls["itemsCls"]) {
           
           var cno = dataCls["itemsCls"][i].no;
           var cfile = dataCls["itemsCls"][i].cfile;
           var titl = dataCls["itemsCls"][i].titl;
           var pric = dataCls["itemsCls"][i].pric;
           
           content += "<a href='../class/detail?no="+ cno +"'>"
           content += "<div class='col-lg-12' id='owl-col'>"
           content += "<div class='row' id='owl-row'>"
           content += "<img id='owl-img' src=\"" +cfile+ "\" alt=\"" +titl+ "\">"
           content += "<div class='col-lg-12' id='owl-col2'>" + titl + "</div>"
           content += "<div class='col-lg-12' id='owl-col3'>" + pric + "￦</div>"
           content += "</div>"
           content += "</div>"
           content += "</a>"
          }
          owlCls.html(content);
      }
      
      
      /* 아이템 카르셀 */
      owlPrdt.owlCarousel({
          nav:false,
          loop:true,
          items:4,
          margin:10,
          jsonPath : 'json/customData.json',
          jsonSuccess : customDataSuccessPrdt(dataPrdt),
          
        });

        function customDataSuccessPrdt(dataPrdt) {
            var content = "";
            for ( var i in dataPrdt["itemsPrdt"]) {
             var ptno = dataPrdt["itemsPrdt"][i].no;
             var phot = dataPrdt["itemsPrdt"][i].phot;
             var titl = dataPrdt["itemsPrdt"][i].titl;
             var pric = dataPrdt["itemsPrdt"][i].pric;
             content += "<a href='../product/detail2?no="+ ptno +"'>"
             content += "<div class='col-lg-12' id='owl-col'>"
             content += "<div class='row' id='owl-row'>"
             content += "<img id='owl-img' src=\"" +phot+ "\" alt=\"" +titl+ "\">"
             content += "<div class='col-lg-12' id='owl-col2'>" + titl + "</div>"
             content += "<div class='col-lg-12' id='owl-col3'>" + pric + "￦</div>"
             content += "</div>"
             content += "</div>"
             content += "</a>"
            }
            owlPrdt.html(content);
        }

     });
    
      $(".cusnextCls").click(function() {
          owlCls.trigger('next.owl.carousel');
      });
	
      $(".cusprevCls").click(function() {
          owlCls.trigger('prev.owl.carousel');
      });
      
      $(".cusnextPrdt").click(function() {
          owlPrdt.trigger('next.owl.carousel');
      });

      $(".cusprevPrdt").click(function() {
          owlPrdt.trigger('prev.owl.carousel');
      });
      
       </script> 
</body>
</html>