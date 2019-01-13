<%@page import="code.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">

      <link rel="stylesheet" href="css/style.css">
      <link href='https://fonts.googleapis.com/css?family=Aclonica' rel='stylesheet'>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

  
</head>

<body style="background-color: #222">

<%
	UserDao userdao=new UserDao();
	userdao.updateCurrentPage(session.getAttribute("username").toString(),"level1.jsp");
%>

	<div class="nav-container">
    <div class="navbar">
      <div class="mobileMenu"></div>
      <!--  <p class="left-item"><i class="fas fa-clock"></i></p>
     <div id="clockdiv"></div> --> 
     
     
     <input type="hidden" id="hours" />
     <input type="hidden" id="minutes" />
     <input type="hidden" id="seconds" /> 
     
     <input type="hidden" id="temp" value="180"/>
    </div>
    
  </div>
  <svg id="game" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 400" overflow="visible">
	<linearGradient id="ArcGradient" >
			<stop offset="0"  stop-color="#fff" stop-opacity=".2"/>
			<stop offset="50%" stop-color="#fff" stop-opacity="0"/>
	</linearGradient>
    <path id="arc" fill="none" stroke="url(#ArcGradient)" stroke-width="4" d="M200,350c350-500,650-500,900,0"  pointer-events="none"/>
    <defs>
        <g id="arrow">
            <line x2="70" fill="none" stroke="#888" stroke-width="2" />
            <polygon fill="#f28909" points="74 0 68 12 66 10 68 -12" />
            <polygon fill="#9e5b09" points="12 -13 -14 -13 -11 0 -14 13 12 13 15 0" />
        </g>
    </defs>
    <g id="target">

    	 <path fill="#F4531C" d="M935.9,285.2 c -29.5,29.5 -60.9,28.9 -72.9,0.2 c -10.6 -28.1,5.2 -54,11.2 -56 c 2.5 -10.8,35 -27.6, 59 -20.2 C 964.1, 220.3, 965.7, 253.8, 934.2, 286.5 z" />

        <path fill="#FFF" d="M924.2,274.2 c -21.5,21.5 -45.9,19.9 -52,3.2 c -4.4 -12.1,2.4 -29.2,14.2 -41 c 11.8 -11.8,29 -18.6, 41 -14.2 C 944.1, 228.3, 945.7, 252.8, 924.2, 274.2 z" />

        <path fill="#F4531C" d="M915.8,265.8 c -14.1,14.1 -30.8,14.6 -36,4.1 c -4.1 -8.3,0.5 -21.3,9.7 -30.5 s 22.2 -13.8,30.5 -9.7 C930.4, 235, 929.9, 251.7, 915.8, 265.8 z" />

        <path fill="#FFF" d="M908.9,258.9 c -8,8 -17.9,9.2 -21.6,3.5 c -3.2 -4.9 -0.5 -13.4,5.6 -19.5 c 6.1 -6.1,14.6 -8.8,19.5 -5.6 C918.1,241,916.9,250.9,908.9,258.9z" />

        <path fill="#F4531C" d="M903.2,253.2 c-2.9,2.9 -6.7,3.6 -8.3,1.7 c -1.5 -1.8 -0.6 -5.4,2 -8 c 2.6 -2.6,6.2 -3.6,8 -2 C906.8,246.5,906.1,250.2,903.2,253.2z" />
    </g>

	<g id="bow" fill="none" stroke-linecap="round" vector-effect="non-scaling-stroke" pointer-events="none" data-svg-origin="0 0">
		<polyline fill="none" stroke="#ddd" stroke-linecap="round" points="88,100 88,250 88,400"/>
		<path fill="none" stroke="#1e6662" stroke-width="3" stroke-linecap="round" d="M88,400 c 25 -20.1,115 -180.1,1 -300 c -12 -90.9 0"/>
    </g>

	<g class="arrow-angle"><use x="100" y="250" xlink:href="#arrow"/></g>
	<clipPath id="mask">
		<polygon opacity=".5" points="0,0 1500,0 1500,200 970,290 950,240 925,220 875,280 890,295 920,310 0,350" pointer-events="none"/>
	</clipPath>

	<g class="arrows" clip-path="url(#mask)"  pointer-events="none">
	</g>

	<!--button-->
	<svg height="140" width="500" id="miss_btn" style="visibility: hidden;">
	<a href="level1.html"><ellipse cx="200" cy="80" rx="100" ry="50" style="fill: gray; stroke: black; stroke-width:2; align-self: center;"/><text x="125" y="90" font-family="Verdana" font-size="35" fill="black">Oh! No</text></a></svg>

	<g class="miss" fill="#aaa" opacity="0" transform="translate(0, 100)">
		<path d="M358 194L363 118 386 120 400 153 416 121 440 119 446 203 419 212 416 163 401 180 380 160 381 204"/>
		<path d="M450 120L458 200 475 192 474 121"/>
		<path d="M537 118L487 118 485 160 515 162 509 177 482 171 482 193 529 199 538 148 501 146 508 133 537 137"/>
		<path d="M540 202L543 178 570 186 569 168 544 167 546 122 590 116 586 142 561 140 560 152 586 153 586 205"/>
		<path d="M595,215l5-23l31,0l-5,29L595,215z M627,176l13-70l-41-0l-0,70L627,176z"/>

	</g>
	<!--button-->
	<svg height="140" width="500" id="cent_btn" style="visibility: hidden;">
	<a href="easy1.jsp"><ellipse cx="200" cy="80" rx="100" ry="50" style="fill: gray; stroke: black; stroke-width:2;"/><text x="110" y="90" font-family="Verdana" font-size="35" fill="black">Click Me</text></a></svg>

	<g class="bullseye" fill="#F4531C" opacity="0">
		<path d="M322,159l15-21l-27-13l-32,13l15,71l41-14l7-32L322,159z M292,142h20l3,8l-16,8 L292,142z M321,182l-18,9l-4-18l23-2V182z"/>
		<path d="M340 131L359 125 362 169 381 167 386 123 405 129 392 183 351 186z"/>
		<path d="M413 119L402 188 450 196 454 175 422 175 438 120z"/>
		<path d="M432 167L454 169 466 154 451 151 478 115 453 113z"/>
		<path d="M524 109L492 112 466 148 487 155 491 172 464 167 463 184 502 191 513 143 487 141 496 125 517 126z"/>
		<path d="M537 114L512 189 558 199 566 174 533 175 539 162 553 164 558 150 543 145 547 134 566 148 575 124z"/>
		<path d="M577 118L587 158 570 198 587 204 626 118 606 118 598 141 590 112z"/>
		<path d="M635 122L599 198 643 207 649 188 624 188 630 170 639 178 645 162 637 158 649 143 662 151 670 134z"/>
		<path d="M649,220l4-21l28,4l-6,25L649,220z M681,191l40-79l-35-8L659,184L681,191z"/>
	</g>

	<!--message-->
	<svg height="140" width="500" id="hit_btn" style="visibility: hidden;">
	<text x="60" y="90" class="Rrrrr">You must hit center! :(</text></svg>

	<g class="hit" fill="#ffcc00" opacity="0" transform="translate(180, -80) rotate(12) ">
		<path d="M383 114L385 195 407 191 406 160 422 155 418 191 436 189 444 112 423 119 422 141 407 146 400 113"/>
		<path d="M449 185L453 113 477 112 464 186"/>
		<path d="M486 113L484 130 506 130 481 188 506 187 520 131 540 135 545 119"/>
		<path d="M526,195l5-20l22,5l-9,16L526,195z M558,164l32-44l-35-9l-19,51L558,164z"/>
	</g>

</svg>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.1/TweenMax.min.js'></script>
<script src='http://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/MorphSVGPlugin.min.js'></script>

    <script  src="js/index.js"></script>
    <script type="text/javascript" src="js/timer.js"></script>
    <script>
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
    </script>
</body>
</html>