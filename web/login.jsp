<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form action="loginout.kakao" method="post">
          <div class="form-group">
            <label for="exampleInputEmail1">ID</label>
            <input class="form-control" name="id" id="exampleInputEmail1" type="text" aria-describedby="emailHelp" placeholder="Enter ID">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input class="form-control" name="pwd" id="exampleInputPassword1" type="password" placeholder="Password">
          </div>
          <input class="btn btn-primary btn-block" type="submit" value="Login">
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="main.kakao?page=useradd">Register an Account</a>
        </div>
      </div>
    </div>