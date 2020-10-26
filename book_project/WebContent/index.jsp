<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>홈페이지</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resources/css/book_project.css"/>
    <script type="text/javascript" src="resources/js/book.js"></script>
  </head>
  <body>
    <jsp:include page="header.jsp"></jsp:include>
    <main>
        <div id="slide">
			  <input type="radio" name="pos" id="pos1" checked>
			  <input type="radio" name="pos" id="pos2">
			  <input type="radio" name="pos" id="pos3">
			  <input type="radio" name="pos" id="pos4">
			  <ul>
			    <li><div class="container main_slide"><img src="resources/images/main01.jpg"></div></li>
			    <li><div class="container main_slide"><img src="resources/images/main02.jpg"></div></li>
			    <li><div class="container main_slide"><img src="resources/images/main03.jpg"></div></li>
			    <li><div class="container main_slide"><img src="resources/images/main04.jpg"></div></li>
			  </ul>
 			  <p class="pos">
			    <label for="pos1"></label>
			    <label for="pos2"></label>
			    <label for="pos3"></label>
			    <label for="pos4"></label>
			  </p>
        </div>
    </main>

    <section>
      <div class="container">
        <h3>오늘의 책</h3>
        <div class="book_display_1">
          <p><img src="resources/images/2103010101.jpg" /></p>
          <dl>
            <dt>어린왕자</dt>
          </dl>
          <dl>
            <dd>생텍쥐페리</dd>
          </dl>
        </div>
      </div>
    </section>

    <section class="best_seller">
      <div class="container">
        <h3>베스트셀러</h3>
        <div class="book_display_2">
          <div class="book_display_2_1">
            <p><img src="resources/images/2103010101.jpg" /></p>
            <dl>
              <dt>어린왕자</dt>
            </dl>
            <dl>
              <dd>생텍쥐페리</dd>
            </dl>
          </div>
          <div class="book_display_2_1">
            <p><img src="resources/images/2103010101.jpg" /></p>
            <dl>
              <dt>어린왕자</dt>
            </dl>
            <dl>
              <dd>생텍쥐페리</dd>
            </dl>
          </div>
          <div class="book_display_2_1">
            <p><img src="resources/images/2103010101.jpg" /></p>
            <dl>
              <dt>어린왕자</dt>
            </dl>
            <dl>
              <dd>생텍쥐페리</dd>
            </dl>
          </div>
          <div class="book_display_2_1">
            <p><img src="resources/images/2103010101.jpg" /></p>
            <dl>
              <dt>어린왕자</dt>
            </dl>
            <dl>
              <dd>생텍쥐페리</dd>
            </dl>
          </div>
        </div>
      </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
