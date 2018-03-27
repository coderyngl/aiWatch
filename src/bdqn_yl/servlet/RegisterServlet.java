package bdqn_yl.servlet;

import bdqn_yl.entity.User;
import bdqn_yl.service.IRegisterService;
import bdqn_yl.service.Impl.IRegisterServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 注册
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IRegisterService iRegisterService=new IRegisterServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		User user=new User();
		user.setId(request.getParameter("id"));
		user.setName(request.getParameter("name"));
		user.setAge(request.getParameter("age"));
		user.setPassword(request.getParameter("password"));
		user.setSex(request.getParameter("sex"));
		user.setPhonenum(request.getParameter("phonenum"));
		user.setMessage(request.getParameter("message"));
		boolean flag=iRegisterService.register(user);
		if(flag){
			PrintWriter pw = response.getWriter();
			pw.write("0");
			return;
	}
		PrintWriter pw = response.getWriter();
		pw.write("1");
		return;
	}
}
