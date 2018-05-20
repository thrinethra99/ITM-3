<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  session.invalidate(); %>
<!DOCTYPE html>
<html>
<style>
notused {
    
    font-family: 'Open Sans', sans-serif;
    font-size: 100%;
    background-size: cover;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    -ms-background-size: cover;
    background-attachment: fixed;
    text-align: center;
    background: linear-gradient(to right, rgb(169,169,169), rgb(105,105,105));
    background: -ms-linear-gradient(to right, rgb(169,169,169), rgb(105,105,105));
    background: -webkit-linear-gradient(to right, rgb(169,169,169), rgb(105,105,105));
    background: -moz-linear-gradient(to right, rgb(169,169,169), rgb(105,105,105));
    background: -ms-linear-gradient(to right, rgb(169,169,169), rgb(105,105,105));
    background: -o-linear-gradient(to right, rgb(169,169,169), rgb(105,105,105));
}



body {
   
    font-family: 'Playfair Display';
	width: 100wh;
	height: 90vh;
	color: #000000;
    background-image: url("res/backimg.png");


	}
	

 @-webkit-keyframes Gradient {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}

@-moz-keyframes Gradient {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}

@keyframes Gradient {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}



.h1title {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 70px;
  padding: 80px 50px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
    color: #131313;
    background-color:linear-gradient(to right, rgb(169,169,169), rgb(105,105,105));
    letter-spacing: .15em;
    text-shadow: 
      1px -1px 0 #737373, 
      -1px 2px 1px #737373, 
      -2px 4px 1px #808080, 
      -3px 6px 1px #808080, 
      -4px 8px 1px #808080, 
      -5px 10px 1px #8c8c8c, 
      -6px 12px 1px #8c8c8c, 
      -7px 14px 1px #8c8c8c, 
      -8px 16px 1px #a6a6a6, 
      -9px 18px 1px #a6a6a6, 
      -10px 20px 1px #A9A9A9, 
      -12px 24px 1px #A9A9A9, 
      -13px 26px 1px #b3b3b3, 
      -14px 28px 1px #b3b3b3, 
      -15px 30px 1px #b3b3b3, 
      -16px 32px 1px #b3b3b3, 
      -17px 34px 1px #bfbfbf, 
      -18px 36px 1px #bfbfbf, 
      -19px 38px 1px #bfbfbf, 
      -20px 40px 1px #bfbfbf, 
      -21px 42px 1px #bfbfbf, 
      -22px 44px 1px #cccccc, 
      -23px 46px 1px #cccccc, 
      -24px 48px 1px #cccccc, 
      -25px 50px 1px #e6e6e6, 
      -26px 52px 1px #e6e6e6, 
      -27px 54px 1px #e6e6e6, 
      -28px 56px 1px #e6e6e6;
  }

.h1title2 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 30px;
  padding: 80px 50px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
    color: #e0dfdc;
    background-color:linear-gradient(to right, rgb(169,169,169), rgb(105,105,105));
    letter-spacing: .1em;
    text-shadow: 
      0 -1px 0 #fff, 
      0 1px 0 #2e2e2e, 
      0 2px 0 #2c2c2c, 
      0 3px 0 #2a2a2a, 
      0 4px 0 #282828, 
      0 5px 0 #262626, 
      0 6px 0 #242424, 
      0 7px 0 #222, 
      0 8px 0 #202020, 
      0 9px 0 #1e1e1e, 
      0 10px 0 #1c1c1c, 
      0 11px 0 #1a1a1a, 
      0 12px 0 #181818, 
      0 13px 0 #161616, 
      0 14px 0 #141414, 
      0 15px 0 #121212, 
      0 22px 30px rgba(0, 0, 0, 0.9);
  }
  
.column {
    float: left;
    width: 50%;
    padding: 20px;
    text-align: justify;
    
}
.row1:after {
    content: "";
    display: table;
    clear: both;
}

.btn1 {
	display: inline-block;
	padding: 10px 14px;
	color: #FFF;
	border: 2px solid #FFF;
	text-decoration: none;
	font-size: 18px;
	line-height: 120%;
	background-color: rgba(255,255,255, 0);
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	-webkit-transition: background-color 300ms ease;
	-moz-transition: background-color 300ms ease;
	transition: background-color 300ms ease;
	cursor: pointer;
}


        main {
            margin-top: 20px;
        }
    </style>
<head>
    
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
 <link type="text/css" rel="stylesheet" href="css/jquery-ui.css" media="screen,projection"/>
 <link type="text/css" rel="stylesheet" href="css/bootstrap.css" media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="UTF-8">
	

</head>

<body>



