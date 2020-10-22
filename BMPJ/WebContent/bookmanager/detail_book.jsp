<%@page import="book_project.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String currentPage = request.getParameter("currentPage");
	//search_result에서 넘겨받은 b_no
	int book_no = Integer.parseInt(request.getParameter("book_no"));

	BookDBBean db = BookDBBean.getinstance();
	BookBean book = db.getBook(book_no);
	int b_price = book.getB_price();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 정보</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/book_project.css"/>
<script type="text/javascript" src="resources/js/book.js"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
  <body>
    <main>
      <div class="jumbotron">
        <div class="container">
          <div class="jumbo_text">상세 도서 정보</div>
        </div>
      </div>
    </main>

    <section>
      <div class="container">
        <div class="main_cont">
          <div class="book_image"><img src="#" /></div>
          <div class="detail_cont">
            <div class="detail_header">
              <h1><%=book.getB_title()%></h1>
              <div class="detail_sm">
                <div><%=book.getB_author()%></div>
                <div><%=book.getB_genre()%></div>
                <div><%=book.getB_year()%></div>
              </div>
              <div class="detail_price"> 
              	판매가 : <span class="price_highlight"><%=b_price%></span>
              </div>
            </div>
            
            <div class="detail_buy">
           	 <form method="post" action="#" class="form-inline">
              <div class="form-group">
               	<label for="b_quantity">주문수량 :</label>
               	<input type="number" name="b_quantity" class="form-control" id="b_quantity" min="1" value="1"/>
              </div>
              <div class="form-group">
                <button class="btn btn-default" type="button">
                  	장바구니 담기
                </button>
                <button class="btn btn-primary" type="button">
                	바로구매
                </button>
                </div>
              </form>
            </div>
            
          </div>
        </div>
      </div>
    </section>
    <section>
      <div class="container">
        <div class="detail">
          <div class="b_story"><%=book.getB_story()%></div>
          <div class="b_list"><%=book.getB_list()%></div>
        </div>
      </div>
    </section>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>