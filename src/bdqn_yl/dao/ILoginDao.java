package bdqn_yl.dao;

import java.util.List;

import bdqn_yl.entity.Product;
import bdqn_yl.entity.User;
import bdqn_yl.entity.Watch;
import bdqn_yl.entity.Page;
import bdqn_yl.entity.Userbuy;

public interface ILoginDao {
	/**
	 * 登陆
	 * @param name
	 * @param password
	 * @return
	 */
	public int login(String name,String password);
	/**
	 * 用户信息展示
	 * @param name
	 * @return
	 */
	public List<User> showinfo(String name);
	/**
	 * 用户信息修改
	 * @param user
	 * @return
	 */
	public int update (User user);
	
	/**
	 * 验证
	 * @return
	 */
	public List<User> check(String name,String password);
	/**
	 * 热销商品
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
	/**
	 * 加入购物车
	 * @param userbuy
	 * @return
	 */
	public int orderbuy(Userbuy userbuy);
	/**
	 * 付款
	 * @param userbuy
	 * @return
	 */
	public int money(Userbuy userbuy);
	/**
	 * 订单查询
	 * @return
	 */
}
