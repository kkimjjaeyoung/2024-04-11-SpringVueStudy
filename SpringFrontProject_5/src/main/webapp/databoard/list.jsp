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
			<table>
				<tr>
					<td>
						<a href="insert.do" class="btn btn-sm btn-danger">등록</a>
					</td>
				</tr>
			</table>
			<table class="table">
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
				<tr v-for="(vo, index) in list">
					<td width="10%" class=text-center>{{count-index}}</td>
					<%-- v-bind:href  == :href			--	v-bind 생략 가능
						HTML태그의 속성에 값을 채울땐 :속성명
						img= :src, :title
						a= :href
						--%>
					<td width="45%"><a :href="'detail.do?no='+vo.no">{{vo.subject}}</a></td>
					<td width="15%" class=text-center>{{vo.name}}</td>
					<td width="20%" class=text-center>{{vo.dbday}}</td>
					<td width="10%" class=text-center>{{vo.hit}}</td>
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
					board_list:[],
					curpage:1,
					totalpage:0,
					count:0,
				}
			},
			//생명주기(onload) : 브라우저 출력저에 서버로부터 데이터를 받는 경우
			mounted(){
				this.dataRecv()
			},
			//멤버변수의 값이 변경된 경우(Component제작)
			updated(){
				
			},
			//사용자 정의 메소드
			methods:{
				//서버에서 데이터를 읽어온다(이전/다음/시작)
				//반복제거방법(메소드)
				dataRecv(){
					axios.get('http://localhost:8080/web/databoard/list_vue.do',{
						params:{
							page:this.curpage
						}
					}).then(response=>{
						console.log(response.data)
						this.list=response.data.list
						// response={data:{curpage:1, totalpage:0, count:0, list:[]}}
						this.curpage=response.data.curpage
						this.totalpage=response.data.totalpage
						this.count=response.data.count
					}).catch(error=>{
						console.log(error.response)
					})
				}
			}
		}).mount('.container')
	</script>
</body>
</html>