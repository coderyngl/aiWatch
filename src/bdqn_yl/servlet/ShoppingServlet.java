package bdqn_yl.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
 * 加入购物车操作
 * Servlet implementation class ShoppingServlet
 */
@WebServlet("/ShoppingServlet")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Userbuy userbuy =new  Userbuy();
	ILoginService iLoginService=new ILoginServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingServlet() {
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
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String url=request.getParameter("url");
		String ubname=request.getParameter("ubname");
		float price=Float.parseFloat(request.getParameter("price"));
		int number=Integer.parseInt(request.getParameter("number"));
		int status=Integer.parseInt(request.getParameter("status"));
		float prices=price*number;
		userbuy.setName(name);
		userbuy.setUrl(url);
		userbuy.setNum(number);
		userbuy.setUbname(ubname);
		userbuy.setStatus(status);
		userbuy.setPrice(prices);
		
		boolean flag=iLoginService.orderbuy(userbuy);
		if(flag){
			PrintWriter pw=response.getWriter();
			pw.write("0");
			return;
		}else{
			PrintWriter pw=response.getWriter();
			pw.write("1");
			return;
		}
	}
}

	


