package command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.UserDto;

public class JoinCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session= request.getSession();
	
		//로그인되어 있는지 체크
		if(session.getAttribute("userID")!= null){

			//이미로그인 되어 있는 경우 에러 출력, 이미 로그인되어 있는경우 회원가입으로 접근할 수 있는 메뉴가 사라짐.
			return "/error/accessError.jsp";
		}
		
		//회원가입 폼에서 받아온 데이터를 DTO 클래스에 삽입
		UserDto userDto= new UserDto();
		
		userDto.setUserID(request.getParameter("userID"));
		userDto.setUserPassword(request.getParameter("userPassword"));
		userDto.setUserName(request.getParameter("userName"));
		userDto.setUserGender(request.getParameter("userGender"));
		userDto.setUserEmail(request.getParameter("userEmail"));

		//입력 되지 않은 값이 있는지 체크
		if(userDto.getUserID().equals("") || userDto.getUserPassword().equals("") || userDto.getUserName().equals("") 
				|| userDto.getUserGender().equals("") || userDto.getUserEmail().equals("")){
			
			request.setAttribute("errorType", "isNull");
			return "/error/joinError.jsp";
		}else{
			UserDao userDao= new UserDao();
			int result= userDao.join(userDto);
			
			//아이디 중복 체크
			if(result== -1){
				request.setAttribute("errorType", "isMember");
				return "/error/joinError.jsp";
				
			}else{
				session.setAttribute("userID", userDto.getUserID());
				return "main.jsp";
				
			}
		}
	} //execute method end
} //Class end
