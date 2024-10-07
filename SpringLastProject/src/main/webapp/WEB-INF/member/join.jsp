<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
  <!-- ****** Breadcumb Area Start ****** -->
    <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>ȸ������</h2>
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
    <section class="single_blog_area section_padding_80" id="joinApp">
        <div class="container">
            <div class="row justify-content-center">
            	<form method="post" action="../member/join_ok.do" name="frm" @submit.prevent="sebmitForm()">
			    <table class="table">
			     <tr>
			      <th class="text-right" width="20%">ID</th>
			      <td width="80%" >
			       <input type="text" size=20 class="input-sm" 
			          v-bind=readonly="idReadOnly" readonly name="id" ref="userId" v-model="userId">
			       <input type="button" value="�ߺ�üũ"
			         class="btn-sm btn-danger" id="checkBtn" @click="idCheck()">
			         <p>{{idOk}}</p>
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">��й�ȣ</th>
			      <td width="80%" >
			       <input type="password" size=20 class="input-sm" name="pwd" id="pwd">
			       <!-- &nbsp;���Է�:<input type="password" size=20 class="input-sm" id="pwd1"> -->	
			      </td>
			      </tr>
			      <tr>
			      <th class="text-right" width="20%">��й�ȣ ���Է�</th>
			      <td width="80%" >
			       <input type="password" size=20 class="input-sm" id="pwd1">
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">�̸�</th>
			      <td width="80%">
			       <input type="text" size=20 class="input-sm" name="name" id="name">
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">����</th>
			      <td width="80%" >
			       <input type="radio" name="sex" value="����" checked>����
			       <input type="radio" name="sex" value="����">����
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">�������</th>
			      <td width="80%">
			       <input type="date" size=30 class="input-sm" name="birthday" id="day">
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">�̸���</th>
			      <td width="80%">
			       <input type="text" size=70 class="input-sm" name="email" id="email">
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">�����ȣ</th>
			      <td width="80%" >
			       <input type="text" size=15 class="input-sm" name="post" readonly id="post1">
			       <input type=button value="�����ȣ�˻�"
			         class="btn btn-sm btn-primary" id="postBtn">
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">�ּ�</th>
			      <td width="80%">
			       <input type="text" size=70 class="input-sm" name="addr1" readonly id="addr1">
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">���ּ�</th>
			      <td width="80%">
			       <input type="text" size=70 class="input-sm" name="addr2">
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">��ȭ��ȣ</th>
			      <td width="80%" >
			       <select class="input-sm" name="phone1">
			        <option>010</option>
			        <option>011</option>
			        <option>017</option>
			       </select>
			       <input type="text" size=20 class="input-sm" name="phone2" id="phone2">
			      </td>
			     </tr>
			     <tr>
			      <th class="text-right" width="20%">�Ұ�</th>
			      <td width="80%">
			       <textarea rows="5" cols="70" name="content"></textarea>
			      </td>
			     </tr>
			     <tr>
			       <td colspan="2" class="text-center">
			        <input type="submit" value="ȸ������"
			         class="btn-sm btn-info" id="joinBtn"
			        >
			        <input type=button value="���"
			         class="btn-sm btn-warning"
			         onclick="javascript:history.back()"
			        >
			       </td>
			     </tr>
			    </table>
			    </form>
            </div>
        </div>
    </section>
<script>
	let joinApp=Vue.createApp({
		data(){
			return{
				userId:'',
				idOk:'',
				isReadOnly:false
			}	
		},
		methods:{
			idCheck(){
				if(this.userId===''){
					this.&refs.userId.focus()
					return
				}
				axios.get('../member/idcheck_vue.do',{
					params:{
						userId:this.userId
					}
				}).then(response=>{
					console.log(response.data)
					if(response.data==='0'){
						this.idOk='��� ������ ���̵��Դϴ�'
						this.isReadOnly=true
					}
					else{
						this.idOk='�̹� ������� ���̵��Դϴ�'		
					}
				}).catch(error=>{
					console.log(error.response)
				})
			}
		}
	}).mount('#joinApp')
</script>
</body>
</html>