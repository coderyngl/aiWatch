package bdqn_yl.service;

import java.util.List;

import bdqn_yl.entity.Product;
import bdqn_yl.entity.User;
import bdqn_yl.entity.Watch;
import bdqn_yl.entity.Page;
import bdqn_yl.entity.Userbuy;

public interface ILoginService {
	/**
	 * 用户登录
	 * @param code
	 * @param password
	 * @return
	 */
	public boolean login(String name, String password);
	/**
	 * 用户信息修改
	 * @param user
	 * @return
	 */
	public boolean  update(User user);
	/**
	 * 用户信息显示
	 * @return
	 */
	public  List<User> showinfo(String name);
	/**
	 * 验证
	 * @param code
	 * @param password
	 * @return
	 */
	public List<User> check(String name, String password);
	/**
	 * 热销商品
	 * @param wid
	 * @return
	 */
	public List<Watch> watch();
	/**
	 * 店家推荐
	 * @return
	 */
	public List<Product> product();
	/**
	 * 分页
	 * @param userbuy
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page userbuy(Userbuy userbuy,int pageNo, int pageSize);
	
	public boolean orderbuy(Userbuy userbuy);
	
}
