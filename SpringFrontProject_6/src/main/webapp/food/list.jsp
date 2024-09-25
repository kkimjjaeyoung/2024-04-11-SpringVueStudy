<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
   width: 960px
}
p{
	white-space: nowrap;
	overflow:hiiden;
	text-overflow:ellipsis;
}
input[type="button"]{
	margin-left: 5px;
}
</style>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<input type="button"class="btn-sm btn-danger" value="�ѽ�"
				@click="typeChange('�ѽ�')">
				<input type="button"class="btn-sm btn-success" value="���"
				@click="typeChange('���')">
				<input type="button"class="btn-sm btn-info" value="�߽�"
				@click="typeChange('�߽�')">
				<input type="button"class="btn-sm btn-primary" value="�Ͻ�"
				@click="typeChange('�Ͻ�')">
				<input type="button"class="btn-sm btn-warning" value="�н�"
				@click="typeChange('�н�')">
			</div>
		</div>
		<div style="height: ">
		<div class="row">
			<div class="col-md-4" v-for="vo in food_list">
				<div class="thumbnail">
					<a :href="'detail.do?fno='+vo.fno+'&page='+curpage">
						<img :src="'http://www.menupan.com'+vo.poster" :title="vo.type" style="width:230px; height: 130px;">
							<div class="caption">
								<p>{{vo.name}}</p>
							</div>
					</a>
				</div>
			</div>
		</div>
		<div style="height: 10px;"></div>
			<div class="row">
				<div class="text-center">
				<input type=button class="btn-sm btn-primary" value="����" @click="prev()">
					{{curpage}} page / {{totalpage}} pages
				<input type=button class="btn-sm btn-primary" value="����" @click="next()">
				</div>
			</div>
		</div>
	</div>
<script>
	let listApp=Vue.createApp({
		data(){
			return{			//�ʱⰪ ����
				food_list:[],
				curpage:1,
				totalpage:0,
				type:'�ѽ�'
			}
		},
		//ȭ������� �����ʱ�ȭ(��������) : axios.get
		mounted(){
			this.dataRecv()
		},
		methods:{
		//�������� �ݺ�->����
			//list_vue.do?page=1&type=�ѽ�
			dataRecv(){
				axios.get('list_vue.do',{
					//Ajax = data:{page:1, type:'�ѽ�'}
					params:{
						page:this.curpage,
						type:this.type
					}
				}).then(response=>{
					console.log(response.data)
					this.food_list=response.data.list
					this.curpage=response.data.curpage
					this.totalpage=response.data.totalpage
					this.type=response.data.type
				}).catch(error=>{
					console.log(error.response)
				})
			},
			typeChange(type){
				this.type=type
				this.curpage=1
				this.dataRecv()
			},
			prev(){
				this.curpage=this.curpage>1?this.curpage-1:this.curpage
				this.dataRecv()
			},
			next(){
				this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
				this.dataRecv()
			}
		}
		/*
		1. ��ü �ڵ�
		2. �ݺ�
		3. ����
		-->�޼ҵ�ȭ
	*/
	}).mount('.container')
</script>
</body>
</html>