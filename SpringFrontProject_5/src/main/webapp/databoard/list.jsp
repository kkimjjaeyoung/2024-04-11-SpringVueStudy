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
			<table class="table">
				<tr>
					<td>
						<a href="insert.do" class="btn btn-sm btn-danger">���</a>
					</td>
				</tr>
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
					
				}
			},
			//�����ֱ�(onload) : ������ ������� �����κ��� �����͸� �޴� ���
			mounted(){
				
			},
			//��������� ���� ����� ���(Component����)
			updated(){
				
			},
			//����� ���� �޼ҵ�
			methods:{
				
			}
		}).mount('.container')
	</script>
</body>
</html>