package lcn.poc.common.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**  
 * @Class Name : SystemArchitecture.java
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


@Aspect
public class SystemArchitecture {

  //==================  
  //modules
  //==================
	
  /**
   * A join point is in the web layer 
   */
  @Pointcut("within(ldcc..web..*)")
  public void inPresentationLayer() {}

  /**
   * A join point is in the service layer 
   */
  @Pointcut("within(ldcc..service..*)")
  public void inServiceLayer() {}

  /**
   * A join point is in the process layer 
   */
  @Pointcut("within(ldcc..process..*)")
  public void inProcessLayer() {}
  
  
  /**
   * A join point is in the data access layer 
   */
  @Pointcut("within(ldcc..dao..*)")
  public void inDataAccessLayer() {}

  //==================  
  //module operations
  //==================
  
  /**
   * A business service is the execution of any method defined on a controller
   * interface. 
   */
  @Pointcut("execution(* ldcc..service.web.*Impl.*(..))")
  public void controllerOperation() {}
  
  /**
   * A business service is the execution of any method defined on a service
   * interface. 
   */
  @Pointcut("execution(* ldcc..service.impl.*Impl.*(..))")
  public void businessService() {}
  
  /**
   * A business process is the execution of any method defined on a process
   * interface. 
   */
  @Pointcut("execution(* ldcc..service.process.*Impl.*(..))")
  public void businessProcess() {}
  
  /**
   * A data access operation is the execution of any method defined on a 
   * dao interface. 
   */
  @Pointcut("execution(* ldcc..dao.*DAO.*(..))")
  public void dataAccessOperation() {}

}
