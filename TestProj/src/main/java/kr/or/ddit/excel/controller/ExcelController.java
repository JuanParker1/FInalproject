package kr.or.ddit.excel.controller;

import java.io.File;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.excel.service.ExcelService;

@Controller
public class ExcelController {

	@Autowired ExcelService excelService;
	
	@RequestMapping("/test")
	public String excelpage() {
		return "/excel/test";
	}
	
	@ResponseBody
	@PostMapping(value="/excelUploadAjax.do")
	public ModelAndView excelPost(MultipartFile testFile, MultipartHttpServletRequest req) throws Exception {
		MultipartFile excelFile = req.getFile("excelFile");
		
		if(excelFile==null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택하세요");
		}
		File destFile = new File("C:\\upload\\"+excelFile.getOriginalFilename());
			try {
				excelFile.transferTo(destFile);
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage(),e);
			}
			excelService.excelUpload(destFile);
			
			destFile.delete();
		
			ModelAndView view = new ModelAndView();
			view.setViewName("/test");
			return view;
		}
	
	
	@RequestMapping(value="/main")
	public String excelmain() {
		return "main";
	}
}
