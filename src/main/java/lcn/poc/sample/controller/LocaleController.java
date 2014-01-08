package lcn.poc.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**  
 * @Class Name : LocaleController.java
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
public class LocaleController {
	@RequestMapping(value = "/fw/common/web/changeLocale.do")

	//testing
	public String selectUserList() {
		//TODO: 설정 파일로 정의하기
		return "forward:/";
	}
}
