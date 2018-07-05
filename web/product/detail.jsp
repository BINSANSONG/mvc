<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	#main_center{
		width:600px;
		height:400px;
		margin:0 auto;
		background:white;
		text-align: center;
	}
	img{
		width:200px;
		height:180px;
	}
</style>
<script>
$(document).ready(function(){
	$('#productdelete_bt').click(function(){
		var c = confirm('삭제하시겠습니까?');
		if(c==true){
			location.href='product.kakao?cmd=delete&id=${pdetail.id}';
		}
	});
});

</script>





<div class="mb-0 mt-4">
            <i class="fa fa-newspaper-o"></i> Product Detail</div>


<div class="card mb-3">

  <img class="card-img-top img-fluid w-100" src="img/${pdetail.imgname}" alt="등록된 이미지가 없슴다">

    <div class="card-body">
      <h6 class="card-title mb-1">
        NAME : ${pdetail.name }
      </h6>
    </div>
    <hr class="my-0">
      <div class="card-body py-2 small">PRICE : ${pdetail.price }</div>
      <hr class="my-0">
        <div class="card-body small bg-faded">REGISTER DATE : ${pdetail.regdate }</div>
      </div>
      <a id="productdelete_bt" href="#">DELETE</a>
      <a href="product.kakao?cmd=update&id=${pdetail.id }">UPDATE</a>
