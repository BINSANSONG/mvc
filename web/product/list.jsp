<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  .pimg{
    width:150px;
    height: 120px;
  }
</style>

<div class="card mb-3">
  <div class="card-header">
    <i class="fa fa-table"></i>
    PRODUCT LIST</div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>REG DATE</th>
            <th>IMG</th>
          </tr>
        </thead>
        <tfoot>
          <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>REG DATE</th>
            <th>IMG</th>
          </tr>
        </tfoot>
        <tbody>
          <c:forEach var="u" items="${list}">
          <tr>
          <td>${u.id}</td>
          <td><a href="product.kakao?cmd=detail&id=${u.id}">${u.name}</a></td>
          <td>${u.price}</td>
          <td>${u.regdate}</td>
          <td><img class="pimg" alt="등록된 이미지가 없슴다" src="img/${u.imgname}"></td>
          </tr>
          </c:forEach>
        </tbody>

      </table>
    </div>
  </div>
  <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>
