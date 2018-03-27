package bdqn_yl.service.Impl;


import java.util.ArrayList;
import java.util.List;

import bdqn_yl.dao.ILoginDao;
import bdqn_yl.dao.Impl.ILoginDaoImpl;
import bdqn_yl.entity.Page;
import bdqn_yl.entity.Product;
import bdqn_yl.entity.User;
import bdqn_yl.entity.Userbuy;
import bdqn_yl.entity.Watch;
import bdqn_yl.service.ILoginService;

public class ILoginServiceImpl implements ILoginService {
	ILoginDao iLoginDao=new ILoginDaoImpl();
	@Override
	/**
	 * 用户登录
	 */
	public boolean login(String name, String password) {
		boolean flag=false;
		int i=iLoginDao.login(name, password);
		if(1==i){
			flag=true;
		}
		return flag;
	}
	@Override
	public boolean update(User user) {
		boolean flag=false;
		int i=iLoginDao.update(user);
		if(1==i){
			flag=true;
		}
		return flag;
	}
	@Override
	public List<User> showinfo(String name) {
		List<User> listUser=iLoginDao.showinfo(name);
		return listUser;
	}
	@Override
	public List<User> check(String name, String password) {
		List<User> listUser=iLoginDao.showinfo(name);
		return listUser;
	}
	@Override
	public List<Watch> watch() {
		List<Watch> listwatch=iLoginDao.watch();
		return listwatch;
	}
	@Override
	public List<Product> product() {
		List<Product> listproduct=iLoginDao.product();
		return listproduct;
	}
	@Override
	public Page userbuy(Userbuy userbuy, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		Page page=iLoginDao.userbuy(userbuy, pageNo, pageSize);
		return page;
	}
	@Override
	public boolean orderbuy(Userbuy userbuy) {
		// TODO Auto-generated method stub
		int num=iLoginDao.orderbuy(userbuy);
		boolean flag=false;
		if(num==1){
			flag=true;
		}
		return flag;
	}
}

