package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDao;
import dto.BbsDto;

public class BoardUpdateViewCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int bbsID= Integer.parseInt(request.getParameter("bbsID"));
		
		BbsDao bbsDao= new BbsDao();
		BbsDto content= bbsDao.getBbs(bbsID);
		
		request.setAttribute("content", content);
		
		return "/board/updateForm.jsp";
	
	} //execute method end
} //Class end
