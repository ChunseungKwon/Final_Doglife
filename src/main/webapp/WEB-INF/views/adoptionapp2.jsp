<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>adoptionapp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/headercss.css">

<script type="text/javascript">
var id = "${memberId}";
	var type = "${memberType}";
	$(function() {
		console.log(id);
		if (id == "") {
			$(".suc").css("display", "inline-block");
			$(".bef").css("display", "none");
			$(".mypage").css("display", "none");
			$(".seller").css("display", "none");
			$(".admin").css("display", "none");
		} else if (id != "" && type == 1) {
			$(".suc").css("display", "none");
			$(".bef").css("display", "inline-block");
			$(".mypage").css("display", "inline-block");
			$(".seller").css("display", "none");
			$(".admin").css("display", "none");
		}
		else if (id != "" && type == 2) {
			$(".suc").css("display", "none");
			$(".bef").css("display", "inline-block");
			$(".mypage").css("display", "none");
			$(".seller").css("display", "inline-block");
			$(".admin").css("display", "none");
		}
		else if (id != "" && type == 3) {
			$(".suc").css("display", "none");
			$(".bef").css("display", "inline-block");
			$(".mypage").css("display", "none");
			$(".seller").css("display", "none");
			$(".admin").css("display", "inline-block");
		};

		//메시지 출력 부분
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}

	});
</script>

<style type="text/css">
section {
	width: 1240px;
	margin: 0 auto;
}

.contain1 {
	width: 1240px;
	margin: 0 auto;
	position: relative;
}

.photo_wrap {
	width: 500px;
	height: 500px;
	display: inline-block;
	vertical-align: top;
}

.contain1_photo {
	width: 450px;
	height: 380px;
	margin: 0 auto;
	border: 1px solid #e0e0e0;
	text-align: center;
}

.preview_big_exist {
	width: 420px;
	height: 350px;
	margin: 13px;
	opacity: 1;
}

.preview_big_nothing {
	width: 120px;
	height: 120px;
	margin: 25% 0;
	opacity: 0.4;
}

.contain1_photo_thumbnail {
	display: flex;
	justify-content: space-between;
	width: 450px;
	height: 100px;
	margin: 10px auto;
}

.contain1_photo_thumbnail>div {
	border: 1px solid #e0e0e0;
	width: 100px;
	height: 100px;
	text-align: center;
}

.thumbnail_img_exist {
	width: 80px;
	height: 80px;
	margin-top: 8px;
	opacity: 1;
}

.thumbnail_img_nothing {
	width: 60px;
	height: 60px;
	margin-top: 17px;
	opacity: 0.4;
}

.contain1_product_title {
	width: 670px;
	height: 500px;
	display: inline-block;
	margin-left: 60px;
}

.contain1_product_title .title {
	width: 130px;
	display: inline-block;
}

.contain1_product_title>div>input {
	width: 400px;
	height: 34px;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 15px;
	background: #f9f4f0;
	border: none;
}

.contain1_product_title>div>select {
	width: 400px;
	height: 34px;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 15px;
	background: #f9f4f0;
	border: none;
}

.contain2 {
	width: 1240px;
	margin: 0 auto;
}

.filebox {
	width: 1240px;
	margin: 0 auto;
	position: relative;
}

.contain1_product_title_option1 {
	position: relative;
}

.contain1_product_title_option1 title {
	position: absolute;
	text-align: center;
	display: inline-block;
}

.contain1_product_title_option1 .list {
	padding-left: 94px;
}

.contain1_product_title_option2 {
	position: relative;
}

.contain1_product_title_option2 title {
	position: absolute;
	text-align: center;
	display: inline-block;
}

.contain1_product_title_option2 .list {
	padding-left: 94px;
}

.contain1_product_title_option1 input {
	width: 400px;
	height: 34px;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 15px;
	background: #f9f4f0;
	border: none;
	display: inline-block;
}

.contain1_product_title_option2 input {
	width: 400px;
	height: 34px;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 15px;
	background: #f9f4f0;
	border: none;
	display: inline-block;
}

.buttonwrap {
	margin: 0 auto;
	width: 100px;
}

