<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 부트스트랩 --%>
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<%-- css --%>
 <link href="/css/basketproduct.css" rel="stylesheet">
<link href="/css/common.css" rel="stylesheet">
</head>


<body>
	<div id="wrap" style="background-color: #fff">
		<div class="col" style="position: absolute; height: 105px; background-color: white">
			<!-- 헤더 배경색 적용 -->
		</div>

		<div class="container">
			<div class="row">
				<div class="col" style="position: absolute; height: 105px; background-color: white">
					<!-- 헤더 배경색 적용 -->
				</div>

				<div class="col-lg-12" style="z-index: 100">
					<jsp:include page="../headerMain.jsp"></jsp:include>
				</div>

				<!-- 카테고리 nav (스크립트로 임시 inclue) -->
				<div class="col-lg-12">
					<jsp:include page="../headerNav.jsp"></jsp:include>
				</div>

				<!-- 버튼 -->

				<div class="col-lg-12 mt-5">
					<div class="row">
						<div class="main-btn col-lg-6 text-left">
							<button type="button" class="btn btn-outline-secondary btn-lg" id="btn-cl" onclick="location.href='/app/class/basket'">장바구니(클래스)</button>
							<button type="button" class="btn btn-outline-secondary btn-lg"
								onclick="location.href='/app/product/basket'" style="background-color:whitesmoke; color: black;" >장바구니(공예품)</button>
						</div>
						<div class="col-lg-6 text-right">
							<span style="font-size: 22px; float: right;"> <span><strong>></strong>완료</span></span> <span
								style="font-size: 22px; float: right;"> <span><strong>></strong>결제</span></span> <span
								style="font-size: 22px; color: Dodgerblue; float: right;">장바구니</span>
						</div>
					</div>

					<div class="col-lg-12 mt-5">
						<table class="table table-overed">

							<thead>
								<tr class="d-flex">
									<th class="col-5 text-center">상품</th>
									<th class="col-2 text-center">가격</th>
									<th class="col-1 text-center">수량</th>
									<th class="col-1 text-center">배송료</th>
									<th class="col-2 text-center">결제금액</th>
									<th class="col-1"> </th>
								</tr>

							</thead>

							<tbody>
								<c:forEach items="${basketList}" var="r" varStatus="i">
									<tr class="product d-flex">
										<td class="col-5">
											<div class="media">
											     <input type="hidden" id="titl${i.index}" value="${r.product.titl }">
												<a class="thumbnail pull-left" href="../product/detail?no=${r.ptno}"> <img class="media-object"
													src="${r.product.phot}" style="width: 100px; height: 100px;">
												</a>
												<div class="media-body">
													<h4 class="media-heading">
														<a href="../product/detail?no=${r.ptno}">${r.product.titl }</a>
													</h4>
													<h5 class="media-heading">
														판매자 : ${r.mentee.nick }
													</h5>
													<span></span><span class="text-warning"><strong>인당 최대 수량: ${r.product.stock}개</strong></span>
												</div>
											</div>
										</td>
										<td class="product-price col-2 text-center">${r.product.pric }</td>
										<td class="product-quantity col-1 text-center"><input type="number" id="cnt${i.index}" name="produc1"
											min="1" max="${r.product.stock}" style="width:70px" value="${r.cnt}"></td>
										<td class="del col-1 text-center">${r.product.deli}</td>
										<td class="product-line-price col-2 text-center">${(r.product.pric * r.cnt)+r.product.deli }</td>
										<td class="product-removal col-1" id="del-button">
											<button type="button" class="btn btn-danger" value="${r.no}">삭제</button>
										</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>

						<!-- 계산 -->
						<div class="container">
							<div class="row">
								<div class="total col-lg-12">
									<div class="totals">
										<div class="totals-item totals-item-total">
											<label> 최종 결제 금액</label>
                                            <c:forEach items="${sumList}" var="r">
											<div class="totals-value" id="cart-total">${r.sum }</div>
                                            </c:forEach>
										</div>
									</div>

									<div class="btn-all">
										<button class="checkout btn btn-light" onclick="callpay()">장바구니 결제</button>
									</div>

								</div>
								<!-- 계산 12-->
							</div>
							<!-- 계산 row-->
						</div>
						<!-- 계산 container-->

					</div>



				</div>
				<!-- main row-->
			</div>
			<!-- main container-->
			
		</div>
	     <footer>
            <div class="col px-0">
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </footer>
	</div>
	<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/js/basketproduct.js"></script>
	<script>
	
	function addOrder(payopt){
	    
	    var arr = new Array();
	    <c:forEach items="${basketList}" var="b" varStatus="i">
	    if(${i.index==0}) saveTitl='${r.product.titl}';
	    var cnt = $('input#cnt${i.index}').val()
	    arr.push("${b.no}&${b.ptno}&${sessionScope.loginUser.no}&"+cnt+"&"+payopt);
	    </c:forEach>
	    
	    $.ajaxSettings.traditional = true;
	    $.ajax({
	        type : "POST",
	        data : {
	            "arr" : arr,
	        },
	        url : "addOrder.do",
	        success : function(result) {
	            if(result == "complete"){
	                swal({
	                    title: "결제완료",
	                    text: "주문내역 페이지로 이동하시겠습니까?",
	                    icon: "success",
	                    buttons: true,
	                    dangerMode: true,
	                }).then((willDelete) => { 
	                    if (willDelete) {
	                        location.href="../mypage/mypage#productbkt";
	                    } else {
	                        location.href="../mainpage/mainpage";
	                    }
	                  });
	                
	            }
	        },
	        error : function(error, status) {
	        }
	    });
	}
	
	function callpay(){
	    
	    if(${sessionScope.loginUser eq null}){
	        swal({
	            text : "로그인 후 이용가능합니다..",
	            button : "확인",
	          })
	    }else{
	        var saveTitl = $('#titl0').val();
	        var saveTotal = document.getElementById('cart-total').innerHTML;
	        
	        var IMP = window.IMP; // 생략해도 괜찮습니다.
            IMP.init("imp40971131"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	        
	        IMP.request_pay({
	            pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
	            pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	            merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
	            name : saveTitl,
                amount : parseInt(saveTotal),
                buyer_email : '${sessionScope.loginUser.email}',
                buyer_name : '${sessionScope.loginUser.name}',
                buyer_tel : '${sessionScope.loginUser.phone}',
                buyer_addr : '${sessionScope.loginUser.bas_addr}',
                buyer_postcode : '${sessionScope.loginUser.pstno}'
	        }, function(rsp) {
	            if ( rsp.success ) {
	                addOrder(rsp.pay_method);
	                
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                
	                alert(msg);
	            }
	        });
	        
	    }
	}
	</script>
</body>
</html>