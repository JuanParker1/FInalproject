package kr.or.ddit.excel.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.or.ddit.excel.mapper.ExcelMapper;
import kr.or.ddit.excel.service.ExcelService;

@Service
public class ExcelServiceimpl implements ExcelService{
	private static final Logger logger = 
			LoggerFactory.getLogger(ExcelServiceimpl.class);
	
	@Autowired ExcelMapper excelMapper;
	
	@Override
    public void excelUpload(File destFile) {
        
        ExcelReadOption excelReadOption = new ExcelReadOption();
        
        //파일경로 추가
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        
        //추출할 컬럼명 추가
        excelReadOption.setOutputColumns("A", "B", "C");
        
        //시작행
        excelReadOption.setStartRow(2);
        
        List<Map<String, String>>excelContent  = ExcelRead.read(excelReadOption);
        
        logger.info("excelContent: "+excelContent);
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("excelContent", excelContent);
        
        logger.info("paramMap: "+paramMap);
        try {
            excelMapper.insertExcel(paramMap);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

}
