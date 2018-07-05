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

<div id="main_center">
<h1>User Update</h1>
<form action="user.kakao?cmd=updateimpl" method="post">
ID : ${userupdate.id } <br>
<input type="hidden" name="id" value="${userupdate.id }">
PWD<input type="password" name="pwd" 
value="${userupdate.pwd }"><br>
NAME<input type="text" name="name" 
value="${userupdate.name }"><br>
<input type="submit" value="update"><br>
</form>
</div>  