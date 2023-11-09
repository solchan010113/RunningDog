	var time = 0;
	
	$(document).ready(function(){
	  buttonEvt();
	});
	
	function init(){
	  document.getElementById("tVal").innerHTML = "00:00:00";
	}
	
	function buttonEvt(){
	  var hour = 0;
	  var min = 0;
	  var sec = 0;
	  var timer;

	// start btn
	$("#startButton").click(function(){
		
		timer = setInterval(function(){
	        time++;
	
	        min = Math.floor(time/60);
	        hour = Math.floor(min/60);
	        sec = time%60;
	        min = min%60;
	
	        var th = hour;
	        var tm = min;
	        var ts = sec;
	        if(th<10){
	        th = "0" + hour;
	        }
	        if(tm < 10){
	        tm = "0" + min;
	        }
	        if(ts < 10){
	        ts = "0" + sec;
	        }
	
	        document.getElementById("tVal").innerHTML = th + ":" + tm + ":" + ts;
	        
	         $("#timeDataInput").val(th + ":" + tm);   
	         
	      }, 1000);	   
	      
	    
	   
	                 
	    
	  });
	  
	  
	  
            
	
	// 아직 미사용 ------------------------------------
	  // pause btn
	  $("#pausebtn").click(function(){
	    if(time != 0){
	      $(".fa").css("color","#FAED7D")
	      this.style.color = "#4C4C4C";
	      clearInterval(timer);
	      starFlag = true;
	    }
	  });
	
	  // stop btn
	  $("#stopButton").click(function(){
	    if(time != 0){
	      clearInterval(timer);
	      starFlag = true;
	      time = 0;
	      init();
	      
	      
	      
	    }
	  });
	}
	// ---------------------------------------------
 
	// 보여지는 맵
    let map;
	// 처음 보여지는 마커
    let myLocationMarker;
	// 라인 배열
	let linePath = [];
	// 라인 옵션
    let lineOverlay;
 	// 라인 옵션
    let watchId;
    // 버튼 설정
    let isTracking = false;             	
 	
    // 처음 맵구현
    function initMap() {
      // 현재 위치 가져오기
    	navigator.geolocation.getCurrentPosition(success, error, options);             

        // 시작버튼 클릭
        $("#startButton").on("click", startTracking);
        // 정지버튼 클릭
        $("#stopButton").on("click", stopTracking);              
    }     
    
    // 가져오기 성공
    function success(position) {
      let lat = position.coords.latitude;
      let lng = position.coords.longitude;  
      
      let myLocation = new naver.maps.LatLng(lat, lng); 
      
      console.log("현재 위치는 위도: " + lat + ", 경도: " + lng);
    
      // 맵 표시
      map = new naver.maps.Map("map", {
        center: myLocation,
        zoom: 19,
		mapDataControl : false,
		caleControl: false,
        logoControl: false
      });  
      
      // 초기 내 위치 반경표시
      mapRadius = new naver.maps.Circle({
		 map : map,
		 center : myLocation,
		 radius : 30,
		 fillColor : '#3CFBFF',
		 fillOpacity : 0.5
	  });
     
      // 내 위치 마커
      myLocationMarker = new naver.maps.Marker({
          position: myLocation,
          map: map,              
          title: "내 위치"
      });         
    }

    function error(error) {
      console.error("에러 코드: " + error.code);
      console.error("에러 메시지: " + error.message);
    }
    
	 // 위치 요청 옵션
    const options = {
      enableHighAccuracy: false,
      maximumAge: 0,
      timeout: Infinity
    };    	
 
    // 시작버튼 클릭 후 작동
    function startTracking() {
        if (!isTracking) {
            isTracking = true;                
            $("#startButton").hide(); // 시작버튼 가리기
            $("#walkStart").show(); // 정지버튼 보이기                
            
            console.log("시작버튼 클릭");  
            
            // 네비게이션 기능으로 위치정보 받아오기 (3초마다 위치 업데이트)
            updateMyLocation();
            watchId = setInterval(updateMyLocation, 3000);                 
        }
    }          
         
    // 정지버튼 클릭 후 작동
    function stopTracking() {
        if (isTracking) {
            isTracking = false;
            $("#startButton").show();
            $("#walkStart").hide();
            
            console.log("위치정보 받아오기 중단");    

            // 위치정보 받아오기 중단
            clearInterval(watchId);                         
                            
            // 라인 넘기기
            console.log("그려진 라인 정보 : "+ linePath);                
          
         	// `linePath` 데이터를 `wif` 페이지로 보내고 페이지 이동
            const jsonData = JSON.stringify(linePath.map(function (point) {
                return {
                    lat: point._lat,
                    lng: point._lng
                  };           		
            }));  

            // 데이터를 폼 필드에 설정
            $("#lineDataInput").val(jsonData);
                        
            // 폼 제출
            $("#dataForm").submit();
        }           
    }
    
    
	// 마커 아이콘을 생성
    const mapIcon = {
      content: '<div style="background-color: blue; width: 10px; height: 10px; border-radius: 50%;"></div>', // 빨간색 원 모양 아이콘
      size: new naver.maps.Size(10, 10), // 아이콘 크기 설정
      anchor: new naver.maps.Point(5, 5), // 아이콘 기준점 설정
	  mapDataControl : false,
	  caleControl: false,
      logoControl: false
    };

    // 이동중 현재 위치정보
    function updateMyLocation(position) {  
    	if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
        	
        	let lat = position.coords.latitude;
        	let lng = position.coords.longitude;       	
        	
            let myLocation = new naver.maps.LatLng(lat, lng); 
            
			console.log("이동중 현재 위치는 : " + lat + ", " + lng);
        	
        	$("#mapX").val(lat);
        	$("#mapY").val(lng);
            
        	// 이동위치마커 표시할때 처음위치마커 지우기
            if (myLocationMarker) {
                myLocationMarker.setMap(null);
            }
            
            myLocationMarker = new naver.maps.Marker({
                position: myLocation,
                map: map,
                icon: mapIcon, // 빨간색 아이콘 설정
                title: "이동중 내 위치"
            });
            
       		// 이동위치마커 표시할때 반경 지우기
            if (mapRadius) {
            	mapRadius.setMap(null);
            }
       		
            mapRadius = new naver.maps.Circle({
   			 map : map,
   			 center : myLocation,
   			 radius : 30,
   			 fillColor : '#3CFBFF',
   			 fillOpacity : 0.5
   		    });

            // 라인 그리기
            linePath.push(myLocation);
            if (lineOverlay) {
                lineOverlay.setMap(null);
            }
            
            // 라인 설정
            lineOverlay = new naver.maps.Polyline({
                map: map,
                path: linePath,
                strokeColor: "#ff7f00",
                strokeWeight: 5
            });

            map.setCenter(myLocation);
            });
        }
     }        

    function handleError(error) {
        console.error("위치 정보 가져오기 실패: " + error.message);
    }  
    
    
   // 강아지 프로필사진 
   $('.profile-circles').slick({
       slidesToShow: 6, // 화면에 보여질 슬라이드 수
       slidesToScroll: 6, // 스크롤할 슬라이드 수
       infinite: false
   });
    
    $(document).ready(function() {
        // 슬라이드 버튼을 숨김
        $('.slick-next, .slick-prev').hide();
    });              
        
  