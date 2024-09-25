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
</style>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=066af26b7f5590d48caebfdef148ce51&libraries=services"></script>
</head>
<body>
	<div class="container">
		<div class="row">	
			<table>
				<tr>
					<td class="text-center" v-for="img in images">
						<img src="'http://www.menupan.com'+img" style="width: 185px; height: 100px;">
					</td>
				</tr>	
			</table>
			<table class="table">
				<tr>
					<td width="30%" class="text-center" rowspan="8">
						<img src="'http://www.menupan.com'+vo.poster" style="width: 100%">
					</td>
					<td colspan="2">
						<h3>{{vo.name}}&nbsp;<span style="color:orange;">{{vo.score}}</span></h3>
					</td>
				</tr>
				<tr>
					<td class="text-right" width="15%">주소</td>
					<td width="55%">{{vo.address}}</td>
				</tr>
				<tr>
					<td class="text-right" width="15%">전화</td>
					<td width="55%">{{vo.type}}</td>
				</tr>
				<tr>
					<td class="text-right" width="15%">음식종류</td>
					<td width="55%">{{vo.parking}}</td>
				</tr>
				<tr>
					<td class="text-right" width="15%">주차</td>
					<td width="55%">{{vo.parking}}</td>
				</tr>
				<tr>
					<td class="text-right" width="15%">영업시간</td>
					<td width="55%">{{vo.time}}</td>
				</tr>
				<tr>
					<td class="text-right" width="15%">테마</td>
					<td width="55%">{{vo.theme}}</td>
				</tr>
			</table>
			<table class="table">
        <tr>
         <td>{{vo.content}}</td>
        </tr>
        <tr>
          <td class="text-right">
           <input type=button value="목록" class="btn-sm btn-primary"
            onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
    </div>
    <div style="height: 10px"></div>
    <div class="row">
      <div id="map" style="width:100%;height:350px;"></div>
    </div>
    <div style="height: 10px"></div>
    <div class="row">
    <h3>인근 맛집</h3>
    <hr>
     <table class="table">
        <tr>
          <td class="text-center" v-for="vo in house_images">
          <a :href="'detail.do?fno='+vo.fno+'&page='+page">
           <table class="table">
            <tr>
             <td class="text-center">
              <img :src="'http://www.menupan.com'+vo.poster" style="width:150px;height: 100px"
               :title="vo.address"
              >
             </td>
            </tr>
            <tr>
              <td class="text-center">{{vo.name}}</td>
            </tr>
           </table>
           
          </a>
          </td>
        </tr>
      </table>
    </div>
  </div>
<script>
	let detailApp=Vue.createApp({
		data(){
			return{
				vo:{},
				page:${page},
				fno:${fno},
				address:''
			}
		},
		mounted(){
			axios.get('detail_vue.do',{
				params:{
					fno:this.fno,
					page:this.page
				}
			}).then(response=>{
				console.log(response.data)
				this.vo=response.data.vo
				this.page=response.data.page
				this.fno=response.data.fno
				this.address=response.data.address
				this.images=response.data.vo.images
			}).catch(error=>{
				console.log(error.response)
			})
		},
		methods:{
			addScript(){
				const script=document.createElement("script")
				// <script></script>
				script.onload=()=>kakao.maps.load()
			},
			initMap(){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level: 3 // 지도의 확대 레벨
    			}		
    		}
    	}
	}).mount('.container')
</script>
</body>
</html>