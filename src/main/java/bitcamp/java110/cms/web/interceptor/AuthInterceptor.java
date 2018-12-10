package bitcamp.java110.cms.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.java110.cms.dao.BigTagDao;
import bitcamp.java110.cms.dao.MiddleTagDao;

@Service
public class AuthInterceptor implements HandlerInterceptor {
  
  @Autowired BigTagDao bigTagDao;
  @Autowired MiddleTagDao middleTagDao;
  
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
    ModelAndView modelAndView) throws Exception {
    modelAndView.addObject("BTlist", bigTagDao.findAll());
    modelAndView.addObject("MTlist", middleTagDao.findAll());
  }
    
//    @Override
//    public boolean preHandle(
//            HttpServletRequest request, 
//            HttpServletResponse response, 
//            Object handler) throws Exception {
//        
//        System.out.println("AuthInterceptor.preHandler()...");
//        
//       HttpSession session = request.getSession();
//        if (session.getAttribute("loginUser") == null) { // 로그인하지 않았으면
//            response.sendRedirect("/app/auth/form");
//            System.out.println("Asd");
//            return false; // 페이지 컨트롤러의 request handler를 실행하지 말라!
//        }else
//        return true;
//    }
   
    

}












