function emailValidation(email){
	var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var message = "";
    var flag = false;
    
	if(email == null || email == ""){
		alert("이메일 주소를 입력해주세요");
	}else{
		if(regex.test(email)){
			flag = true;
		}else{
			alert("이메일을 정확하게 입력해주세요");
		}
	}
	
	return flag;
}

//금액 세자리마다 콤마 넣기
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//메일 발송, pdf다운, 견적서 출력 시 아래 function 실행
function printAnalytics(){
	//naver
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_54b732620502";
	var _nasa={};
	_nasa["cnv"] = wcs.cnv("5","1"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
	wcs_do(_nasa);
	 
	//daum
//	var DaumConversionDctSv="type=W,orderID=,amount=1"; 
//	var DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00"; 
//	if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
//		DaumConversionDctSv="type=W,orderID=,amount=";
//		DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00";
//		var DaumConversionScriptLoaded=true;
//		(function(){var d=document.createElement('script');d.type='text/javas'+'cript';d.src=(location.protocol=='https:'?'https':'http')+'://s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(d,s);})();
//	}
	 
	//google
	var google_conversion_id = 983140464;
	var google_conversion_language = "en";
	var google_conversion_format = "3";
	var google_conversion_color = "ffffff";
	var google_conversion_label = "OfQgCNTg6GQQ8JDm1AM";
	var google_remarketing_only = false;
	 
	
	//모비온
	var cn = new EN();
	cn.setData("uid",  "amazoncar");
	cn.setData("ordcode",  "");
	cn.setData("qty", "1"); 
	cn.setData("price", "1"); 
	cn.setData("pnm", encodeURIComponent(encodeURIComponent("counsel")));
	cn.sendConv();
}


//견적 요청 완료 페이지에 삽입 
function estimateAnalytics(){
	//naver
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_54b732620502";
	var _nasa={};
	_nasa["cnv"] = wcs.cnv("4","10"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
	wcs_do(_nasa);

	 //daum
//	 var DaumConversionDctSv="type=W,orderID=,amount=10"; 
//	 var DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00"; 
//	 if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
//			DaumConversionDctSv="type=W,orderID=,amount=";
//			DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00";
//			var DaumConversionScriptLoaded=true;
//			(function(){var d=document.createElement('script');d.type='text/javas'+'cript';d.src=(location.protocol=='https:'?'https':'http')+'://s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(d,s);})();
//		}
//	 
	 //google
	 var google_conversion_id = 983140464;
	 var google_conversion_language = "en";
	 var google_conversion_format = "3";
	 var google_conversion_color = "ffffff";
	 var google_conversion_label = "pSwKCNjQ-mQQ8JDm1AM";
	 var google_remarketing_only = false;
	 


	 //모비온
	 var cn = new EN();
	 cn.setData("uid",  "amazoncar");
	 cn.setData("ordcode",  "");
	 cn.setData("qty", "1"); 
	 cn.setData("price", "10"); 
	 cn.setData("pnm", encodeURIComponent(encodeURIComponent("counsel")));
	 cn.sendConv();
}

//반올림, 올림, 버림 Function 
function priceCutting(aprice, stype, n) { // 금액, 타입, 절삭금액 단위
    // 원단위처리(R:반올림, C:올림, F:버림)
    var remove_price = 0;
    stype = stype ? stype : "R";
    remove_price = aprice / n;
 
    if(stype == "F") {
        remove_price = Math.floor(remove_price);
    } else if (stype == "R") {
        remove_price = Math.round(remove_price);
    } else if (stype == "C") {
        remove_price = Math.ceil(remove_price);
    }
     
    remove_price = remove_price * n;
    return remove_price;
}


///////////////////////////////////////////
//     소셜 로그인 관련 api (2017.08.01)		 //
///////////////////////////////////////////

//페이스북 로그인 버튼 클릭
function FB_login(){
	/*FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});*/
	FB.login(function(response) {
        if (response.authResponse) {
            facebookAPI();
        }
    }, 
    {
    	scope: 'email,public_profile,user_birthday',
        return_scopes: true
    });
}

//구글 로그인 버튼 클릭
function GG_login(){	
	getEmail();
}

///// <<페이스북>>  //////
function statusChangeCallback(response) {
	
	if (response.status === 'connected') {		
		facebookAPI();
	} else if (response.status === 'not_authorized') {		
		alert('홈페이지에 로그인해 주세요.');
	} else {
		//window.open("https://www.facebook.com/login.php", "PRINT", "left=10, top=10, width=900, height=900, scrollbars=yes, status=yes, resizable=yes");
		//var uri = window.document.URL;
		var uri = "https://www.amazoncar.co.kr/login";
		location.href = "https://www.facebook.com/dialog/oauth?client_id=227317820946230&redirect_uri="+uri;
	}
}

function checkLoginState() {
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
}
window.fbAsyncInit = function() {
	FB.init({
		//운영
		appId : '227317820946230',	//페이스북 appId
		
		//개발
		//appId : '1970562893190048',	//페이스북 appId
		
		cookie : true, // 쿠키사용여부
		xfbml : true, // parse social plugins on this page
		version : 'v2.8' // use version 2.8
	});
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function facebookAPI() {	
	FB.api('/me?fields=id,name,email', function(response) {	//<--email값 을 받아오기 위해 parameter 지정.		
		var fb_email = response.email;
		if(fb_email == '' || fb_email == null){
			fb_email = 'undefined';
		} else {			
			fb_email = btoa(response.email);
		}
		var fb_id = response.id;
		
		//회원가입 이후 소셜 로그인시 메일인증을 한 계정인지 체크
		var data= {};		
		data["fb_id"] = fb_id;		
		if(fb_email == '' || fb_email == null){
			fb_email = 'undefined';
		}		
		data["fb_email"] = fb_email;
		
		//먼저 해당 정보를 가지고 이미 회원가입한 계정인지 처음가입인지를 체크
		$.ajax({
			contentType:'application/json',
			dataType:'json',
			url:'/checkFbLoginMember',
			type:'POST',
			data:JSON.stringify(data),
			success:function(response){	
				
				var resultNum = response;				
				if(resultNum == 0){	//처음회원가입하는 경우 --> 회원가입시킨다
					location.href = '/signup?fb_email=' + fb_email + "&fb_id=" + fb_id;
				
				}else{	//회원가입이 되어있는 경우					
					if(fb_email != 'undefined'){	//이메일이 null이 아닌 회원은 그대로 로그인 진행
						location.href = '/signup?fb_email=' + fb_email + "&fb_id=" + fb_id;
					
					}else{	//이메일이 null 이면 fb_id를 이용해 로그인시도
						//이 회원이 이메일 인증절차를  끝까지 진행했는지 체크
						$.ajax({
							contentType:'application/json',
							dataType:'json',
							url:'/checkEmailForFb',
							type:'POST',
							data:JSON.stringify(data),
							success:function(res){								
								var resultYn = res.USE_YN;
								//var resultEmail = btoa(res.EMAIL);
								var resultEmail = res.EMAIL;
								if(resultYn == 'H'){	//아직 인증절차를 끝까지 진행하지 않은 회원 --> 인증절차 진행시킨다
									location.href = '/regEmailForm?fb_id='+fb_id		
								}else if(resultYn == 'Y'){ 	//회원가입이 잘된 경우 --> 로그인 시킨다
									location.href = '/signup?fb_email=' + btoa(resultEmail) + "&fb_id=" + fb_id;
								}
							},
							error:function(request,status,error){
								alert("로그인 중  오류 발생! 관리자에게 문의하세요.");
							}
						});						
					} 					
				}					
			},
			error:function(request,status,error){
				alert("로그인 중  오류 발생! 관리자에게 문의하세요.");
			}
		});
	}, 
	{
		scope: 'public_profile,email',
        return_scopes: true
    });
}


///// <<구글>>  //////
/*var auth2 = {};
var helper = (function() {
  return {
    
    onSignInCallback: function(authResult) {
    	//alert(authResult);
      if (authResult.isSignedIn.get()) {
        helper.profile();
      } else {
          if (authResult['error'] || authResult.currentUser.get().getAuthResponse() == null) {            
            alert(authResult['error']);            
          }
      }
    },
    
    disconnect: function() {
      auth2.disconnect();
    },
    
    profile: function(){
      gapi.client.plus.people.get({
        'userId': 'me'
      }).then(function(res) {
        var profile = res.result;
        //구글 소셜 로그인계정의 이메일 정보 가져오기
        var google_email = '';
        if (profile.emails) {
          for (var i=0; i < profile.emails.length; i++){            
            google_email += profile.emails[i].value;
          }         
        }
        location.href="/signup?gg_email="+google_email;
      }, function(err) {
        var error = err.result;
        alert(error);
      });
    }
  };
})();

$(document).ready(function() {
  $('#disconnect').click(helper.disconnect);  
});

var updateSignIn = function() {
  if (auth2.isSignedIn.get()) {
    helper.onSignInCallback(gapi.auth2.getAuthInstance());
  }else{
	helper.onSignInCallback(gapi.auth2.getAuthInstance());	
  }
}

function startApp() {	
  gapi.load('auth2', function() {
    gapi.client.load('plus','v1').then(function() {    	
      gapi.signin2.render('signin-button', {
          scope: 'https://www.googleapis.com/auth/plus.login',                    
          fetch_basic_profile: false });
      gapi.auth2.init({fetch_basic_profile: false,
          scope:'https://www.googleapis.com/auth/plus.login'}).then(
            function (){
              auth2 = gapi.auth2.getAuthInstance();
              auth2.isSignedIn.listen(updateSignIn);
              auth2.then(updateSignIn);
            });
    });
  });
}*/

//구글 테스트
(function() {
    var po = document.createElement('script');
    po.type = 'text/javascript'; 
    po.async = true;
    po.src = 'https://apis.google.com/js/client:plusone.js?onload=render';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
})();
  function render() { // 로그인 버튼 지정
    gapi.signin2.render('GG_login', {
      'callback': 'signinCallback', // 버튼 클릭 시 실행할 function
      'clientid': '87064886185-9k4to29khedjjpa71638ombcphn2754c.apps.googleusercontent.com',
      'cookiepolicy': 'single_host_origin',
      'requestvisibleactions': 'http://schemas.google.com/AddActivity',
      'scope': 'https://www.googleapis.com/auth/plus.login'
    });
  }
  /* <div id="customBtn" class="customGPlusSignIn">
   <li><a href="#"><img src="/_common/img/ico_reply03.jpg" alt="google"></a></li>
   </div> 요런식으로 사용*/
  
var google_access_token = "";
  function signinCallback(authResult) { // 지정한 버튼 클릭시
   if (authResult['access_token']) {
  google_access_token = authResult['access_token'];
     // 승인 성공
     var idToken = authResult['id_token'];     
   gapi.auth.setToken(authResult); // 반환된 토큰을 저장합니다.
   
   
   //getEmail(); // 토큰저장했으니 프로필 정보 get    
   } else if (authResult['error']) {
     // 오류가 발생했습니다.
     // 가능한 오류 코드:
     //   "access_denied" - 사용자가 앱에 대한 액세스 거부
     //   "immediate_failed" - 사용자가 자동으로 로그인할 수 없음
     /*  alert('오류 발생: ' + authResult['error']); */
   }
  }
 

  function getEmail(){
	  // userinfo 메소드를 사용할 수 있도록 oauth2 라이브러리를 로드합니다.
	  gapi.client.load('oauth2', 'v2', function() {
		  var request = gapi.client.oauth2.userinfo.get();
		  request.execute(getEmailCallback);
	  });
	  //gapi.load('client:auth2', getEmailCallback);
  }
  function getEmailCallback(obj){
	  var google_email = obj['email'];
	  if(google_email =='undefined' || google_email== null || google_email ==''){
		  //alert("구글 로그인 후 다시 시도해 주세요.");
		  //location.href='/login?param=Y';
		  return false;
	  }else{
		  //location.href="/signup?gg_email="+google_email;
		  location.href="/signup?gg_email="+ btoa(google_email);
	  }

    //goname = obj['name']; // 프로필 정보는  넘겨받은 obj값들중  선택하여 뽑아내면 됨.
    //alert("goname >>" + goname);
    //var google_name = obj['name'];
    //var google_id = obj['id'];
    
 } 
/* 구글 로그아웃 */
function disconnectUser() {
	var revokeUrl = 'https://accounts.google.com/o/oauth2/revoke?token=' + google_access_token; // 로그아웃을 위해서는 저URL에 그냥 토큰값만 추가해서 날려주면된다.
	$.post("/oAuthASPExample/naver_out.asp", {},  function (responseasp) {  // 내가 생성했던 SESSION을 제거하기 위함..
		if(responseasp!="Y"){
			alert("Error");
			//location.replace('/unmember/memberrege?flag=1');            
		}else{
			// 비동기 GET 요청을 수행합니다.
			$.ajax({
				type: 'GET',
				url: revokeUrl,
				async: false,
				contentType: "application/json",
				dataType: 'jsonp',
				success: function(nullResponse) { 
				// 성공
				},
				error: function(e) {
				// 오류 처리
				// console.log(e);
				// 실패한 경우 사용자가 수동으로 연결 해제하게 할 수 있습니다.
				// https://plus.google.com/apps
				}
			});
			location.href = '<%=nowPageShareURL%>'; // 로그아웃 한 페이지로 이동
		}
  });
}

function scriptValidation2(str) {
	var regex = /[<>]/gi;
	//var regex = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\''\"]/gi;
	var message = "";
	var flag = false;
	if (str != null && str != "") {
		if (regex.test(str)) {
			alert("< > 등의 특수문자는 입력하실 수 없습니다.");
		} else {
			flag = true;
		}
	} else {
		flag = true;
	}
	return flag;
}

function scriptValidationOrigin(str) {
	var regex = /[<>\''\"]/gi;
	var message = "";
	var flag = false;
	if (str != null && str != "") {
		if (regex.test(str)) {
			alert("특수문자는 입력하실 수 없습니다.");
		} else {
			flag = true;
		}
	} else {
		flag = true;
	}
	return flag;
}
function scriptValidation(str) {
	//var regex = /[<>]/gi;
	var regex = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\''\"]/gi;
	var message = "";
	var flag = false;
	if (str != null && str != "") {
		if (regex.test(str)) {
			alert("특수문자는 입력하실 수 없습니다.");
		} else {
			flag = true;
		}
	} else {
		flag = true;
	}
	return flag;
}
function scriptEmailValidation(str) {
	//var regex = /[<>]/gi;
	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var message = "";
	var flag = false;
	if (str != null && str != "") {
		if (regex.test(str) == false) {
			alert("잘못된 이메일 형식입니다.");
		} else {
			flag = true;
		}
	} else {
		flag = true;
	}
	return flag;
}
