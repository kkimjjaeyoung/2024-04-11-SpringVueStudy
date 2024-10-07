<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<my-button v-bind:btn="btn" @click="btnClick1()"></my-button>
				<my-button1 v-bind:btn="btn1"@click="btnClick2()"></my-button1>
				<my-button2 v-bind:btn="btn2" @click="btnClick3()"></my-button2>
			</div>
		</div>
	</div>
<script>
//재사용
const mybtn={
	//변수생성
	props:['btn'],
	//변수출력
	template:`<button class="btn-sm btn-danger">{{btn}}</button>`,
	methods:{
		//app(vue)의 btnClick1 호출
		this.$parent.btnClick1()
	}
}
	const mybtn={
		props:['btn1'],
		template:`<button class="btn-sm btn-danger">{{btn1}}</button>`		
}
const mybtn={
		props:['btn2'],
		template:`<button class="btn-sm btn-danger">{{btn2}}</button>`		
}
	let app=Vue.createApp({
		data(){			
			return{
				btn:'로그인',
				btn1:'취소',
				btn2:'회원가입',
				message:'로그인버튼 클릭'
			}
		},
		methods:{
			btnClick(){
				alert(this.message)
			}			
		},
		//child		--	상위를 가져올경우 : parent
		components:{
			'my-button':mybtn,
			'my-button':mybtn1,
			'my-button':mybtn2
		}
	}).mount('.container')
</script>
</body>
</html>