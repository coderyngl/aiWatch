package bdqn_yl.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import bdqn_yl.common.Datasource;
import bdqn_yl.dao.ILoginDao;
import bdqn_yl.entity.Page;
import bdqn_yl.entity.Product;
import bdqn_yl.entity.User;
import bdqn_yl.entity.Userbuy;
import bdqn_yl.entity.Watch;

public class ILoginDaoImpl implements ILoginDao {
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	int totalCount=0;
	Page page=null;
	@Override
	/**
	 * 用户登录
	 */
	public int login(String name, String password) {
		int i=0;
		conn=Datasource.getConnect();
		String sql=" select * from user where name = '"+ name + "' and password ='" + password +"';";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			rs.last();
			i=rs.getRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Datasource.closeAll(rs, st, conn);
			
		}
		return i;
	}
	@Override
	/**
	 * 用户信息展示
	 */
	public List<User> showinfo(String name) {
		conn=Datasource.getConnect();
		String sql="select * from user where name = '"+ name +"';";
		List<User> listUser=new ArrayList<User>();
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery(); 
			while(rs.next()){
				User user=new User();
				user.setName(rs.getString("name"));
				user.setAge(rs.getString("age"));
				user.setSex(rs.getString("sex"));
				user.setPhonenum(rs.getString("phonenum"));
				user.setMessage(rs.getString("message"));
				listUser.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Datasource.closeAll(rs, pst, conn);
		}
		return listUser;
	}
	@Override
	/**
	 * 用户信息修改
	 */
	public int update(User user) {
		int i=0;
		conn=Datasource.getConnect();
		String sql="update user set  age='"+user.getAge()+"',sex='"+user.getSex()+"',phonenum='"+user.getPhonenum()+"',message='"+user.getMessage()+"' where name='" + user.getName() + "';";
		try {
			pst = conn.prepareStatement(sql);
			i = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	/**
	 * 验证
	 */
	@Override
	public List<User> check(String name, String password) {
		User user=new User();
		List<User> listUser=new ArrayList<User>();
		conn=Datasource.getConnect();
		String sql=" select * from user where name = '"+ name + "' and password ='" + password +"';";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				user.setName(rs.getString("name"));
				user.setAge(rs.getString("age"));
				user.setSex(rs.getString("sex"));
				user.setPhonenum(rs.getString("phonenum"));
				user.setMessage(rs.getString("message"));
			}
			listUser.add(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Datasource.closeAll(rs, pst, conn);    //调用关闭方法
		} 
		return listUser;
	}
	
	@Override
	public List<Watch> watch() {
		conn=Datasource.getConnect();
		List<Watch> listwatch=new ArrayList<Watch>();
		String sql="select * from watch";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Watch watch=new Watch();
				watch.setId(rs.getInt("wid"));
				watch.setWname(rs.getString("wname"));
				watch.setWprice(rs.getFloat("wprice"));
				watch.setWurl(rs.getString("wurl"));
				listwatch.add(watch);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listwatch;
	}
	@Override
	public List<Product> product() {
		conn=Datasource.getConnect();
		List<Product> listproduct=new ArrayList<Product>();
		String sql="select * from product";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Product product=new Product();
				product.setId(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPprice(rs.getFloat("pprice"));
				product.setPurl(rs.getString("purl"));
				listproduct.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listproduct;
	
	}
	/**
	 * 查询分页
	 */
	@Override
	public Page userbuy(Userbuy userbuy, int pageNo, int pageSize) {
		List<Userbuy> listuserbuy=new ArrayList<Userbuy>();
		st=Datasource.gets();
		String sql="select count(name) from userbuy where name ='"+userbuy.getName()+"';";
		try {
			rs=st.executeQuery(sql);
			while(rs.next()){
				totalCount=rs.getInt(1);
			}
			String sql1="select * from userbuy where name='"+userbuy.getName()+"'order by ordernum desc limit "+(pageNo-1)*pageSize+","+pageSize+";";
			rs=st.executeQuery(sql1);
			while(rs.next()){
				userbuy=new Userbuy();
				userbuy.setNum(rs.getInt("num"));
				userbuy.setUbname(rs.getString("ubname"));
				userbuy.setUrl(rs.getString("url"));
				userbuy.setPrice(rs.getFloat("price"));
				userbuy.setStatus(rs.getInt("status"));
				userbuy.setOrdernum(rs.getInt("ordernum"));
				listuserbuy.add(userbuy);
			}
			page=new Page(pageSize, totalCount);
			page.setData(listuserbuy);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Datasource.closeAll(rs, pst, conn);    //调用关闭方法
		} 
		return page;
	}
	@Override
	public int orderbuy(Userbuy userbuy) {
		// TODO Auto-generated method stub
		st=Datasource.gets();
		StringBuffer sql=new StringBuffer("insert into userbuy(name,ubname,num,url,price,status) value ('");
		sql.append(userbuy.getName()+"','");
		sql.append(userbuy.getUbname()+"','");
		sql.append(userbuy.getNum()+"','");
		sql.append(userbuy.getUrl()+"','");
		sql.append(userbuy.getPrice()+"','");
		sql.append(userbuy.getStatus()+"');");
		String mysql=sql.toString();
		try {
			st.execute(mysql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Datasource.closeAll(rs, pst, conn);
		}
		return 1;
	}
	@Override
	public int money(Userbuy userbuy) {
		// TODO Auto-generated method stub
		int num=0;
		conn=Datasource.getConnect();
		String sql="update userbuy set status='"+userbuy.getStatus()+"'where name='"+userbuy.getUbname()+"';";
		try {
			pst=conn.prepareStatement(sql);
			num=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Datasource.closeAll(rs, pst, conn);
		}
		
		return num;
	}
}
