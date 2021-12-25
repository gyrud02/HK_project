<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body>
<title>HKmall : 댓글 작성</title>
	<%-- 댓글 창 --%>
<section id="contact">	
	<div class="column">
	<h3>Comment</h3>
	<form action="#" method="post">
		<div class="field half first">
			<label for="name">Name</label>
			<input name="name" id="name" type="text" placeholder="Name">
		</div>
		<div class="field half">
			<label for="email">Email</label>
			<input name="email" id="email" type="email" placeholder="Email">
		</div>
		<div class="field">
			<label for="message">Message</label>
			<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
		</div>
		<ul class="actions">
			<li><input value="Send Message" class="button" type="submit"></li>
		</ul>
	</form>
</div>
</section>	
</body>
</html>								