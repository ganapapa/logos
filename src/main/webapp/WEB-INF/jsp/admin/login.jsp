<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	
<title>Jay's Admin</title>

<%@ include file="/WEB-INF/include/admin-header.jspf" %>

<style>
  body{background:url("/admin/img/log_bg.gif");}
</style>

</head>

<body>

<script type="text/javascript">
	$(document).ready(function(){
		$("#loginForm input[name=userID]").focus();
		if (getCookie("A_ALI") != "") {
			$("#loginForm input[name=saveId]").attr("checked", true);
			$("#loginForm input[name=userID]").val(getCookie("A_ALI"));
			$("#loginForm input[name=password]").focus();
		}

		$(".submit").keydown(function(e) {
			if (e.keyCode == 13) {
				e.preventDefault();
				login();
			}
		});
	});

	function login(){
		if ($("#loginForm input[name=userID]").val() == "") {
			$("#loginForm input[name=userID]").focus();
			alert("아이디를 입력하세요.");
			return;
		}
		if ($("#loginForm input[name=password]").val() == "") {
			$("#loginForm input[name=password]").focus();
			alert("비밀번호를 입력하세요.");
			return;
		}

		//gSubmitPost("loginForm");
		loginForm.submit();
	}
</script>
<form method="post" id="loginForm" action="j_spring_security_check">
	<input type="hidden" name="redirectUrl" value="$!esc.html($!redirectUrl)"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

	<div class="log_body" style="height:100%;">
		<div style="display:none;">
			<ul>
				<li><a href="#p_head">로고</a></li>
				<li><a href="#main_menu">메인메뉴</a></li>
				<li><a href="#quick_menu">퀵메뉴</a></li>
				<li><a href="#left_menu">레프트메뉴</a></li>
				<li><a href="#content">내용</a></li>
			</ul>
		</div>
		<div class="log_box">
			<div class="sys_logo"><a href="$contentRoot"><img src="/admin/img/topLogo.png" alt="Gana's com" /></a></div>
			<div class="sys_text"><h3>Contents Management System</h1></div>
			<div class="login_box">
				<div class="loging_title"><img src="/admin/img/login_title.gif" alt="LOGIN" /></div>
				<table cellpadding="0" cellspacing="0" style="margin-left:33px;">
					<tr>
						<td><img src="/admin/img/title_id.gif" alt="아이디" /></td>
						<td><input type="userID" id="userID" name="userID" class="login_input submit" style="width:206px; height:22px;ime-mode:disabled" tabindex="1" /></td>
						<td width="13" rowspan="3"></td>
						<td rowspan="3"><a href="javascript:login()" tabindex="3"><img src="/admin/img/btn_login.gif" alt="로그인" /></a></td>
					</tr>
					<tr><td height="10px"></td></tr>
					<tr>
						<td><img src="/admin/img/title_pw.gif" alt="비밀번호" /></td>
						<td><input type="password" id="password" name="password" class="login_input submit" style="width:206px; height:22px;" tabindex="2" /></td>
					</tr>
					<tr><td height="15px"></td></tr>
					<tr>
						<td></td>
						<td style="color:#4C4C4C;"><input type="checkbox" name="saveId" id="saveId" value="Y" /> <label for="saveId">아이디 기억하기</label></td>
					</tr>
					<tr><td height="47px"></td></tr>
					
				</table>
			</div>
			<div class="login_btn">
				이곳은 관리자를 위한 영역입니다. 허가되지 않은 사용자의 접속 및 자료유출, 정보취득, 정보변경 등에 대한<br />
				법적책임과 처벌을 받을 수 있습니다. 문의 : 010-1234-5678 
			</div>
		</div>
		<div class="copy">Copyright©Gana's company. All rights reserved.</div>
	</div>
</form>

</body>
</html>