package com.runningdog.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.runningdog.service.MoWebService;
import com.runningdog.service.UserService;
import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.ImagesVo;
import com.runningdog.vo.LinePathVo;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.MoDogVo;
import com.runningdog.vo.MoImagesVo;
import com.runningdog.vo.MoTrailVo;
import com.runningdog.vo.MoWalkLogVo;
import com.runningdog.vo.TrailVo;
import com.runningdog.vo.UseTrailVo;
import com.runningdog.vo.UserVo;
import com.runningdog.vo.XYVo;

@Controller
@RequestMapping("/m")
public class MobileWebController {

	@Autowired
	private MoWebService moWebService;

	// 로그인폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		System.out.println("모바일 로그인폼");
		return "mobileWeb/loginForm";
	}

	// 로그인폼
	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("모바일 로그인");
		// 로그인 후 세션에 삽입
		UserVo authUser = moWebService.selectOneUser(userVo);
		System.out.println(authUser);	
		
	    if ("admin".equals(userVo.getId())) {
	        // 만약 사용자 아이디가 'admin'이면 'admin' 페이지로 리다이렉트
	    	System.out.println("관리자접속");
	        return "redirect:admin";
	    } else if (authUser != null) {
	        // 사용자가 'admin'이 아니고, 로그인에 성공한 경우 'map' 페이지로 리다이렉트
	    	System.out.println("일반회원접속");
	        session.setAttribute("authUser", authUser);
	        return "redirect:map";
	    } else {
	        // 'admin'도 아니고 로그인에 실패한 경우 로그인 폼으로 리다이렉트
	        return "redirect:loginForm";
	    }
	}
	
	// 로그인폼
	@RequestMapping("/admin")
	public String admin(HttpSession session) {
		return "mobileWeb/adminInsert";
	}
	
	@PostMapping("/adminInsert")
	public String saveCoords(@RequestBody Map<String, List<Map<String, Double>>> requestBody) {
	    String result = "성공"; // 성공 기본값으로 설정

	    try {
	        List<Map<String, Double>> coordsList = requestBody.get("coords");

	        // 이제 이 List<Map<String, Double>>을 원하는 형식으로 변환할 수 있습니다.
	        List<XYVo> coords = new ArrayList<>();

	        for (Map<String, Double> coordMap : coordsList) {
	            double x = coordMap.get("x");
	            double y = coordMap.get("y");
	            coords.add(new XYVo(x, y));
	        }

	        List<Integer> dogNoList = Arrays.asList(16);
	        // MoWalkLogVo 객체를 생성하고 좌표 데이터 설정
            MoWalkLogVo walkLogVo = new MoWalkLogVo();
            walkLogVo.setPolylinePath(coords);
            walkLogVo.setDogNoList(dogNoList);
            walkLogVo.setUserNo(13);
            walkLogVo.setLocationNo(1174010600);
            walkLogVo.setTitle("관리자산책기록");
            walkLogVo.setContent("관리자내용");
            walkLogVo.setSecurity("공개"); 
            walkLogVo.setUserNo(13);
            
            // 다른 MoWalkLogVo 속성들도 필요에 따라 설정
            System.out.println("관리자 산책기록 확인"+walkLogVo);

            // 서비스를 호출하여 좌표 데이터 저장
            moWebService.walkLogInsert(walkLogVo); // 여기서 셀렉트키 반환

	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        result = "에러: " + e.getMessage();
	        return result;
	    }
	}

	// 로그인 모바일메인화면 맵실행
	@RequestMapping(value = "/map", method = { RequestMethod.GET, RequestMethod.POST })
	public String map(HttpSession session, Model dogModel) {
		System.out.println("모바일 산책창");
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		// 강아지정보 불러오기
		List<MoDogVo> dogList = moWebService.dogSelect(authUser.getUserNo());

		System.out.println("내 강아지 리스트 " + dogList);

		dogModel.addAttribute("dogList", dogList);

		return "mobileWeb/walkStart";
	}	
	
	// 동네검색
	@ResponseBody
	@RequestMapping("/locationSelect")
	public List<UseTrailVo> location(@RequestBody LocationVo locationVo) {
		System.out.println("주소로 산책로 검색");		
		System.out.println(locationVo);
		List<UseTrailVo> trailList  = moWebService.trailSelect(locationVo);
		System.out.println("산책로 정보 가져오기 성공 " + trailList);
		return trailList;
	}
	

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		System.out.println("모바일 로그아웃");
		// 세션의 모든 값을 지움.
		session.invalidate();
		return "redirect:/";
	}

	// 산책기록폼
	@RequestMapping("/wif")
	public String wif(@ModelAttribute MoWalkLogVo moWalkLogVo, Model walkLogModel,
			@RequestParam(name = "line") String lineData, Model lineModel,
			@RequestParam(name = "dogList") String dogList, Model dogModel, Model trailModel,
			@RequestParam(name = "location") String location)
			throws JsonParseException, JsonMappingException, IOException {

		System.out.println("주소 "+location);
		
		int locationNo = moWebService.locationSelect(location);		
		
		// 산책기록		
		moWalkLogVo.setLocationNo(locationNo);
		System.out.println("산책기록 " + moWalkLogVo);
		walkLogModel.addAttribute("moWalkLogVo", moWalkLogVo);

		// 산책한강아지 -------------------------------------------------
		// 쉼표(,)를 기준으로 문자열을 분할하여 List로 변환
		List<String> dogNoList = Arrays.asList(dogList.split(","));

		System.out.println("산책한 강아지 번호 " + dogList);

		dogModel.addAttribute("dogNoList", dogList);

		// 산책한경로좌표 ------------------------------------------------
		System.out.println("wif" + lineData);

		// URL 디코딩을 수행하여 JSON 문자열을 원래 형식으로 변환
		String decodedJson = URLDecoder.decode(lineData, StandardCharsets.UTF_8);

		// JSON 문자열을 파싱하여 객체로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		List<LinePathVo> lineList = objectMapper.readValue(decodedJson, new TypeReference<List<LinePathVo>>() {
		});

		// lineData를 사용하여 다른 작업을 수행
		System.out.println("lineList" + lineList);
		lineModel.addAttribute("lineList", objectMapper.writeValueAsString(lineList)); // JSON 형식의 문자열로 변환하여 전달
		System.out.println(objectMapper.writeValueAsString(lineList));

		// 주변산책로 ---------------------------------------------------		
		List<MoTrailVo> trailList = moWebService.trailSelect(locationNo);
		System.out.println("산책로3개 컨트롤러" + trailList);

		trailModel.addAttribute("trailList", trailList);

		return "mobileWeb/walkEnd"; // wif 페이지로 이동
	}

	// 산책 기록하기
	@ResponseBody
	@RequestMapping("/walkInsert")
	public MoWalkLogVo walkInsert(@RequestBody MoWalkLogVo moWalkLogVo, HttpSession session) {
		System.out.println("산책기록하기 walkInsert");
		// 세션에서 유저정보 가져오기
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		// 유저번호 산책Vo에 세팅
		moWalkLogVo.setUserNo(authUser.getUserNo());
		System.out.println(authUser.getUserNo());
		moWebService.walkLogInsert(moWalkLogVo); // 여기서 셀렉트키 반환
		return moWalkLogVo; // ajax로 재반환
	}

	// 첨부이미지 기록하기
	@RequestMapping("/imagesInsert")
	public ResponseEntity<String> handleImagesInsert(
	        @RequestParam("walkLogNo") int walkLogNo,
	        @RequestPart("image") MultipartFile image) {		
		System.out.println("셀렉트키 : " +walkLogNo+"/   첨부이미지리스트 : " + image);	
		// 이제 이미지들을 DB저장 해주기		
		moWebService.imgsSave(walkLogNo,image);		
		// 처리 결과에 따라 응답을 구성
        String responseMessage = "File uploaded successfully.";
        return ResponseEntity.ok(responseMessage);
	}

