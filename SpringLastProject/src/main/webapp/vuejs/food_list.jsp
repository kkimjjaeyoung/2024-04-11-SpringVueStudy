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
   width: 960px
}
p{
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}
</style>
<script src="image.js"></script>
<script src="page.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			
		</div>
		<div style="height: 10px;"></div>
		<div class="row">
			<div class="text-center">
				
			</div>
		</div>
	</div>
<script>
//.js : 재사용 목적(다이얼로그)


//Vue 시작
	let listApp=Vue.createApp({
		data(){
			return{
				list:[],
				curpage:1,
				totalpage:0,
				startPage:0,
				endPage:0
			}
		},
		mounted(){
			this.dataRecv()
		},
		methods:{
			prev(){
				this.curpage=this.startPage-1
				this.dataRecv()
			},
			next(){
				this.curpage=this.endPage+1
				this.dataRecv()
			},
			pageChange(page){
				this.curpage=this.page
				this.dataRecv()
			},
			dataRecv(){
				axios.get('../food/list_vue.do',{
					params:{
						page:this.curpage???????????????????????????
					}
				}
			}
					page:this.curpage
				}).then(response=>{
					console.log(response.data)
					this.list=response.data.list
					this.curpage=response.data.curpage
					this.totalpage=response.data.totalpage
					this.startPage=response.data.startPage
					this.endPage=response.data.endPage
				}).catch(error=>{
					console.log(error.response)
				})	
			},
			range(start,end){
				let arr[]
				let len=end-start
				for(let i=0;i<len; i++){
					arr[i]=start
					start++
				}
				return arr
			},
			components:{
				//자바스크립트는 변수잡을때 _ 사용불가
				'image-card':image_card,
				'page-card':page_card
			}
		}
	}).mount('.container')
</script>
</body>
</html>