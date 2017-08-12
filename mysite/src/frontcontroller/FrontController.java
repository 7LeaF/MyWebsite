package frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.*;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String viewPage= null;
		Command command= null;
		
		String uri= request.getRequestURI();
		String conPath= request.getContextPath();
		String com= uri.substring(conPath.length());
		
		
		//회원 관리 기능
		if(com.equals("/join.do")){
			viewPage= "joinForm.jsp";
			
		}else if(com.equals("/joinAction.do")){
			command= new JoinCommand();
			viewPage= command.execute(request, response);
			
		}else if(com.equals("/login.do")){
			viewPage= "loginForm.jsp";
			
		}else if(com.equals("/loginAction.do")){
			command= new LoginCommand();
			viewPage= command.execute(request, response);
			
		}else if(com.equals("/logout.do")){
			command= new LogoutCommand();
			viewPage= command.execute(request, response);
			
		}
		
		
		//게시판 기능
		else if(com.equals("/bbs.do")){
			command= new BoardListCommand();
			viewPage= command.execute(request, response);
			
		}else if(com.equals("/writeView.do")){
			viewPage= "writeForm.jsp";
			
		}else if(com.equals("/writeAction.do")){
			command= new BoardWriteActionCommand();
			viewPage= command.execute(request, response);
			
		}else if(com.equals("/contentView.do")){
			command= new BoardContentViewCommand();
			viewPage= command.execute(request, response);
		
		}else if(com.equals("/updateView.do")){
			command= new BoardUpdateViewCommand();
			viewPage= command.execute(request, response);
			
		}else if(com.equals("/updateAction.do")){
			command= new BoardUpdateActionCommand();
			viewPage= command.execute(request, response);	
			
		}else if(com.equals("/deleteAction.do")){
			command= new BoardDeleteActionCommand();
			viewPage= command.execute(request, response);
			
		}
		
		RequestDispatcher dispatcher= request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	} //actionDo method end
} //Class end