<main>
     
      


    <div class="container background">
    <div id="google_translate_element"></div>
    
    <div class="row">
    
        <div class="col-lg-12 col-md-12 col-sm-12 h1title" >IDEA THREAD MAPPER</div>
    </div>
        <div class="row1">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 ">
                <h4> <span class="infotitle">About IDEA THREAD MAPPER</span> </h4>
                
                 <ul style="font-family: 'Playfair Display', serif; font-size:14px bold">
                    <li>Idea Thread Mapper (ITM) is a research-based collaborative platform for students to conduct deep inquiry and sustained knowledge building. Its features support student collaboration within each classroom and cross communities.</li>
                    <li >Within each classroom, students develop sustained threads of inquiry to investigate deep problems in their areas of study. They contribute and build on one another's ideas to develop deep understanding in each idea thread and work together to organize their whole inquiry project.</li>
                	<li>Beyond working with their own peers, students share productive threads of ideas with other classrooms and engage in Super Talks with students from around the world for mutual learning and collaborative problem solving.</li>
                    </ul>             
              
              
                <br>

                
                   <h4> <span class="infotitle"> What can you do with ITM ?</span> </h4>
                    
                    <ul style="font-family: 'Playfair Display', serif; font-size:14px bold">
                    <li>Using ITM, students and teachers can </li>                  
                    <li>Set up a Project for their classrooms inquiry work and add project members.</li>
                    <li>Create Cross-Project Connections including live buddy projects and archived resource projects.</li>
                    <li >Structure the inquiry project by setting up Wondering Areas(themes) and Idea Threads , each focusing on a more specific problem/topic in a Wondering Area.</li>
                    <li >Participate in the discussion in each idea thread and updating its Journey of Thinking.</li>
                    <li >Map out different idea threads to review progress and see connections.</li>
                    <li >Launch and participant in Super Talks threads to discuss challenging problems with students from the buddy projects.</li>
                </ul>
               
                <br>
                

                
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 ">
                <br><br><br>
                
                 <div class="card teal lighten-4 " style="opacity:0.9;" >
                    <div class="card-content black-text" >
                        <span class="card-title">Already a user?</span>
                    </div>
                    <form action="USER_LOGIN"  method="post" onsubmit="return validateForm()">
                    <div class="card-action">
                        <div class="input-field col s12">
                            <input id="account" name="email" type="text"  >
                            <label for="account">Email</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="password" name="pwd" type="password" class="validate">
                            <label for="password">Password</label>
                        </div>
                        <br><br>
                         <input class="waves-effect waves-orange btn1 center black-text" id="login" type="submit" value="Login">
                        <br><br>
                         <a href="/IIUSs/kf6/login.jsp" class="waves-effect waves-orange btn1 center black-text" id="kf6_login">login as KF6 User </a>
                    </div>
                    </form>
                </div>

                <br><br><br>
                <div class="card teal lighten-4" style="opacity:0.9;">
                    <div class="card-content black-text">
                        <span class="card-title">New user?<br><br> <a href="register.jsp" class="waves-effect waves-orange btn1 center black-text" id="register">register</a></span>
                    </div>
                </div>
            </div>
            
            <div class="col s12" style="font-size:15px">
            <div class="divider"></div>
            </div>
        </div>
        <div class="row ">
<div class="col-lg-12">
<p class="fonttext">
                The development of ITM is funded by National Science Foundation through two Cyberlearning grants awarded to Dr. Jianwei Zhang and Dr. Mei-Hwa Chen at the University at Albany.
</p>
</div>
</div>
<div class="fixed-action-btn click-to-toggle" style="bottom: 45px; right: 24px;">
    <a class="btn1">Language</a>
    <ul>
        <li><a class="btn1" >English</a></li>
    </ul>
</div>
    </div>
    
</main>




<!--Import jQuery before materialize.js-->

<script src="js/jquery-3.1.0.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script src="js/jquery-3.1.0.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.sessionTimeout.js"></script>
<script type="text/javascript">
	function validateForm() {
	    if ($("#account").val()=="") {
	        Materialize.toast('User name is null', 4000)
	        return false;
	    }
	    if ($("#password").val()=="") {
	    	 Materialize.toast('Password is null', 4000)
	        return false;
	    }
	}
	
	
	var getUrlParameter = function getUrlParameter(sParam) {
	    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;

	    for (i = 0; i < sURLVariables.length; i++) {
	        sParameterName = sURLVariables[i].split('=');

	        if (sParameterName[0] === sParam) {
	            return sParameterName[1] === undefined ? true : sParameterName[1];
	        }
	    }
	};
	
	var status =getUrlParameter('flag');
	if(status=="fails"){
		 Materialize.toast("Wrong user name or password", 4000)
		 
	}

</script>
<script type="text/javascript">
            function googleTranslateElementInit() {
           new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

</body>
</html>