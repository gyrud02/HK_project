<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"
    pageEncoding="UTF-8"%>
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/shop-homepage.css" rel="stylesheet">
<!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">All contents Copyright &copy; 2020 HKmall Inc. all rights reserved<br>
		Contact mail : <a href="#" id="CEOemail">admin@HKmall.com</a> / Tel : <a href="#">051-123-3334</a>
		/ Fax : <a href="#">051-123-3333</a>
      </p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
	$("#CEOemail").on("click", function(){
		
		window.open("../member/sendMail.jsp", "건의사항", "width=600, height=700");
		
	});

</script>