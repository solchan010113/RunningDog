package com.runningdog.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.runningdog.service.MoWebService;
import com.runningdog.vo.AdminXYVo;
import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.MoDogVo;
import com.runningdog.vo.MoTrailVo;
import com.runningdog.vo.MoWalkLogVo;
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
		List<UseTrailVo> trailList = moWebService.trailSelect(locationVo);
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
		
		int locationNo = moWebService.locationSelect(location);	
		
		// 산책기록
		moWalkLogVo.setLocationNo(locationNo);
		walkLogModel.addAttribute("moWalkLogVo", moWalkLogVo);

		// 산책한강아지 -------------------------------------------------
		// 쉼표(,)를 기준으로 문자열을 분할하여 List로 변환
		//List<String> dogNoList = Arrays.asList(dogList.split(","));
		System.out.println("--산책한 강아지 번호 " + dogList);
		dogModel.addAttribute("dogNoList", dogList);

		// 산책한경로좌표 ------------------------------------------------
		System.out.println("--산책한 좌표들" + lineData);
		lineModel.addAttribute("lineList", lineData); // JSON 형식의 문자열로 변환하여 전달
		
		// 주변산책로 ---------------------------------------------------
		System.out.println("---------산책로 불러올때 쓸 값들-----------");
		System.out.println("산책기록 " + moWalkLogVo);
		System.out.println("주소 " + moWalkLogVo.getLocationNo());
		System.out.println("좌표 2 " + lineData);
		
		// moWebService.threeTrailSelect (lineData의 마지막 배열)
		List<UseTrailVo> trailList = moWebService.threeTrailSelect(lineData);			
		
		System.out.println("--산책로3개 컨트롤러" + trailList);
		
		// 참조 할 테이블 (산책로, 산책좌표)
		// 보내줄정보 (산책로이용정보,산책로찜)
		
		// MoWalkLogVo에 이용한 산책로 리스트 추가

		trailModel.addAttribute("trailList", trailList);

		return "mobileWeb/walkEnd"; // wif 페이지로 이동
	}

	// 산책 기록하기
	@ResponseBody
	@RequestMapping("/walkInsert")
	public MoWalkLogVo walkInsert(@RequestBody MoWalkLogVo moWalkLogVo, HttpSession session) {
		System.out.println("산책기록하기 walkInsert");
		System.out.println("저장직전 산책로 리스트확인 = "+moWalkLogVo.getTrailList());		
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
	public ResponseEntity<String> handleImagesInsert(@RequestParam("walkLogNo") int walkLogNo,
			@RequestPart("image") MultipartFile image) {
		System.out.println("셀렉트키 : " + walkLogNo + "/   첨부이미지리스트 : " + image);
		// 이제 이미지들을 DB저장 해주기
		moWebService.imgsSave(walkLogNo, image);
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

	
	// 관리자 로그인폼
	@RequestMapping("/admin")
	public String admin(HttpSession session) {
		return "mobileWeb/adminInsert";
	}
	
	// 관리자설정
	@RequestMapping("/adminInsert")
	public String saveCoords(@RequestBody AdminXYVo adminXYVo) {
		String result = "성공"; // 성공 기본값으로 설정

		System.out.println(adminXYVo);

		try {

			List<XYVo> coords = adminXYVo.getXyList();

			MoWalkLogVo walkLogVo = new MoWalkLogVo();

			walkLogVo.setPolylinePath(coords); // 좌표값

			// walkLogVo.setDogNoList(dogNoList); // 강아지값
			// walkLogVo.setLocationNo(1174010600); // 동네번호

			walkLogVo.setWalkLogNo(adminXYVo.getWalkLogNo()); // 산책기록 번호지정

			// 다른 MoWalkLogVo 속성들도 필요에 따라 설정
			System.out.println("관리자 산책기록 확인" + walkLogVo);

			// 서비스를 호출하여 좌표 데이터 업데이트
			moWebService.walkLogUpdate(walkLogVo); // 업데이트 함수
			// 서비스를 호출하여 좌표 데이터 저장
			// moWebService.walkLogInsert(walkLogVo); // 여기서 셀렉트키 반환

			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result = "에러: " + e.getMessage();
			return result;
		}
	}
	
	// --------------------------------------------------------------------
	

}
