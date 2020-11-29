<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	
	<title>Truth Coffee</title>
	<meta content="coffee" name="description">
    <meta content="coffee" name="keywords">
    <%@ include file="/WEB-INF/include/include-header.jspf" %>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript"> 
	  function initialize() {
		  var Y_point   = 35.197119; //위도
		  var X_point   = 129.106004;//경도
		  var zoomLevel = 16;                //숫자가 클수록 확대
	      var markerTitle		= "Truth Coffee";
	      var markerMaxWidth	= 300; //말풍선 최대크기
	      
	      var contentString	= '<div>' +
							    '<h2>Truth Coffee</h2>'+
							    '<p>Truth Coffee 는 한 잔의 커피에도 진실함을 담고자 애씁니다.<br />' +
					            '잊지못할 커피의 추억을 선물하겠습니다.</p>' +
							  '</div>';
	      var myLatlng = new google.maps.LatLng(Y_point, X_point);
		  var mapOptions = {
							zoom: zoomLevel,
							center: myLatlng,
							mapTypeId: google.maps.MapTypeId.ROADMAP
		  }
		  var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);
  		  var marker = new google.maps.Marker({
												position: myLatlng,
												map: map,
												title: markerTitle
		  });
          var infowindow = new google.maps.InfoWindow({
														content: contentString,
														maxWidth: markerMaxWidth
													  }
		  );

		  google.maps.event.addListener(marker, 'click', function() {
		    infowindow.open(map, marker);
		  });
	  }
	</script>
</head>

