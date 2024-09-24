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
		<h3 class="text-center">�ڷ��</h3>
		<div class="row">
			<table>
				<tr>
					<td>
						<a href="insert.do" class="btn btn-sm btn-danger">���</a>
					</td>
				</tr>
			</table>
			<table class="table">
				<thead>
				<tr>
					<th width="10%" class=text-center>��ȣ</th>
					<th width="45%" class=text-center>����</th>
					<th width="15%" class=text-center>�̸�</th>
					<th width="20%" class=text-center>�ۼ���</th>
					<th width="10%" class=text-center>��ȸ��</th>
				</tr>
				</thead>
				<tbody>
				<tr v-for="(vo, index) in list">
					<td width="10%" class=text-center>{{count-index}}</td>
					<%-- v-bind:href  == :href			--	v-bind ���� ����
						HTML�±��� �Ӽ��� ���� ä�ﶩ :�Ӽ���
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
						<input type="button" value="����" class="btn btn-sm btn-sucess">
							{{curpage}} page / {{totalpage}} pages
						<input type="button" value="����" class="btn btn-sm btn-info">
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
			//�����ֱ�(onload) : ������ ������� �����κ��� �����͸� �޴� ���
			mounted(){
				this.dataRecv()
			},
			//��������� ���� ����� ���(Component����)
			updated(){
				
			},
			//����� ���� �޼ҵ�
			methods:{
				//�������� �����͸� �о�´�(����/����/����)
				//�ݺ����Ź��(�޼ҵ�)
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