.adoptionInfo {
	position: relative;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	<section style="margin-top: 20px;">

		<form method="post" action="./adoptionapp3" 
			enctype="multipart/form-data" onsubmit="return check();" >
			<div class="contain1">
				<div class="photo_wrap">

					<div class="contain1_photo">
						<img class="preview_big_exist" id="preview_big"
							src="./resources/upload/${ddList.thumbnailsys}">
					</div>

					<div class="contain1_photo_thumbnail">
						<c:if test="${!empty dpList}">
							<c:forEach var="dp" items="${dpList}" varStatus="a">

								<c:choose>
									<c:when test="${fn:contains(dp.oriname,'.jpg')}">
										<div>
											<img class="thumbnail_img_exist" id="preview_thumb${a.index}"
												src="resources/upload/${dp.sysname}">
										</div>
									</c:when>
									<c:when test="${fn:contains(dp.oriname,'.png')}">
										<div>
											<img class="thumbnail_img_exist" id="preview_thumb${a.index}"
												src="resources/upload/${dp.sysname}">
										</div>
									</c:when>
									<c:when test="${fn:contains(dp.oriname,'.gif')}">
										<div>
											<img class="thumbnail_img_exist" id="preview_thumb${a.index}"
												src="resources/upload/${dp.sysname}">
										</div>
									</c:when>
									<c:otherwise>미리보기 없음</c:otherwise>
								</c:choose>


							</c:forEach>
						</c:if>
					</div>
				</div>


				<%-- end : photo_wrap --%>


				<div class="contain1_product_title">
					<div>
						<input type="hidden" name="dogNum" value="${ddList.dogNum}">
						<span class="title" style="letter-spacing: 24px">이름</span> :
						&nbsp; <input type="text" name="dogName" id="poption"
							value="${ddList.dogName}" readonly>
					</div>
					<hr>
					<div class="contain1_product_title_option1">

						<div>
							<span class="title" style="letter-spacing: 24px">나이</span> :
							&nbsp; <input type="text" name="dogAge" id="poption"
								value="${ddList.dogAge}" readonly>
						</div>
						<div>
							<span class="title" style="letter-spacing: 24px">성별</span> :
							&nbsp; <input type=text name="dogGender" id="choiceA"
								value="${ddList.dogGender}" readonly>
						</div>
						<div>
							<span class="title" style="letter-spacing: 24px">품종</span> :
							&nbsp; <input type=text name="dogBreed" id="choiceB"
								value="${ddList.dogBreed}" readonly>
						</div>
						<div>
							<span class="title" style="letter-spacing: 5px">예방정접여부</span> :
							&nbsp; <input type=text name="dogVaccine" id="choiceC"
								value="${ddList.dogVaccine}" readonly>
						</div>
						<div>
							<span class="title" style="letter-spacing: 24px">가격</span> :
							&nbsp; <input type=text name="dogPrice" id="choiceC"
								value="${ddList.dogPrice}" readonly>
						</div>
					</div>
				</div>
			</div>

			<hr class="hr">

			<div class="adoptionInfo">
				<span>입양 신청자 정보</span>
				<div class="body-2">
					<div class="contain1_product_title_option1">
						<!-- 입양신청정보 리스트 -->
						<div class="body-2-1-1">
							<input type="hidden" name="memberId" value="${memberId}">
						</div>
						<div>
							<span class="title" style="display:inline-block; width: 100px;letter-spacing: 24px">이름</span> :
							&nbsp; <input type="text" name="aaName" id="aaName" required>
						</div>
						<!-- 이름 -->
						<div>
							<span class="title" style="display:inline-block; width: 100px;letter-spacing: 24px">주소</span> :
							&nbsp; <input type="text" name="aaAddress" id="aaAddress" required>
						</div>
						<!-- 주소 -->
						<div>
							<span class="title" style="display:inline-block; width: 100px;letter-spacing: 12px">연락처</span> :
							&nbsp; <input type="text" name="aaPnum" id="aaPnum" required>
						</div>
						<!-- 연락처 -->
					</div>
				</div>
			</div>
			<hr class="hr">
			<span>동의 여부 질문</span>
			<div class="body-2">
				<div>모든 가족 구성원과 합의는 되어 있습니까?</div>
				<div style="font-weight: bold;">
					<input id="ck" type="checkbox" title="첫번째 체크박스" value="1">동의합니다
				</div>
				<div>반려견은 10~15년 이상, 길면 20년 이상 삽니다. 결혼, 임신, 유학, 이사 등으로 가정환경이 바뀌어도 끝까지 책임지고 보살피겠다는 결심이 섰습니까?</div>
				<div style="font-weight: bold;">
					<input id="ck" type="checkbox" title="두번째 체크박스" value="2">동의합니다
				</div>
				<div>먹이뿐만 아니라 관리, 치료, 중성화 시술, 훈련 등에 들어가는 경제적 부담을 짊어질 의사와 능력이 있습니까?</div>
				<div style="font-weight: bold;">
					<input id="ck" type="checkbox" title="세번째 체크박스" value="3">동의합니다
				</div>
				<div style="font-weight: bold;">
					<input id="allCk" type="checkbox">전체 동의
				</div>
			</div>

			<hr class="hr">
			<c:if test ="${!empty memberId}">
			<div class="buttonwrap">
				<input style="height: 30px" type="submit" value="입양신청">
			</div>
			</c:if>
			<div class="buttonwrap">
				<input style="height: 30px" type="hidden" value="입양신청">
			</div>	
		</form>
	</section>

</body>

<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-size: 16px;
	font-family: "SF Pro KR", "SF Pro Text", "Yoon Gothic", "Myriad Set Pro",
		system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI",
		"SF Pro Icons", "Apple Legacy Icons", "Apple Gothic", "HY Gulim",
		"MalgunGothic", "HY Dotum", "Lexi Gulim", "Helvetica Neue",
		"Helvetica", "Arial", sans-serif;
	font-size: 16px;
}

.body {
	display: grid;
	grid-template-columns: 45fr 55fr;
}

.hr {
	margin: 20px auto;
}

.body-1 {
	align-items: center;
	margin: auto 15px;
	min-width: 300px;
}

