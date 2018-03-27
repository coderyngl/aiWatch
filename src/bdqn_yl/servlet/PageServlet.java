package bdqn_yl.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdqn_yl.entity.Page;
import bdqn_yl.entity.Userbuy;
import bdqn_yl.service.ILoginService;
import bdqn_yl.service.Impl.ILoginServiceImpl;

/**
 * Servlet implementation class PageServlet
 */
@WebServlet("/PageServlet")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Userbuy userbuy=new Userbuy();
	ILoginService iLoginService=new ILoginServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String name=request.getParameter("name");
		int  pageNo=Integer.parseInt(request.getParameter("pageNo"));
		userbuy.setName(name);
		Page page=iLoginService.userbuy(userbuy, pageNo, 4);
		page.setPageNo(pageNo);
		HttpSession sessions=request.getSession();
		sessions.setAttribute("page", page);
		PrintWriter pw=response.getWriter();
		pw.write("0");
		return;
	}
}

