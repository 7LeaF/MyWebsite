package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BbsDao;
import dto.BbsDto;

public class BoardContentViewCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		
		String userID= null;
		if(session.getAttribute("userID")!= null){
			userID= (String) session.getAttribute("userID");
		}
		
		int bbsID= 0;
		if(request.getParameter("bbsID")!= null){
			bbsID= Integer.parseInt(request.getParameter("bbsID"));
		}
		
		BbsDao bbsDao= new BbsDao();
		BbsDto content= new BbsDto();
		
		//게시글 번호 파라미터 임의 조작으로 인한 데이터베이스 오류 방지
		if(bbsID <= 0 || bbsDao.getNext() <= bbsID){
			request.setAttribute("errorType", "invalidContent");
			return "/error/boardViewError.jsp";
		}
		
		
		//게시글 내용 request 객체에 저장
		content= bbsDao.getBbs(bbsID);
		request.setAttribute("content", content);
		
		
		// 로그인한 사용자가 글쓴이인지 확인 (수정/삭제 버튼 enable/disable)
		boolean isWriter= false;
		if(userID != null && userID.equals(content.getUserID())){
			isWriter= true;
		}
		System.out.println(userID +" / "+ content.getUserID() +" / "+ isWriter);;
		
		request.setAttribute("isWriter", isWriter);
		
		
		return "/board/view.jsp";
	
	} //execute method end
} //Class end
