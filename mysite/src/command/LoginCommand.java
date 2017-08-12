package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

public class LoginCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		
		//로그인되어 있는지 체크
		if(session.getAttribute("userID")!= null){
			
			//이미로그인 되어 있는 경우 에러 출력, 이미 로그인되어 있는경우 로그인으로 접근할 수 있는 메뉴가 사라짐.
			return "/error/accessError.jsp";	
		}
		
		String userID= request.getParameter("userID");
		String userPassword= request.getParameter("userPassword");
		
		UserDao userDao= new UserDao();
		int result= userDao.login(userID, userPassword);
		
		//로그인 성공
		if(result== 1){
			session.setAttribute("userID", userID);
			return "main.jsp";
		
		//패스워드 불일치
		}else if(result== 0){
			request.setAttribute("errorType", "invalidPassword");
			return "/error/loginError.jsp";
		
		//아이디 없음
		}else if(result== -1){
			request.setAttribute("errorType", "invalidUserID");
			return "/error/loginError.jsp";
		
		//데이터베이스 오류
		}else if(result== -2){
			request.setAttribute("errorType", "dbError");
			return "/error/loginError.jsp";
			
		}
		return null;
	} //execute method end
} //Class end
