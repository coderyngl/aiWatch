package bdqn_yl.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.jar.Attributes.Name;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bdqn_yl.dao.ILoginDao;
import bdqn_yl.dao.Impl.ILoginDaoImpl;
import bdqn_yl.entity.User;
import bdqn_yl.service.ILoginService;
import bdqn_yl.service.Impl.ILoginServiceImpl;

/**
 * 修改用户信息
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	User user=new User();
	ILoginService iLoginService=new ILoginServiceImpl();
	ILoginDao iLoginDao=new ILoginDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String sex=request.getParameter("sex");
		String phonenum=request.getParameter("phonenum");
		String message=request.getParameter("message");
		session.setAttribute("age", age);
		session.setAttribute("sex", sex);
		session.setAttribute("phonenum", phonenum);
		session.setAttribute("message", message);
		session.setAttribute("name", name);
		user.setName(name);
		user.setAge(age);
		user.setSex(sex);
		user.setPhonenum(phonenum);
		user.setMessage(message);
		iLoginService.update(user);
		PrintWriter pw=response.getWriter();
		pw.write("0");
		return;
	}

}
