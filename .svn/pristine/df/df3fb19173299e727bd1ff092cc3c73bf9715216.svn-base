package lcn.poc.sample.dao;

import java.util.List;

import lcn.module.framework.base.AbstractDAO;
import lcn.poc.sample.model.SampleDefaultVO;
import lcn.poc.sample.model.SampleVO;

import org.springframework.stereotype.Repository;


/**  
 * @Class Name : SampleDAO.java
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

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertSample(SampleVO vo) {
        return (String)insert("sampleDAO.insertSample_S", vo);
    }

    /**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
    public int updateSample(SampleVO vo) {
        return update("sampleDAO.updateSample_S", vo);
    }

    /**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형 
	 * @exception Exception
	 */
    public int deleteSample(SampleVO vo) {
        return delete("sampleDAO.deleteSample_S", vo);
    }

    /**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
    public SampleVO selectSample(SampleVO vo) {
        return (SampleVO) selectByPk("sampleDAO.selectSample_S", vo);
    }

    /**
	 * 글 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
    public List selectSampleList(SampleDefaultVO searchVO) {
        return list("sampleDAO.selectSampleList_D", searchVO);
    }

    /**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
    public int selectSampleListTotCnt(SampleDefaultVO searchVO) {
        return (Integer)getSqlMapClientTemplate().queryForObject("sampleDAO.selectSampleListTotCnt_S", searchVO);
    }

}
