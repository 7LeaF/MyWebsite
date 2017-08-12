package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BbsDao;
import dto.BbsDto;

public class BoardDeleteActionCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		
		String userID= null;
		int bbsID= 0;
		BbsDao bbsDao= new BbsDao();
		
		if(session.getAttribute("userID")!= null){
			userID= (String) session.getAttribute("userID");
		}
		
		if(request.getParameter("bbsID")!= null){
			bbsID= Integer.parseInt(request.getParameter("bbsID"));
		}
		
			
		//로그인 체크
		if(userID== null){
			request.setAttribute("errorType", "isNotLogin");
			return "/error/boardDeleteError.jsp";	
		}
		
		//게시글 번호 파라미터 임의 조작으로 인한 데이터베이스 오류 방지
		if(bbsID <= 0 || bbsDao.getNext() <= bbsID){
			request.setAttribute("errorType", "invalidContent");
			return "/error/boardDeleteError.jsp";
		}
		
		
		//글 작성자가 아닌 경우 글삭제 금지
		BbsDto content= bbsDao.getBbs(bbsID);
		
		if(!userID.equals(content.getUserID())){
			request.setAttribute("errorType", "notAuth");
			return "/error/boardDeleteError.jsp";
		}
		
		//글 삭제
		int result= bbsDao.delete(bbsID);
		
		if(result== -1){
			request.setAttribute("errorType", "deleteFail");
			return "/error/boardDeleteError.jsp";
		
		}else{
			return "bbs.do";	
		
		}
	}
	

}
