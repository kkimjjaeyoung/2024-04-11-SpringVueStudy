<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- ****** Breadcumb Area Start ****** -->
    <div class="breadcumb-area" style="background-image: url(../img/bg-../img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>맛집 상세보기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    
                </div>
            </div>
        </div>
    </div>
    <section class="single_blog_area section_padding_80">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="row no-gutters">

                        <!-- Single Post -->
                        <div class="col-12 col-sm-12">
                            
                            <!-- Related Post Area -->
                            <div class="related-post-area section_padding_50">
                              
                                <div class="related-post-slider owl-carousel">
                                    <!-- Single Related Post-->
                                    <c:forTokens items="" delims="img">
                                    <div class="single-post">
                                        <!-- Post Thumb -->
                                        <div class="post-thumb">
                                            <img src="http://www.menupan.com${img }" alt="">
                                        </div>
                                    </div>
                                    </c:forTokens>
                                </div>
                            </div>
                            
                            <table class="table">
                              <tr>
                                <td width="30%" class="text-center" rowspan="7">
                                <img src="http://www.menupan.com${vo.poster}" style="width: 30%">
                                </td>
                                <td colspan="6">
                                	<h3>${vo.name }&nbsp;<span style="color:orange;">${vo.score }</span></h3>
                                </td>
                              </tr>
                              <tr>
                              	<td width="15%" class="text-center">주소</td>
                              	<td width="55%">${vo.address }</td>
                              </tr>
                              <tr>
                              	<td width="15%" class="text-center">전화</td>
                              	<td width="55%">${vo.phone }</td>
                              </tr>
                              <tr>
                              	<td width="15%" class="text-center">음식종류</td>
                              	<td width="55%">${vo.type }</td>
                              </tr>
                              <tr>
                              	<td width="15%" class="text-center">주차</td>
                              	<td width="55%">${vo.parking }</td>
                              </tr>
                              <tr>
                              	<td width="15%" class="text-center">영업시간</td>
                              	<td width="55%">${vo.time }</td>
                              </tr>
                            </table>
                            <table class="table">
                            	<tr>
                            		<td>${vo.theme }</td>
                            	</tr>
                            	<tr>
                            		<td>${vo.content }</td>
                            	</tr>
                            	<tr>
                            		<td class="text-right">
                            			<a href="#" class="btn btn-xs btn-danger">종아요</a>
                            			<a href="#" class="btn btn-xs btn-success">찜하기</a>
                            			<a href="#" class="btn btn-xs btn-info">예약</a>
                            			<a href="#" class="btn btn-xs btn-warning">목록</a>
                            		</td>
                            	</tr>
                            </table>
                            <!-- Comment Area Start -->
                            <div class="comment_area section_padding_50 clearfix">
                                <h4 class="mb-30">2 Comments</h4>

                                <ol>
                                    <!-- Single Comment Area -->
                                    <li class="single_comment_area">
                                        <div class="comment-wrapper d-flex">
                                            <!-- Comment Meta -->
                                            <div class="comment-author">
                                                <img src="../img/blog-img/17.jpg" alt="">
                                            </div>
                                            <!-- Comment Content -->
                                            <div class="comment-content">
                                                <span class="comment-date text-muted">27 Aug 2018</span>
                                                <h5>Brandon Kelley</h5>
                                                <p>Neque porro qui squam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora.</p>
                                                <a href="#">Like</a>
                                                <a class="active" href="#">Reply</a>
                                            </div>
                                        </div>
                                        <ol class="children">
                                            <li class="single_comment_area">
                                                <div class="comment-wrapper d-flex">
                                                    <!-- Comment Meta -->
                                                    <div class="comment-author">
                                                        <img src="../img/blog-img/18.jpg" alt="">
                                                    </div>
                                                    <!-- Comment Content -->
                                                    <div class="comment-content">
                                                        <span class="comment-date text-muted">27 Aug 2018</span>
                                                        <h5>Brandon Kelley</h5>
                                                        <p>Neque porro qui squam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora.</p>
                                                        <a href="#">Like</a>
                                                        <a class="active" href="#">Reply</a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                    </li>
                                    <li class="single_comment_area">
                                        <div class="comment-wrapper d-flex">
                                            <!-- Comment Meta -->
                                            <div class="comment-author">
                                                <img src="../img/blog-img/19.jpg" alt="">
                                            </div>
                                            <!-- Comment Content -->
                                            <div class="comment-content">
                                                <span class="comment-date text-muted">27 Aug 2018</span>
                                                <h5>Brandon Kelley</h5>
                                                <p>Neque porro qui squam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora.</p>
                                                <a href="#">Like</a>
                                                <a class="active" href="#">Reply</a>
                                            </div>
                                        </div>
                                    </li>
                                </ol>
                            </div>

                            <!-- Leave A Comment -->
                            <div class="leave-comment-area section_padding_50 clearfix">
                                <div class="comment-form">
                                    <h4 class="mb-30">Leave A Comment</h4>

                                    <!-- Comment Form -->
                                    <form action="#" method="post">
                                       
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
          </div>
      </div>
    </section>
                
</body>
</html>