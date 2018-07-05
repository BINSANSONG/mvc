<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(document).ready(function() {
		$('input[type="button"]').click(function() {
			$('#register_form').attr('method', 'post');
			$('#register_form').attr('action', 'user.kakao?cmd=add');
			$('#register_form').submit();
		});
	});
</script>



<div class="card card-register mx-auto mt-5">
  <div class="card-header">ADD USER</div>
  <div class="card-body">
    <form id="register_form">
      <div class="form-group">
        <label for="exampleInputLastName">ID</label>
        <input class="form-control" id="exampleInputLastName" type="text" aria-describedby="nameHelp" placeholder="Enter ID" name="id">
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">NAME</label>
        <input class="form-control" id="exampleInputEmail1" type="text" aria-describedby="emailHelp" placeholder="Enter Name" name="name">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
        <input class="form-control" id="exampleInputPassword1" type="password" placeholder="Password" name="password">
      </div>
      <input class="btn btn-primary btn-block" type="button" value="Register">
    </form>
  </div>
</div>
