package kr.or.ddit.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserUtil {
	
	private static final Logger logger =
			LoggerFactory.getLogger(UserUtil.class);
	
	
	//공유해서 사용하기 위하여 public static을 붙여서 어느곳에서나 공유하면서 사용하게 만듬
	public static Map<String, String> getPageHeader(String subtitle, String title){
		Map<String, String> pageHeader = new HashMap<String, String>();
		pageHeader.put("subtitle", subtitle);
		pageHeader.put("title", title);
		
		return pageHeader;
	}
	
	//첨부파일을 보관하는 폴더를 연/월/일 계층형태로 생성하기 위함
	private static String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	//특정한 파일이 이미지 타입인지 검사해주는메서드
	private static boolean checkImageType(File file) {
		try {
			logger.info("file.topath(): "+file.toPath());
			String contentType = Files.probeContentType(file.toPath());
			logger.info("contentType: "+contentType);
			//contentType이 image로 시작하면 이미지타입이므로 
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
