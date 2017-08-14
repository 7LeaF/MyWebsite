package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BbsDao;
import dto.BbsDto;

public class BoardWriteActionCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		
		//userID는 로그인 되었을 경우 생성되는 세션 속성 값
		String userID= null;
		if(session.getAttribute("userID")!= null){
			userID= (String) session.getAttribute("userID");
		}
		
		//로그인이 되어있지 않은 경우 글 쓰기 불가
		if(userID== null){
			request.setAttribute("errorType", "isNotLogin");
			return "/error/boardWriteError.jsp";
			
		}else{
			//로그인이 되어 있는 경우
			BbsDto bbsDto= new BbsDto();
			bbsDto.setBbsTitle(request.getParameter("bbsTitle"));
			bbsDto.setBbsContent(request.getParameter("bbsContent"));
			
			//제목, 내용 둘 중 하나가 비어있는지 체크
			if(bbsDto.getBbsTitle()== null || bbsDto.getBbsContent()== null){
				request.setAttribute("errorType", "isNull");
				return "/error/boardWriteError.jsp";
				
			}else{
				//제목, 내용 모두 작성되었다면 데이터베이스에 글 등록
				BbsDao bbsDao= new BbsDao();
				int result= bbsDao.write(bbsDto.getBbsTitle(), userID, bbsDto.getBbsContent());
				
				if (result == -1){
					//데이터베이스에 데이터 입력 과정 에서 오류 발생시 처리
					request.setAttribute("errorType", "writeError");
					return "/error/boardWriteError.jsp";
					
				}else {
					//글 정상 등록
					return "bbs.do";
					
				}
			}	
		}
	} //execute method end
} //Class end
