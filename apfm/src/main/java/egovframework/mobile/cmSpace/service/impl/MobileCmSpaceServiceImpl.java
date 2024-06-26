package egovframework.mobile.cmSpace.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.mobile.cmSpace.service.BbsVO;
import egovframework.mobile.cmSpace.service.MobileCmSpaceService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mobileCmSpaceService")
public class MobileCmSpaceServiceImpl extends EgovAbstractServiceImpl implements MobileCmSpaceService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MobileCmSpaceServiceImpl.class);
	
	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "mobileCmSpaceMapper")
	private MobileCmSpaceMapper mobileCmSpaceMapper;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;
	
	// 센터소식 목록
	@Override
	public List<EgovMap> getCenterNewsList(BbsVO vo){
		return mobileCmSpaceMapper.getCenterNewsList(vo);
	}
	
	// 센터소식 목록 최신 5개(알려드려요)
	@Override	
	public List<EgovMap> getCenterNewsListALimit(BbsVO vo) {
		return mobileCmSpaceMapper.getCenterNewsListALimit(vo);	
	}
	
	// 공지사항 목록
	public List<EgovMap> getNoticeList(BbsVO vo) {
		return mobileCmSpaceMapper.getNoticeList(vo);
	}
		
	// 문서자료실 목록
	public List<EgovMap> getCrLibraryList(BbsVO vo) {
		return mobileCmSpaceMapper.getCrLibraryList(vo);
	}
	
	// 자유게시판 목록
	public List<EgovMap> getFreeBbsList(BbsVO vo) {
		return mobileCmSpaceMapper.getFreeBbsList(vo);
	}
			
		
	// 센터소식 상세
	@Override
	public EgovMap getCenterNewsDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getCenterNewsDtl(vo);
	}
	
	// 센터소식 파일 상세
	public List<EgovMap> getCenterNewsFileDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getCenterNewsFileDtl(vo);
	}
	
	// 공지사항 상세
	@Override
	public EgovMap getNoticeDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getNoticeDtl(vo);
	}
	
	// 공지사항 상세 파일 목록
	@Override
	public List<EgovMap> getNoticeFileDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getNoticeFileDtl(vo);
	}
	
	
	// 문서자료실 상세
	@Override
	public EgovMap getCareLibraryDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getCareLibraryDtl(vo);
	}
	
	// 문서자료실 상세 파일 목록
	@Override
	public List<EgovMap> getCareLibraryFileDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getCareLibraryFileDtl(vo);
	}
	
	
	// 자유게시판 상세
	@Override
	public EgovMap getFreeBbsDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getFreeBbsDtl(vo);
	}
	
	// 자유게시판 상세 파일 목록
	@Override
	public List<EgovMap> getFreeBbsFileDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getFreeBbsFileDtl(vo);
	}
	
	// 게시판 상세보기(자유게시판)
	/*@Override
	public EgovMap getFreeBbsBDtl(BbsVO vo) {
		return mobileCmSpaceMapper.getFreeBbsBDtl(vo);
	}*/
	
	// 게시판 등록(자유게시판)
	@Override
	public void insertFreeBbsBReg(BbsVO vo) throws Exception {
		mobileCmSpaceMapper.insertFreeBbsBReg(vo);
		// MultipartFile file = vo.getFile();
		// EgovMap fMap = fileUpload(file, vo);
		/*if(vo.getFile().getSize() != 0){
			// mobileFreeBbsMapper.insertFreeBbsBFileUpload(vo);
			
			
			if(vo.getFile().getSize() != 0) {
				System.out.println("File Upload Start");
				MultipartFile file = vo.getFile();
				System.out.println("Upload File Name : " + vo.getFile().getName());
				
				EgovMap fMap = fileUpload(file, vo);
				
				System.out.println("File Upload End");
				
				fMap.put("regId", vo.getRegId());
				fMap.put("writer", vo.getWriter());
				
				vo.setFileNm(fMap.get("fileNm").toString());
				vo.setSysFileNm(fMap.get("sysFileNm").toString());
				vo.setFilePath(fMap.get("filePath").toString());
				try {
					vo.setFileSize(Integer.parseInt(fMap.get("fileSize").toString()));
				}catch(Exception err) {
					vo.setFileSize(0);
				}
				mobileCmSpaceMapper.insertFreeBbsBFileUpload(vo);
			}
		}else {
			vo.setFileNm(null);
			vo.setSysFileNm(null);
			vo.setFilePath(null);
			mobileCmSpaceMapper.insertFreeBbsBFileUpload(vo);
			// vo.setFileSize(0);
		}*/
			
	}
	
	// 파일 업로드
	
	/*public static EgovMap fileUpload(MultipartFile file, BbsVO vo){
		
		try {
			EgovMap map = new EgovMap();	
			// 로컬 File Path
			String FILE_PATH = "C:/Users/BeadNet/eclipse-workspace/ggsc/src/main/webapp/images/upload/req/";
			// 경기도청 File Path
			// String FILE_PATH = "/software/tomcat/webapps/files/";
			String orgfilename = "";
			String sysfilename = "";
			Long size;
			String saveFileName = "";
			
			 파일업로드 Start 
			
			// 파일 정보
			orgfilename = file.getOriginalFilename();
			System.out.println("orgfilename =============   "+ orgfilename);
			if(orgfilename.length() > 0){
				sysfilename = orgfilename.substring(orgfilename.lastIndexOf("."), orgfilename.length());
				size = file.getSize();
				
				
				System.out.println("sysfilename =============   "+ sysfilename);
				System.out.println("size =============   "+ size);
				
				// 서버에서 저장 할 시스템 파일 이름
				saveFileName = genSaveFileName(sysfilename);
				
				
				System.out.println("saveFileName : " + saveFileName);
				
				//writeFile(file, saveFileName);
				//url = PREFIX_URL + saveFileName;
				boolean result = false;

				byte[] data = file.getBytes();
				FileOutputStream fos = new FileOutputStream(FILE_PATH + "/" + saveFileName);
				fos.write(data);
				fos.close();
				
				// data type long => int 변경
				vo.setFileSize((int) file.getSize());
				vo.setFileNm(orgfilename);
				vo.setSysFileNm(saveFileName);
				vo.setFilePath(FILE_PATH);
				
			}else{
				
			}
			return map;
		} catch (FileNotFoundException e) {
			System.out.println("EgovMap fileUpload error 1");
			return null;
		} catch (IOException e) {
			System.out.println("EgovMap fileUpload error 2");
			return null;
		}
	}*/
	
	public static EgovMap fileUpload(MultipartFile file,BbsVO  vo) throws IOException {
		EgovMap map = new EgovMap();
		if (file.getSize() > 0) {
			String fileRoot = utility.func.filePath;
			String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			// 랜덤 UUID+확장자로 저장될 savedFileName
			String savedFileName = UUID.randomUUID() + extension;
			
		
			map.put("fileNm", originalFileName);
			map.put("fileSize", file.getSize());

			String[] exts = new String[] { "jpg", "jpeg", "bmp", "png", "psd", "doc", "docx", "xls", "xlsx", "ppt",
					"pptx", "zip", "txt" };

			boolean uploadOK = false;
			for (String a : exts) {
				if (a.equals(extension.substring(1, extension.length()).toLowerCase())) {
					uploadOK = true;
					break;
				}
			}

			System.out.println("file extension : " + extension);

			if (!uploadOK) {
				System.out.println("file upload false");
				map.put("fileNm", "");
				map.put("sysFileNm", "");
				map.put("filePath", "");
				map.put("fileSize", 0);
				System.out.println("file upload false return > " + map.toString());
				return map;
			}

			File Folder = new File(fileRoot);
			if (!Folder.exists()) {
				try {
					Folder.mkdir(); // 폴더 생성합니다.
					Folder.setWritable(true); // 쓰기가능설정
					Folder.setReadable(true); // 읽기가능설정
				} catch (NullPointerException e) {
					utility.func.Logging("fileUpload", "Folder Null");
				}
			}

			File targetFile = new File(fileRoot + savedFileName);
			try {				
				byte[] data = file.getBytes();
				FileOutputStream fos = new FileOutputStream(fileRoot + savedFileName);
				fos.write(data);
				fos.close();
				
				// data type long => int 변경
				vo.setFileSize((int) file.getSize());
				vo.setFileNm(originalFileName);
				vo.setSysFileNm(savedFileName);
				vo.setFilePath("");
				
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 실패시 저장된 파일 삭제
				utility.func.Logging("fileUpload", "IO");
			}

		} else {
			map.put("fileNm", "");
			map.put("sysFileNm", "");
			map.put("filePath", "");
			map.put("fileSize", 0);
		}
		return map;
	}
	
	/**
	 * 파일 name 추출
	 * @param extName
	 * @return
	 */
	private static String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	}