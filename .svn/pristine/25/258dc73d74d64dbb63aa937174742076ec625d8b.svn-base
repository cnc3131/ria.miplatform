package lcn.poc.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import lcn.module.common.exception.LotteRuntimeException;
import lcn.module.common.ria.RowStatus;
import lcn.module.framework.idgen.IdGnrService;
import lcn.poc.sample.dao.SampleDAO;
import lcn.poc.sample.model.SampleDefaultVO;
import lcn.poc.sample.model.SampleVO;
import lcn.poc.sample.service.SampleService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : SampleServiceImpl.java
 * @Description :
 * @Modification 
 * 
 * @author 
 * @since 2012.09.10
 * @version 1.0
 * @see Copyright (C) by LDCC All right reserved.
 */

@Service("sampleService")
public class SampleServiceImpl implements SampleService {
	protected Log log = LogFactory.getLog(this.getClass());

	/** SampleDAO */
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private IdGnrService egovIdGnrService;

	/**
	 * 글을 등록한다.
	 * 
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertSample(SampleVO vo) throws Exception {
		log.debug(vo.toString());

		/** ID Generation Service */
		String id = egovIdGnrService.getNextStringId();
		vo.setId(id);
		log.debug(vo.toString());

		sampleDAO.insertSample(vo);
		return id;
	}

	/**
	 * 글을 수정한다.
	 * 
	 * @param vo
	 *            - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateSample(SampleVO vo) {
		sampleDAO.updateSample(vo);
	}

	/**
	 * 글을 삭제한다.
	 * 
	 * @param vo
	 *            - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void deleteSample(SampleVO vo) {
		sampleDAO.deleteSample(vo);
	}

	/**
	 * 글을 조회한다.
	 * 
	 * @param vo
	 *            - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public SampleVO selectSample(SampleVO vo) {
		SampleVO resultVO = sampleDAO.selectSample(vo);
		// TODO: BizException 사례 제공
		// if (resultVO == null)
		// throw processException("info.nodata.msg");
		return resultVO;
	}

	/**
	 * 글 목록을 조회한다.
	 * 
	 * @param searchVO
	 *            - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List selectSampleList(SampleDefaultVO searchVO) {
		return sampleDAO.selectSampleList(searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * 
	 * @param searchVO
	 *            - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectSampleListTotCnt(SampleDefaultVO searchVO) {
		return sampleDAO.selectSampleListTotCnt(searchVO);
	}
	
	public int saveSampleList(List samples) {
		int rowCnt = 0;
		SampleVO sample = null;		
		for (int i = 0; i < samples.size(); i++) {
			sample = (SampleVO) samples.get(i);
			log.debug(sample);
			if(RowStatus.ROWTYPE_INSERT.equals(sample.getRowStatus())) {
				sampleDAO.insertSample(sample);
				rowCnt++;
			} else if(RowStatus.ROWTYPE_UPDATE.equals(sample.getRowStatus())) {
				rowCnt += sampleDAO.updateSample(sample);
			} else if(RowStatus.ROWTYPE_DELETE.equals(sample.getRowStatus())) {
				rowCnt += sampleDAO.deleteSample(sample);
			} else 
				throw new LotteRuntimeException("Row Status " + sample.getRowStatus() + " is not appropriate.");
		}
		return rowCnt;
	}

}
