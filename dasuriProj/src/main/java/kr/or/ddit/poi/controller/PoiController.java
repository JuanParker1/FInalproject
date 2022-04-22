package kr.or.ddit.poi.controller;



import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.util.UserUtil;

@RequestMapping("/poi")
@Controller
public class PoiController {
	
	private static final Logger logger =
			LoggerFactory.getLogger(PoiController.class);
	
	
	@GetMapping("/page")
	public String poipage(Model model) {
		model.addAttribute("pageHeader",UserUtil.getPageHeader("Apache-Poi", "엑셀파일다운로드"));
		return "poi/page";
	}
	
	
	@RequestMapping(value = "/page", method = RequestMethod.POST)
	public void poiTest(Model model, HttpServletResponse response,
			HttpServletRequest request) throws Exception{
		//jsp에서 넘긴 값을 받아서 날짜 입력받음
		String day1 = request.getParameter("day1"); // 2021-05-01
		String day2 = request.getParameter("day2"); // 2021-05-30
		
		logger.info("day1: "+day1+"/ day2: "+day2);
		/*
		실제로는 DB 데이터를 추출하는 경우가 많기 때문에 날짜데이터를 예시로 든다면.
		웹에서 사용자가 day1 과 day2 를 넘겨주고. 컨트롤러에서 service로 데이터를 넘기고.
		dao에서 mapper를 통해  day1 과 day2 날짜 사이의 데이터들을 출력할 것이다.
		그 데이터들은 list 에 담아서 활용한다고 가정해보자 !
		 */

		List<String> list = new ArrayList<String>();
		// 활용 팁 : service dao 를 통해 입력받은 2021-05-01 ~ 2021-05-30 일자로
		//        데이터 조회를 후 list에 담았다고 가정하자.
		
		list.add("김영훈"); // 샘플데이터1
		list.add("김진석"); // 샘플데이터2
		list.add("박채린"); // 샘플데이터3
		list.add("조하영"); // 샘플데이터4
		list.add("장유진"); // 샘플데이터5
		list.add("박지은"); // 샘플데이터6
		
		//필수로 만들어야할 것 Workbook과 Sheet
		Workbook wb = new HSSFWorkbook(); // 엑셀파일 객체 생성
		Sheet sheet = wb.createSheet("테스트 시트"); //시트 생성 ( 첫번째 시트이며, 시트명은 테스트 시트 )
		
		CellStyle style = wb.createCellStyle(); // 셀 스타일 생성
		Font font = wb.createFont(); // 폰트 스타일 생성
		
//       font.setBoldweight(Font.BOLDWEIGHT_BOLD); // 글자 진하게
       font.setFontHeight((short)(16*18)); // 글자 크기
       font.setFontName("맑은 고딕"); // 글씨체
       
       // 자바의 배열처럼 첫번째 인덱스가 0 부터 시작한다.  첫번째는 0 , 두번째는 1 , 세번째는 2
       Row titleRow = sheet.createRow(0); // 타이틀행을 생성한다. 첫번째줄이기때문에 createRow(0)
       int titleColNum = 0; // 첫번째 열이기 때문에 0 
		Cell titleCell = titleRow.createCell(titleColNum); // 첫번째행의 첫번째열을 지정한다. 
		titleCell.setCellValue("안녕하세요 \n 테스트입니다."); // setCellValue 셀에 값넣기.
		titleRow.setHeight((short)920); // Row에서 setHeight를 하면 행 높이가 조정된다. 
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,9)); // 셀 병합  첫번째줄~아홉번째 열까지 병합 
		// new CellRangeAddress(시작 row, 끝 row, 시작 col, 끝 col) 

		style.setWrapText(true); //문자열을 입력할때 \n 같은 개행을 인식해준다.