//------------------------------------------------------------------------------------------
	// 맵 캡쳐하는 페이지
	@RequestMapping("/walkMap")
	public String walkMap(@RequestParam(name = "walkLogNo") int walkLogNo, Model model) {
		System.out.println("맵 캡쳐");
		System.out.println(walkLogNo);
		List<CoordsVo> coordList = moWebService.mapSelect(walkLogNo);
		
		// CoordsVo를 JSON 문자열로 변환하여 모델에 추가 (나중에 클래스로 뺄 수 있음)
		StringBuilder jsonBuilder = new StringBuilder("[");
		for (CoordsVo coordVo : coordList) {
			if (jsonBuilder.length() > 1) {
				jsonBuilder.append(",");
			}
			jsonBuilder.append("{\"lat\":").append(coordVo.getLat()).append(",\"lng\":").append(coordVo.getLng())
					.append("}");
		}
		jsonBuilder.append("]");
		
		System.out.println(jsonBuilder.toString());
		model.addAttribute("lineList", jsonBuilder.toString());
		return "mobileWeb/walkMap";
	}

//------------------------------------------------------------------------------------------	

	// 산책로 알고리즘
	@RequestMapping("/trailMap")
	public String map() {
		System.out.println("/산책로 알고리즘");
		return "global/dogMapExample";
	}

}
