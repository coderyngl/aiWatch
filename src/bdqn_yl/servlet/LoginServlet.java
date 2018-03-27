package bdqn_yl.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdqn_yl.dao.ILoginDao;
import bdqn_yl.dao.Impl.ILoginDaoImpl;
import bdqn_yl.entity.User;
import bdqn_yl.service.ILoginService;
import bdqn_yl.service.Impl.ILoginServiceImpl;

/**
 * 登录
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ILoginService iLoginService=new ILoginServiceImpl();
	User user=new User();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		boolean flag=iLoginService.login(name, password);
		List<User> listUser=new ArrayList<User>();
		if(flag){
			session.setAttribute("name", name);
			listUser=iLoginService.check(name, password);
			user=listUser.get(0);
			String age=user.getAge();
			String sex=user.getSex();
			String phonenum=user.getPhonenum();
			String message=user.getMessage();
			HttpSession httpsession1=request.getSession();
			HttpSession httpsession2=request.getSession();
			HttpSession httpsession3=request.getSession();
			HttpSession httpsession4=request.getSession();
			httpsession1.setAttribute("age", age);
			httpsession2.setAttribute("sex", sex);
			httpsession3.setAttribute("phonenum", phonenum);
			httpsession4.setAttribute("message", message);
			PrintWriter pw=response.getWriter();
			pw.write("0");
			return;
			}
			PrintWriter pw = response.getWriter();
			pw.write("1");
			return;
		}
	

}
