<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px
}
.row{
   margin: 0px auto;
   width: 800px
}
</style>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">자료실</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<a href="insert.do" class="btn btn-sm btn-danger">등록</a>
					</td>
				</tr>
				<thead>
				<tr>
					<th width="10%" class=text-center>번호</th>
					<th width="45%" class=text-center>제목</th>
					<th width="15%" class=text-center>이름</th>
					<th width="20%" class=text-center>작성일</th>
					<th width="10%" class=text-center>조회수</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td width="10%" class=text-center></td>
					<td width="45%"></td>
					<td width="15%" class=text-center></td>
					<td width="20%" class=text-center></td>
					<td width="10%" class=text-center></td>
				</tr>
				</tbody>
				<tfoot>
				<tr>
					<td colspan="5" class=text-center>
						<input type="button" value="이전" class="btn btn-sm btn-sucess">
							{{curpage}} page / {{totalpage}} pages
						<input type="button" value="다음" class="btn btn-sm btn-info">
					</td>
				</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<script>
		let dataApp=Vue.createApp({
			data(){
				return{
					
				}
			},
			//생명주기(onload) : 브라우저 출력저에 서버로부터 데이터를 받는 경우
			mounted(){
				
			},
			//멤버변수의 값이 변경된 경우(Component제작)
			updated(){
				
			},
			//사용자 정의 메소드
			methods:{
				
			}
		}).mount('.container')
	</script>
</body>
</html>