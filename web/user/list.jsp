<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<div class="card mb-3">
  <div class="card-header">
    <i class="fa fa-table"></i>
    PRODUCT LIST</div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>INDEX</th>
            <th>ID</th>
            <th>NAME</th>
          </tr>
        </thead>
        <tfoot>
          <tr>
            <th>INDEX</th>
            <th>ID</th>
            <th>NAME</th>
          </tr>
        </tfoot>
        <tbody>
          <c:forEach var="u" items="${userlist}">
          <tr>
          <td>${userlist.indexOf(u)+1}</td>
          <td><a href="user.kakao?cmd=detail&id=${u.id }">${u.id }</a></td>
          <td>${u.name}</td>
          </tr>
          </c:forEach>
        </tbody>

      </table>
    </div>
  </div>
  <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>