.body-1>.body-1-1 {
	margin-top: 15px;
}

.box-1 {
	text-align: center;
	border: 1px solid;
	border-radius: 10px;
	min-height: 300px;
}

.box-2 {
	text-align: center;
	display: flex;
	margin-top: 10px;
	flex: auto;
	width: 100%;
	justify-content: space-evenly;
}

.box-3 {
	border: 1px solid;
	border-radius: 10px;
	height: 70px;
	width: 70px;
}

.body-2 {
	
	border-radius: 10px;
	min-height: 150px;
	margin-top: 20px;
}

.body-2-1-1 {
	margin: 15px 15px;
}

.body-3 {
	position: absolute;
	border: 1px solid;
	border-radius: 10px;
	min-height: 150px;
	margin-top: 20px;
	width: 100%;
	min-width: 300px;
}

.body-3>#ck1 {
	float: left;
}
</style>
<script type="text/javascript">
	var checkedall = false;

	$('#allCk').click(function() {
		checkedall = $('#allCk').is(':checked');
		console.log(checkedall);
		if (checkedall) {
			$('input:checkbox').prop('checked', true);
			checkedall = true;
		} else {
			$('input:checkbox').prop('checked', false);
			checkedall = false;
		}

	});
	$("input[id=ck]").click(function() {
		var total = $("input[id=ck]").length;
		var checked = $("input[id=ck]:checked").length;

		if (total != checked) {
			$("#allCk").prop("checked", false);
			checkedall = false;
		} else {
			$("#allCk").prop("checked", true);
			checkedall = true;
		}
		console.log(checked);
	});


	$(".contain1_photo_thumbnail").find("img").on("click", function() {
		if ($(this).attr("src") != "./resources/images/no_image.png") {
			$("#preview_big").attr("src", $(this).attr("src"));
		}
	});

	function imgPreview(file) {
		var fileList = $(file)[0].files;
		console.log('fileList.count=' + fileList.length);

		if (fileList[0] != null) {
			var reader = new FileReader();
			reader.readAsDataURL(fileList[0]);
			reader.onload = function() {
				let imgResult = reader.result;
				$("#preview_big").attr("src", imgResult);
				$("#preview_big").removeClass("preview_big_nothing");
				$("#preview_big").addClass("preview_big_exist");

				$("#preview_thumb0").attr("src", imgResult);
				$("#preview_thumb0").removeClass("thumbnail_img_nothing");
				$("#preview_thumb0").addClass("thumbnail_img_exist");
			};
		} else {
			$("#preview_big").attr("src", "./resources/images/no_image.png");
			$("#preview_big").removeClass("preview_big_exist");
			$("#preview_big").addClass("preview_big_nothing");

			$("#preview_thumb0").attr("src", "./resources/images/no_image.png");
			$("#preview_thumb0").removeClass("thumbnail_img_exist");
			$("#preview_thumb0").addClass("thumbnail_img_nothing");

		}
		if (fileList[1] != null) {
			var reader1 = new FileReader();
			reader1.readAsDataURL(fileList[1]);
			reader1.onload = function() {
				let imgResult = reader1.result;
				$("#preview_thumb1").attr("src", imgResult);
				$("#preview_thumb1").removeClass("thumbnail_img_nothing");
				$("#preview_thumb1").addClass("thumbnail_img_exist");
			};
		} else {
			$("#preview_thumb1").attr("src", "./resources/images/no_image.png");
			$("#preview_thumb1").removeClass("thumbnail_img_exist");
			$("#preview_thumb1").addClass("thumbnail_img_nothing");
		}

		if (fileList[2] != null) {
			var reader2 = new FileReader();
			reader2.readAsDataURL(fileList[2]);
			reader2.onload = function() {
				let imgResult = reader2.result;
				$("#preview_thumb2").attr("src", imgResult);
				$("#preview_thumb2").removeClass("thumbnail_img_nothing");
				$("#preview_thumb2").addClass("thumbnail_img_exist");
			};
		} else {
			$("#preview_thumb2").attr("src", "./resources/images/no_image.png");
			$("#preview_thumb2").removeClass("thumbnail_img_exist");
			$("#preview_thumb2").addClass("thumbnail_img_nothing");
		}

		if (fileList[3] != null) {
			var reader3 = new FileReader();
			reader3.readAsDataURL(fileList[3]);
			reader3.onload = function() {
				let imgResult = reader3.result;
				$("#preview_thumb3").attr("src", imgResult);
				$("#preview_thumb3").removeClass("thumbnail_img_nothing");
				$("#preview_thumb3").addClass("thumbnail_img_exist");
			};
		} else {
			$("#preview_thumb3").attr("src", "./resources/images/no_image.png");
			$("#preview_thumb3").removeClass("thumbnail_img_exist");
			$("#preview_thumb3").addClass("thumbnail_img_nothing");
		}
	}
	
	function check() {

		if (checkedall == false) {
			alert("전체 동의를 체크 해주세요.");
			return false;//submit 실행 막기
		}

		return true;//모든 칸이 다 채워졌고, 중복 체크도 한 상태
		
	}
	

</script>
</html>