<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#main_center{
		width:600px;
		height:400px;
		margin:0 auto;
		background:white;
		text-align: center;
	}
</style>
<script>
$(document).ready(function(){
	$('#userdelete_bt').click(function(){
		var c = confirm('삭제하시겠습니까?');
		if(c==true){
			location.href='user.kakao?cmd=delete&id=${userdetail.id}';
		}
	});
});

</script>

<div id="main_center">
<h1>User Detail</h1>
<h3>${userdetail.id }</h3>
<h3>${userdetail.pwd }</h3>
<h3>${userdetail.name }</h3>
<a id="userdelete_bt" href="#">DELETE</a>
<a href="user.kakao?cmd=update&id=${userdetail.id }">UPDATE</a>
</div>
