package lcn.poc.sample.controller;

import java.util.List;

import javax.annotation.Resource;

import lcn.module.common.paging.PaginationInfo;
import lcn.module.framework.property.PropertyService;
import lcn.module.miplatform.MiPlatformModel;
import lcn.module.miplatform.MiPlatformObject;
import lcn.poc.sample.model.SampleDefaultVO;
import lcn.poc.sample.model.SampleVO;
import lcn.poc.sample.service.SampleService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;



/**  
 * @Class Name : LotteSampleController.java
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

@Controller
public class SampleMipController {
	private static final Logger log = Logger.getLogger(SampleMipController.class);
	
	/** LotteSampleService */
    @Resource(name = "sampleService")
    private SampleService sampleService;
    
    /** LottePropertyService */
    @Resource(name = "propertiesService")
    protected PropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
    /**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "/sample/lotteSampleList"
	 * @exception Exception
	 */
    @RequestMapping("/sample/selectSampleList.mip")
    @SuppressWarnings("unchecked")    
    public ModelAndView selectSampleList(MiPlatformObject miplatformVO, MiPlatformModel mipModel) throws Exception {

    	SampleDefaultVO searchVO = 
    		(SampleDefaultVO)miplatformVO.getModelAttribute(
    				SampleDefaultVO.class.getCanonicalName());


    	/** LottePropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing setting */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
    	List sampleList = sampleService.selectSampleList(searchVO);
        
        mipModel.addAttribute(sampleList); // ("dsOutput", sampleList);
        
        return mipModel.success(); 

    } 
   
    
    @RequestMapping("/sample/saveSampleList.mip")
    @SuppressWarnings("unchecked")    
    public ModelAndView saveSampleList(MiPlatformObject miplatformVO, MiPlatformModel mipModel ) throws Exception {

    	List samples = miplatformVO.getModelAttributes(SampleVO.class.getCanonicalName(), "dsInput");
    	log.debug("[saveSampleList.dsInput]" + samples); 
    	
    	int resultCount = 
    		sampleService.saveSampleList(samples);
		log.debug("[saveSampleList.resultCount]" + resultCount);  
	         
	    return mipModel.success(); 
    } 
   

}
