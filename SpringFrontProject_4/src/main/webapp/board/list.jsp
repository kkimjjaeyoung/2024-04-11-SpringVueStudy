<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%@ taglib prefix="v" uri=""%>--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		<h3 class="text-center">자유 게시판(VueJs)</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<a href="insert.do" class="btn btn-sm btn-primary">새글</a>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th width=10% class="text-center">번호</th>
					<th width=45% class="text-center">제목</th>
					<th width=15% class="text-center">이름</th>
					<th width=20% class="text-center">작성일</th>
					<th width=10% class="text-center">조회수</th>
				</tr>
				<tr v-for="vo in board_list">
					<td width=10% class="text-center">{{vo.no}}</td>
					<td width=45%>{{vo.subject}}</td>
					<td width=15% class="text-center">{{vo.name}}</td>
					<td width=20% class="text-center">{{vo.dbday}}</td>
					<td width=10% class="text-center">{{vo.hit}}</td>
				</tr>
				<tr>
					<td colspan="5" class="text-center">
						<input type=button class="btn btn-sm btn-success" value="이전" @click="prev()">
							{{curpage}} page / {{totalpage}} pages
						<input type=button class="btn btn-sm btn-info" value="다음" >
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script>
		let boardApp=Vue.createApp({
			data(){
				//멤버변수 설정
				/*
					vo : {}
				*/
				return{
					board_list:[],		//list(List)
					curpage:1,			//curpage(int)
					totalpage:0,		//totalpage(int)
					count:0				//count(int)
				}
			},
			//onload : 브라우저 실행 전에 서버에서 데이터 수령
			mounted(){		//ViewModel
				//서버에서 전송한 데이터 읽기
				this.dataRecv()
			},
			//사용자 정의 메소드
			methods:{
				//멤버변수 변경
				dataRecv(){
					axios.get('http://localhost:8080/web/board/list_vue.do',{
						params:{
							page:this.curpage
						}
					}).then(response=>{
						console.log(response.data)
						this.board_list=response.data.list
						this.curpage=response.data.curpage
						this.totalpage=response.data.totalpage
						this.count=response.data.count
					})
				},
				prev(){
					this.curpage=this.curpage>1?this.curpage-1:this.curpage
					this.dataRecv()
				},
				bext(){
					this.curpage=this.curpage<totalpage?this.curpage+1:this.curpage
					this.dataRecv()
				}
			}
		}).mount('.container')
	</script>
</body>
</html>