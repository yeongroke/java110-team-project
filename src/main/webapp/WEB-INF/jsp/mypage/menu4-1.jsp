<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-lg-12">
    <div class="panel panel-default">
       
        
            <h2 class="colorlib-heading">1:1 문의내역 <div id="wrapper" class="wrapper-cs">
                            <button id="classbkt" class="fancy" >1:1문의하기</button>
                        </div>
        </h2>
       
            
       
       
                        
                        
        <div class="panel-body">
            <table class="table table-condensed" style="border-collapse:collapse;">

                <thead>
                    <tr>
                       
                        <th>No.</th>
                        <th>질문유형</th>
                        <th>제목</th>
                        <th>문의일자</th>
                        <th>처리상태</th>
                    </tr>
                </thead>

                <tbody>

   <%--  <c:foreach items="${cs}" var="item" varStatus="i"> --%>

                    <tr data-toggle="collapse" data-target="#demo${status.index}" class="accordion-toggle">
                        <td>1</td>
                        <td>클래스 문의</td>
                        <td>멘토가 잠수탔어요...</td>
                        <td>2018-11-15</td>
                        <td>답변완료</td>
                        

                    </tr>
                    <tr>
                        <td colspan="6" class="hiddenRow">
                            <div class="accordian-body collapse" id="demo${status.index}">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                           <td class="qcontents">문의내용</td>
                                            <td>진심 X빡쳐요. 경찰에 신고해야하나요? 하루수업하더니 연락두절이네요
                                            </td>
                                        </tr>
                                        
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="qcontents">답변내용</td>
                                            <td>아... OO님 저희도 반달곰 멘토님을 애타게 찾고있습니다.아마 겨울이라서 남은수업도 잊은채 겨울잠에 들어가신거같은데요.... 깜빡하신분들은 저희가 우선 환불처리를 해드리고있습니다.</td>
                                            
                                        </tr>


    <!-- </c:forEach> -->
                                    </tbody>
                                </table>

                            </div>
                        </td>
                    </tr>
                    
                    
                   
                    
                    
                    
                </tbody>
            </table>
        </div>

    </div>

<!-- Paging 처리 -->
                        <div id="paging">
                            <!--        ${pageCode}-->
                        </div>
                    </div>
                </div>

 <!-- page navigation -->
<nav aria-label="Page navigation"  class="pn-center" >
  <ul class="pagination" >
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>
            