<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="card card-register mx-auto mt-5">
  <div class="card-header">ADD PRODUCT</div>
  <div class="card-body">
    <form action="product.kakao?cmd=add" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="exampleInputLastName">NAME</label>
        <input class="form-control" id="exampleInputLastName" type="text" aria-describedby="nameHelp" placeholder="Enter Name" name="name">
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">PRICE</label>
        <input class="form-control" id="exampleInputEmail1" type="number" aria-describedby="emailHelp" placeholder="Enter Price" name="price">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">IMG</label>
        <input class="form-control" id="exampleInputPassword1" type="file" placeholder="img.jpg" name="imgname">
      </div>
      <input class="btn btn-primary btn-block" type="button" value="Register">
    </form>
  </div>
</div>
