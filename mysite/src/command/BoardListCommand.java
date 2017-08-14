package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDao;
import dto.BbsDto;

public class BoardListCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//현재 페이지 설정, 없으면 첫 페이지로 설정
		int pageNumber= 1;
		if (request.getParameter("pageNumber") != null){
			pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
		}
		request.setAttribute("pageNumber", pageNumber);
		
		//데이터베이스에서 게시판 글 리스트를 받아옴
		BbsDao bbsDao= new BbsDao();
		ArrayList<BbsDto> list= bbsDao.getList(pageNumber);
		request.setAttribute("list", list);
		
		//페이지 선택 기능을 위해 다음 페이지가 있는지 확인
		boolean isNextPage= bbsDao.nextPage(pageNumber+1);
		request.setAttribute("isNextPage", isNextPage);
		
		
		return "/board/bbs.jsp";

	} //execute method end
} //Class End
