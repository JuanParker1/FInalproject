package kr.or.ddit.cus.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cus.mapper.CusMapper;
import kr.or.ddit.cus.service.CusService;
import kr.or.ddit.cus.vo.AttachFilesVO;
import kr.or.ddit.cus.vo.CusVO;
import net.coobird.thumbnailator.Thumbnailator;

@Service
public class CusServiceimpl implements CusService {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(CusServiceimpl.class);
	
	@Autowired CusMapper cusMapper;
	
	
	//고객 등록
		@Override
		public int insert(CusVO cusVO) {
			//1) cus 테이블로 insert
			int result = cusMapper.insert(cusVO);
			
			//업로드한 파일 객체들
			MultipartFile[] uploadFile = cusVO.getUploadFile();
			
			//파일 저장 경로 설정
			String uploadFolder = "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\dasuriProj\\src\\main\\webapp\\resources\\upload";
			
			//연/월/일 폴더 생성 시작-------
			File uploadPath = new File(uploadFolder, getFolder());
			logger.info("uploadPath : " + uploadPath);
			
			if(uploadPath.exists()==false) {//해당 경로가 없으면 생성해줘야함
				uploadPath.mkdirs();			
			}
			//연/월/일 폴더 생성 끝-------
			
			//업로드한 파일 객체들의 파일명과 크기 정보를 넣은 후 insert 할 리스트 객체
			List<AttachFilesVO> list = new ArrayList<AttachFilesVO>();
			
			int seq = 1;
			
			//이미지 3개를 업로드 한다면 3회 반복
			for(MultipartFile multipartFile : uploadFile) {
				logger.info("-----------");
				logger.info("파일명 : " + multipartFile.getOriginalFilename());
				logger.info("파일크기 : " + multipartFile.getSize());
				
				//각 파일 별로 세팅할 VO 
				AttachFilesVO vo = new AttachFilesVO();
				//1) 파일id(기본키데이터), 파일시퀀스번호,파일명과 크기를 세팅
				vo.setId(cusVO.getCusNum());	//고정값
				vo.setSeq(seq++);
				vo.setUploadFileSize(""+multipartFile.getSize());
				vo.setRegisterId("admin");//로그인 한 아디디로 교체해야 함
				//-----------UUID 파일명 처리 시작 ----------------------------
				//동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기 위함
				UUID uuid = UUID.randomUUID();
				
				String uploadFileName = uuid.toString() + "-" + multipartFile.getOriginalFilename();
				// c:\\upload\\gongu03.jpg으로 조립
				// 이렇게 업로드 하겠다라고 설계 uploadFolder -> uploadPath
				// /resources/upload/2022/02/21/asdfsadfsdafsda_test.jpg
				vo.setUploadFileName("/resources/upload/" + getFolder() + "/" + uploadFileName);
				
				File saveFile = new File(uploadPath,uploadFileName);
				//-----------UUID 파일명 처리 끝 ----------------------------
				
				try {
					//transferTo() : 물리적으로 파일 업로드가 됨
					multipartFile.transferTo(saveFile);
				
					//-------썸네일 처리 시작---------
					//이미지 파일인지 체킹
					if(checkImageType(saveFile)) {
						logger.info("이미지 파일? true");
						//uploadPath : 연/월/일이 포함된 경로
						//uploadFileName : UUID가 포함된 파일명
						FileOutputStream thumbnail = 
								new FileOutputStream(
										new File(uploadPath,"s_"+uploadFileName));
						Thumbnailator.createThumbnail(multipartFile.getInputStream(),
								thumbnail, 100, 100);
						thumbnail.close();
						logger.info("파일명: "+thumbnail);
					}else {
						logger.info("이미지 파일? false");
					}
					//-------썸네일 처리 끝---------
					
					//파일 실제 명을 list에 담음
					list.add(vo);
				}catch(Exception e){
					logger.info(e.getMessage());
				}//end catch
			}//end for
			
//			logger.info("attachFilesVO : " + attachFilesVO.get(0).toString());
			
			//attach_files 테이블로 insert
			int filesResult = cusMapper.insertAttachFiles(list);
			logger.info("1이면 파일 업로드 성공: "+filesResult);
			
			return result;
		}
	
	// 목록 출력
	@Override
	public List<CusVO>list(Map<String, Object>map){
		return this.cusMapper.list(map);
	}
	
	
	//페이지네이션을 위한 카운트
	@Override
	public int cusCount (Map<String, Object>map) {
		return this.cusMapper.cusCount(map);
	}
	
	//상세보기
	@Override
	public List<CusVO> detail (String cusNum){
		return this.cusMapper.detail(cusNum);
	}
	
	//-----------------------------------파일 업로드를 위한 메서드--------------------------------------
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	
	private boolean checkImageType(File file) {
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
	
	

//	@Override
//	public List<CusVO>list(Map<String, Object>map){
//		return this.cusMapper.list(map);
//	}
	
}
