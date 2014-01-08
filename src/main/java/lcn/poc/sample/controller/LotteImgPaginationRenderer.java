package lcn.poc.sample.controller;

import lcn.module.common.paging.AbstractPaginationRenderer;

/**  
 * @Class Name : LotteImgPaginationRenderer.java
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
public class LotteImgPaginationRenderer extends AbstractPaginationRenderer {
	
    /**
    * PaginationRenderer
	* 
    * @see 
    */
	public LotteImgPaginationRenderer() {

		//String strWebDir = "/###ARTIFACT_ID###/images/lotte/fw/cmmn/";
		String strWebDir = "/web/images/lotte/fw/cmmn/";
		
		firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" +
							"<image src='" + strWebDir + "btn_page_pre10.gif' border=0/></a>&#160;"; 
        previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" +
        						"<image src='" + strWebDir + "btn_page_pre1.gif' border=0/></a>&#160;";
        currentPageLabel = "<strong>{0}</strong>&#160;";
        otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
        nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" +
        					"<image src='" + strWebDir + "btn_page_next10.gif' border=0/></a>&#160;";
        lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" +
        					"<image src='" + strWebDir + "btn_page_next1.gif' border=0/></a>&#160;";
	}
}