<body onload="initialize()">
  <!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-phone"></i> +82 010 7777 8888
        <span class="d-none d-lg-inline-block"><i class="icofont-clock-time icofont-rotate-180"></i> Mon-Sat: 10:00 AM - 18:00 PM</span>
      </div>
      <div class="languages">
        <ul>
          <li>Ko</li>
          <li><a href="#">En</a></li>
        </ul>
      </div>
    </div>
  </div>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto">
        <a href="#" onclick="fn_showHome(); return false;">Truth Coffee</a>
      </h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="cf_main.jsp" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="#" onclick="fn_showHome(); return false;">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#menu">Coffee Beans</a></li>
          <li><a href="#specials">Specials</a></li>
          <li><a href="#events">Events</a></li>
          <li><a href="#gallery">Gallery</a></li>
          <li><a href="#chefs">Baristars</a></li>
          <li><a href="#contact">Contact</a></li>
          <li class="book-a-table text-center"><a href="#book-a-table">견적상담</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container position-relative text-center text-lg-left" data-aos="zoom-in" data-aos-delay="100">
      <div class="row">
        <div class="col-lg-8">
          <h1>Welcome to <span>Truth Coffee</span></h1>
          <h2>Delivering great coffee for everyone!</h2>

          <div class="btns">
            <a href="#menu" class="btn-menu animated fadeInUp scrollto">Beans</a>
            <a href="#book-a-table" class="btn-book animated fadeInUp scrollto">Purchase Book</a>
          </div>
        </div>
        <div class="col-lg-4 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="200">
          <a href="https://www.youtube.com" class="venobox play-btn" data-vbtype="video" data-autoplay="true"></a>
        </div>

      </div>
    </div>
  </section><!-- End Hero -->
  
  <main id="main">

  <!-- ======= About Section ======= -->
  <section id="about" class="about">
    <div class="container" data-aos="fade-up">

      <div class="row">
        <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
          <div class="about-img">
            <img src="<c:url value='/bootstrap/assets/img/coffee_beans03_1280.jpg'/>" alt="">
          </div>
        </div>
        <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
          <h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
          <p class="font-italic">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
            magna aliqua.
          </p>
          <ul>
            <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
            <li><i class="icofont-check-circled"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
            <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
          </ul>
          <p>
            Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
            velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
            culpa qui officia deserunt mollit anim id est laborum
          </p>
        </div>
      </div>

    </div>
  </section><!-- End About Section -->
  
  <!-- ======= Why Us Section ======= -->
  <section id="why-us" class="why-us">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>Why</h2>
        <p>Why Choose Our Coffee</p>
      </div>

      <div class="row">

        <div class="col-lg-4">
          <div class="box" data-aos="zoom-in" data-aos-delay="100">
            <span>01</span>
            <h4>Lorem Ipsum</h4>
            <p>Ulamco laboris nisi ut aliquip ex ea commodo consequat. Et consectetur ducimus vero placeat</p>
          </div>
        </div>

        <div class="col-lg-4 mt-4 mt-lg-0">
          <div class="box" data-aos="zoom-in" data-aos-delay="200">
            <span>02</span>
            <h4>Repellat Nihil</h4>
            <p>Dolorem est fugiat occaecati voluptate velit esse. Dicta veritatis dolor quod et vel dire leno para dest</p>
          </div>
        </div>

        <div class="col-lg-4 mt-4 mt-lg-0">
          <div class="box" data-aos="zoom-in" data-aos-delay="300">
            <span>03</span>
            <h4> Ad ad velit qui</h4>
            <p>Molestiae officiis omnis illo asperiores. Aut doloribus vitae sunt debitis quo vel nam quis</p>
          </div>
        </div>

      </div>

    </div>
  </section><!-- End Why Us Section -->
  
  <!-- ======= Menu Section ======= -->
  <section id="menu" class="menu section-bg">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>Beans</h2>
        <p>Check Our Fresh Beans</p>
      </div>

      <div class="row" data-aos="fade-up" data-aos-delay="100">
        <div class="col-lg-12 d-flex justify-content-center">
          <ul id="menu-flters">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-starters">Beginner</li>
            <li data-filter=".filter-salads">Intermediate</li>
            <li data-filter=".filter-specialty">Specialty</li>
          </ul>
        </div>
      </div>

      <div class="row menu-container" data-aos="fade-up" data-aos-delay="200">

        <div class="col-lg-6 menu-item filter-starters">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_yirgachffe.png'/>" alt="">
          <div class="menu-content">
            <a href="#">예가체프</a><span>$5.95</span>
          </div>
          <div class="menu-ingredients">
                        중간 바디감에 감귤향, 초콜릿향
          </div>
        </div>

        <div class="col-lg-6 menu-item filter-specialty">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_kona.png'/>" alt="">
          <div class="menu-content">
            <a href="#">하와이언 코나</a><span>$6.95</span>
          </div>
          <div class="menu-ingredients">
                        깔끔한 뒷맛과 가볍고 섬세함
          </div>
        </div>

        <div class="col-lg-6 menu-item filter-starters">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_arabica.png'/>" alt="">
          <div class="menu-content">
            <a href="#">과테말라 안티구아</a><span>$7.95</span>
          </div>
          <div class="menu-ingredients">
            A delicate crab cake served on a toasted roll with lettuce and tartar sauce
          </div>
        </div>

        <div class="col-lg-6 menu-item filter-salads">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_robusta.png'/>" alt="">
          <div class="menu-content">
            <a href="#">산토스</a><span>$8.95</span>
          </div>
          <div class="menu-ingredients">
            Lorem, deren, trataro, filede, nerada
          </div>
        </div>

        <div class="col-lg-6 menu-item filter-specialty">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_bluemt.png'/>" alt="">
          <div class="menu-content">
            <a href="#">자메이카 블루마운틴</a><span>$9.95</span>
          </div>
          <div class="menu-ingredients">
            Grilled chicken with provolone, artichoke hearts, and roasted red pesto
          </div>
        </div>

        <div class="col-lg-6 menu-item filter-starters">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_tarrazu.png'/>" alt="">
          <div class="menu-content">
            <a href="#">코스타리카 따라주</a><span>$4.95</span>
          </div>
          <div class="menu-ingredients">
            Lorem, deren, trataro, filede, nerada
          </div>
        </div>

        <div class="col-lg-6 menu-item filter-salads">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_colombia.png'/>" alt="">
          <div class="menu-content">
            <a href="#">콜롬비아 마일드</a><span>$9.95</span>
          </div>
          <div class="menu-ingredients">
            Fresh spinach, crisp romaine, tomatoes, and Greek olives
          </div>
        </div>

        <div class="col-lg-6 menu-item filter-salads">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_peaberry.png'/>" alt="">
          <div class="menu-content">
            <a href="#">탄자니아 피베리</a><span>$9.95</span>
          </div>
          <div class="menu-ingredients">
            Fresh spinach with mushrooms, hard boiled egg, and warm bacon vinaigrette
          </div>
        </div>

        <div class="col-lg-6 menu-item filter-specialty">
          <img class="menu-img" src="<c:url value='/bootstrap/assets/img/beans/bean_mocha.png'/>" alt="">
          <div class="menu-content">
            <a href="#">예멘 모카</a><span>$12.95</span>
          </div>
          <div class="menu-ingredients">
            Plump lobster meat, mayo and crisp lettuce on a toasted bulky roll
          </div>
        </div>

      </div>

    </div>
  </section><!-- End Menu Section -->
  <!-- ======= Specials Section ======= -->
    <section id="specials" class="specials">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Specials</h2>
          <p>Check Our Specials</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-toggle="tab" href="#tab-1">Modi sit est</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-2">Unde praesentium sed</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-3">Pariatur explicabo vel</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-4">Nostrum qui quasi</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-5">Iusto ut expedita aut</a>
              </li>
            </ul>
          </div>
          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Architecto ut aperiam autem id</h3>
                    <p class="font-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. </p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="<c:url value='/bootstrap/assets/img/specials-1.png'/>" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-2">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Et blanditiis nemo veritatis excepturi</h3>
                    <p class="font-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    <p>Ea ipsum voluptatem consequatur quis est. Illum error ullam omnis quia et reiciendis sunt sunt est. </p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="<c:url value='/bootstrap/assets/img/specials-2.png'/>" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-3">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Impedit facilis occaecati odio neque aperiam sit</h3>
                    <p class="font-italic">Eos voluptatibus quo. Odio similique illum id quidem non enim fuga. Qui natus non sunt dicta dolor et. </p>
                    <p>Iure officiis odit rerum. Harum sequi eum illum corrupti culpa veritatis quisquam. Neque necessitatibus illo rerum eum ut. </p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="<c:url value='/bootstrap/assets/img/specials-3.png'/>" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-4">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                    <p class="font-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                    <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. </p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="<c:url value='/bootstrap/assets/img/specials-4.png'/>" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-5">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Est eveniet ipsam sindera pad rone matrelat sando reda</h3>
                    <p class="font-italic">Omnis blanditiis saepe eos autem qui sunt debitis porro quia.</p>
                    <p>Exercitationem nostrum omnis. Ut reiciendis repudiandae minus.</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="<c:url value='/bootstrap/assets/img/specials-5.png'/>" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Specials Section -->

    <!-- ======= Events Section ======= -->
    <section id="events" class="events">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Events</h2>
          <p>Organize Your Events in our Shop</p>
        </div>

        <div class="owl-carousel events-carousel" data-aos="fade-up" data-aos-delay="100">

          <div class="row event-item">
            <div class="col-lg-6">
              <img src="<c:url value='/bootstrap/assets/img/event-birthday.jpg'/>" alt="" class="img-fluid">
            </div>
            <div class="col-lg-6 pt-4 pt-lg-0 content">
              <h3>Birthday Parties</h3>
              <div class="price">
                <p><span>$189</span></p>
              </div>
              <p class="font-italic">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                magna aliqua.
              </p>
              <ul>
                <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                <li><i class="icofont-check-circled"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
              </ul>
              <p>
                Ullamco laboris nisi ut aliquip ex ea commodo consequat.
                velit esse cillum dolore eu fugiat nulla pariatur
              </p>
            </div>
          </div>

          <div class="row event-item">
            <div class="col-lg-6">
              <img src="<c:url value='/bootstrap/assets/img/event-private.jpg'/>" alt="" class="img-fluid">
            </div>
            <div class="col-lg-6 pt-4 pt-lg-0 content">
              <h3>Private Parties</h3>
              <div class="price">
                <p><span>$290</span></p>
              </div>
              <p class="font-italic">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                magna aliqua.
              </p>
              <ul>
                <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                <li><i class="icofont-check-circled"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
              </ul>
              <p>
                Ullamco laboris nisi ut aliquip ex ea commodo consequat.
                velit esse cillum dolore eu fugiat nulla pariatur
              </p>
            </div>
          </div>

          <div class="row event-item">
            <div class="col-lg-6">
              <img src="<c:url value='/bootstrap/assets/img/event-custom.jpg'/>" alt="" class="img-fluid">
            </div>
            <div class="col-lg-6 pt-4 pt-lg-0 content">
              <h3>Custom Parties</h3>
              <div class="price">
                <p><span>$99</span></p>
              </div>
              <p class="font-italic">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, dolore
                magna aliqua.
              </p>
              <ul>
                <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip.</li>
                <li><i class="icofont-check-circled"></i> Duis aute irure dolor in velit.</li>
                <li><i class="icofont-check-circled"></i> Ullamco laboris nisi ut consequat.</li>
              </ul>
              <p>
                Ullamco laboris nisi ut aliquip ex ea commodo consequat.
                velit esse cillum dolore eu fugiat nulla pariatur
              </p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Events Section -->

    <!-- ======= Book A Table Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Reservation</h2>
          <p>Book a Table</p>
        </div>
        
        <!-- button id로 이벤트 처리하기 -->
        <form class="php-email-form" name="emailForm" data-aos="fade-up" data-aos-delay="100">
          <div class="form-row">
            <div class="col-lg-4 col-md-6 form-group">
              <input type="text" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group">
              <input type="email" class="form-control" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group">
              <input type="text" class="form-control" id="phone" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group">
              <input type="text" class="form-control" id="date" placeholder="Date" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group">
              <input type="text" class="form-control" id="time" placeholder="Time" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              <div class="validate"></div>
            </div>
            <div class="col-lg-4 col-md-6 form-group">
              <input type="number" class="form-control" id="people" placeholder="# of people" data-rule="minlen:1" data-msg="Please enter at least 1 chars">
              <div class="validate"></div>
            </div>
          </div>
          <div class="form-group">
            <textarea class="form-control" id="message" rows="5" placeholder="Message"></textarea>
            <div class="validate"></div>
          </div>
          <div class="mb-3">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your booking request was sent. We will call back or send an Email to confirm your reservation. Thank you!</div>
          </div>
          <div class="text-center"><button id="booking">Book a Table</button></div>
        </form>

      </div>
    </section><!-- End Book A Table Section -->

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Testimonials</h2>
          <p>What they're saying about us</p>
        </div>

        <div class="owl-carousel testimonials-carousel" data-aos="zoom-in" data-aos-delay="100">

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Proin iaculis purus consequat sem cure digni ssim donec, risus at semper.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<c:url value='/bootstrap/assets/img/testimonials/testimonials-1.jpg'/>" class="testimonial-img" alt="">
            <h3>Seo Jay</h3>
            <h4>Ceo &amp; Founder</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<c:url value='/bootstrap/assets/img/testimonials/testimonials-2.jpg'/>" class="testimonial-img" alt="">
            <h3>Youn youngchul</h3>
            <h4>Paster</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<c:url value='/bootstrap/assets/img/testimonials/testimonials-3.jpg'/>" class="testimonial-img" alt="">
            <h3>Jena Karlis</h3>
            <h4>Store Owner</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<c:url value='/bootstrap/assets/img/testimonials/testimonials-4.jpg'/>" class="testimonial-img" alt="">
            <h3>Matt Brandon</h3>
            <h4>Freelancer</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<c:url value='/bootstrap/assets/img/testimonials/testimonials-5.jpg'/>" class="testimonial-img" alt="">
            <h3>John Larson</h3>
            <h4>Entrepreneur</h4>
          </div>

        </div>

      </div>
    </section><!-- End Testimonials Section -->

    <!-- ======= Gallery Section ======= -->
    <section id="gallery" class="gallery">

      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Gallery</h2>
          <p>Some photos from Our Shop</p>
        </div>
      </div>

      <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

        <div class="row no-gutters">

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="<c:url value='/bootstrap/assets/img/gallery/gallery-1.jpg'/>" class="venobox" data-gall="gallery-item">
                <img src="<c:url value='/bootstrap/assets/img/gallery/gallery-1.jpg'/>" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="assets/img/gallery/gallery-2.jpg" class="venobox" data-gall="gallery-item">
                <img src="<c:url value='/bootstrap/assets/img/gallery/gallery-2.jpg'/>" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="<c:url value='/bootstrap/assets/img/gallery/gallery-3.jpg'/>" class="venobox" data-gall="gallery-item">
                <img src="<c:url value='/bootstrap/assets/img/gallery/gallery-3.jpg'/>" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="<c:url value='/bootstrap/assets/img/gallery/gallery-4.jpg'/>" class="venobox" data-gall="gallery-item">
                <img src="<c:url value='/bootstrap/assets/img/gallery/gallery-4.jpg'/>" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="<c:url value='/bootstrap/assets/img/gallery/gallery-5.jpg'/>" class="venobox" data-gall="gallery-item">
                <img src="<c:url value='/bootstrap/assets/img/gallery/gallery-5.jpg'/>" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="<c:url value='/bootstrap/assets/img/gallery/gallery-6.jpg'/>" class="venobox" data-gall="gallery-item">
                <img src="<c:url value='/bootstrap/assets/img/gallery/gallery-6.jpg'/>" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="<c:url value='/bootstrap/assets/img/gallery/gallery-7.jpg'/>" class="venobox" data-gall="gallery-item">
                <img src="<c:url value='/bootstrap/assets/img/gallery/gallery-7.jpg'/>" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="<c:url value='/bootstrap/assets/img/gallery/gallery-8.jpg'/>" class="venobox" data-gall="gallery-item">
                <img src="<c:url value='/bootstrap/assets/img/gallery/gallery-8.jpg'/>" alt="" class="img-fluid">
              </a>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Gallery Section -->

    <!-- ======= Chefs Section ======= -->
    <section id="chefs" class="chefs">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Baristar</h2>
          <p>Our Proffesional Baristars</p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="100">
              <img src="<c:url value='/bootstrap/assets/img/baristars/bar_1.jpg'/>" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Garam Seo</h4>
                  <span>귀요미 공주</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="200">
              <img src="<c:url value='/bootstrap/assets/img/baristars/bar_4.jpg'/>" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Jiny Kim</h4>
                  <span>원조 먹순이</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="300">
              <img src="<c:url value='/bootstrap/assets/img/baristars/bar_3.jpg'/>" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Nael Seo</h4>
                  <span>꼬꼬마 먹순이</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Chefs Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Contact</h2>
          <p>Contact Us</p>
        </div>
      </div>

      <div data-aos="fade-up">
        <%-- <iframe style="border:0; width: 90%; height: 350px;" 
          src="<c:url value='/WEB-INF/jsp/coffee/sample_02.html'/>" frameborder="0" allowfullscreen>
        </iframe> --%>
        <!-- <div id="map_view" style="width:90%; height:350px;"></div> -->
        <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
      </div>

      <div class="container" data-aos="fade-up">

        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="icofont-google-map"></i>
                <h4>Location:</h4>
                <p>부산시 수영구 망미2동 구락로</p>
              </div>

              <div class="open-hours">
                <i class="icofont-clock-time icofont-rotate-90"></i>
                <h4>Open Hours:</h4>
                <p>
                  Monday-Saturday:<br>
                  10:00 AM - 18:00 PM
                </p>
              </div>

              <div class="email">
                <i class="icofont-envelope"></i>
                <h4>Email:</h4>
                <p>hemiblue@naver.com</p>
              </div>

              <div class="phone">
                <i class="icofont-phone"></i>
                <h4>Call:</h4>
                <p>+82 010 1234 5678</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="8" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>Truth Coffee</h3>
              <p>
                                수영구 망미2동 구락로 <br>
                Busan, Korea <br><br>
                <strong>Phone:</strong> +82 010 1234 5678<br>
                <strong>Email:</strong> hemiblue@naver.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Truth Coffee</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/restaurantly-restaurant-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/bootstrap/assets/vendor/jquery/jquery.min.js'/>"></script>
  <script src="<c:url value='/bootstrap/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/bootstrap/assets/vendor/jquery.easing/jquery.easing.min.js'/>"></script>
  <script src="<c:url value='/bootstrap/assets/vendor/php-email-form/validate.js'/>"></script>
  <script src="<c:url value='/bootstrap/assets/vendor/owl.carousel/owl.carousel.min.js'/>"></script>
  <script src="<c:url value='/bootstrap/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>
  <script src="<c:url value='/bootstrap/assets/vendor/venobox/venobox.min.js'/>"></script>
  <script src="<c:url value='/bootstrap/assets/vendor/aos/aos.js'/>"></script>

  <!-- Template Main JS File -->
  <script src="<c:url value='/bootstrap/js/main.js'/>"></script>

</body>

</html>

<script type="text/javascript" defer="defer">
var setDataSec = 0;
var setSlideSec = 0;
var curPage;
var xpaused = false;

/*
 * go home
 */
function fn_showHome(){
	location.reload();
}

/*
 * 예약
 */
function fn_booking(){
	var param = "name="+$("#name").val()+"&email="+$("#email").val()
	            +"&phone="+$("#phone").val()+"&date="+$("#date").val()
	            +"&time="+$("#time").val()+"&people="+$("#people").val()
	            +"&message="+$("#message").val();
	var ajaxUrl = "<c:url value='/coffee/booking.do' />";
	
	$.ajax({
		type:"post"
		,url:ajaxUrl
		,data:param
		,dataType:"json"
		,success:function(result) {
			alert("메일을 성공적으로 보냈습니다!");
			emailForm.reset();
		}
		,error:function(e) {
			alert(e.responseText);
		}
 	});
}



$(document).ready(function() {
	//booking
	$("#booking").on("click", function(e){
		e.preventDefault();
		fn_booking();
	});
});
</script>

</body>
</html>