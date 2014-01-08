package lcn.poc.sample.service;

import java.util.List;

import lcn.poc.sample.model.SampleDefaultVO;
import lcn.poc.sample.model.SampleVO;


/**  
 * @Class Name : SampleService.java
 * @Description : 
 * @Modification Information  
 * @
 * @  수정일      수정자              수정내용
 * @ ---------	---------	-------------------------------
 * @ 2012.09.10	최초생성
 * 
 * @author 
 * @since 2012.09.10
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by LDCC All right reserved.
 */
public interface SampleService {
	
	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertSample(SampleVO vo) throws Exception;
    
    /**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
    void updateSample(SampleVO vo) throws Exception;
    
    /**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteSample(SampleVO vo) throws Exception;
    
    /**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
    SampleVO selectSample(SampleVO vo) throws Exception;
    
    /**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
    List selectSampleList(SampleDefaultVO searchVO) throws Exception;
    
    /**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
    int selectSampleListTotCnt(SampleDefaultVO searchVO);
    
    public int saveSampleList(List samples);
}