//		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 수직 가운데 정렬
//		style.setAlignment(CellStyle.ALIGN_CENTER); // 수평 가운데 정렬
		style.setFont(font); // 스타일에 font 스타일 적용하기
		titleCell.setCellStyle(style); // 정리한 스타일들을 titleCell에 적용해주자 !
		
		//입력받은 날짜 출력하기
		Row dayRow = sheet.createRow(1);
		int dayCol = 0;
		Cell dayCell = dayRow.createCell(dayCol); // 두번째줄의 첫번째열을 셀로 지정. 즉 두번째줄 첫째칸
		dayCell.setCellValue("조회날짜 : " + day1 + " ~ " + day2); // 두번째 행은 입력받은 날짜를 출력
		
		//헤더 만들기
		Row headerRow = sheet.createRow(3); // 네번째줄 생성
		int headerCol = 0;
		Cell headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("순번");
		headerCell = headerRow.createCell(headerCol);
		headerCell.setCellValue("이름");

		
		
		CellStyle dataStyle = wb.createCellStyle(); // 데이터스타일은 테두리를 만들어보자
		
//		dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN); //오른쪽 테두리
//		dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN); //왼쪽 테두리
//		dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN); // 상단 테두리
//		dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 하단 테두리
		
		
		//데이터 삽입하기
		int rowNum = 4; // 네번째줄이 헤더니까 그 밑에서부터 데이터 삽입
		int cellNum = 0;
		Row dataRow = null; // for문을 돌려주기위해.
		Cell dataCell = null;
		
		for(int i = 0; i<list.size(); i++) {
			cellNum = 0;
			dataRow = sheet.createRow(rowNum++); // for문 돌면서 행 1줄씩 추가
			
			dataCell = dataRow.createCell(cellNum++); //열 한줄씩 추가
			dataCell.setCellValue(i+1); // 첫번째칸은 순번이기때문에 
			dataCell.setCellStyle(dataStyle); // 테두리 스타일 적용
			
			dataCell = dataRow.createCell(cellNum); // 두번째 열은 이름이니까
			dataCell.setCellValue(list.get(i)); // list에 저장된 이름 출력
			dataCell.setCellStyle(dataStyle); // 테두리 스타일 적용
		}
		
		dataRow = sheet.createRow(rowNum++); // 총 인원을 작성해보자
		dataCell = dataRow.createCell(0); // 첫번쨰칸
		dataCell.setCellValue("총 인원");
		dataCell = dataRow.createCell(1); // 두번쨰칸
		dataCell.setCellFormula("COUNT(A5:A10)"); // 함수식을 입력할 수 있는 기능
		
		
		//-------------------------------------사진-----------------------------------------
		 try {
		    	/* 사진 삽입 위치 : filePath*/
		        String filePath = "template/img/test.jpg"; 
		        InputStream is = new FileInputStream(getClass().getClassLoader().getResource(filePath).getFile());
		        byte[] bytes = IOUtils.toByteArray(is);
		        int picIdx = wb.addPicture(bytes, XSSFWorkbook.PICTURE_TYPE_PNG);
		        is.close();

		        CreationHelper helper = wb.getCreationHelper();
		        Drawing drawing = sheet.createDrawingPatriarch();
		        ClientAnchor anchor = helper.createClientAnchor();
		       
		        // 이미지 출력할 엑셀 cell,row 위치
		        anchor.setRow1(12); //13번째줄
		        anchor.setCol1(4);  //3번째 셀

		        //이미지 그리기
		        Picture pic = drawing.createPicture(anchor, picIdx);
		        pic.resize();
		        
		    } catch (Exception e) {
		            e.printStackTrace();
		    }
			
		 /* 엑셀 파일 생성 */
	    response.setContentType("ms-vnd/excel");
	    //* 엑셀 파일 이름 지정 *
	    response.setHeader("Content-Disposition", "attachment;filename=poiTest.xls");
	    wb.write(response.getOutputStream());
	}
	
	
	@GetMapping("/webRtc")
	public String webRtc(Model model) {
		model.addAttribute("pageHeader",UserUtil.getPageHeader("webRtc", "화상회의"));
		return "poi/webRtc";
	}
	
}
 
 