package bdqn_yl.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bdqn_yl.common.Datasource;
import bdqn_yl.dao.IRegisterDao;
import bdqn_yl.entity.User;

public class IRegisterDaoImpl implements IRegisterDao {
	private Connection conn ;
	private PreparedStatement pst;
	private ResultSet rs;
	private int i = 0;

	@Override
	public int register(User user) {
		conn=Datasource.getConnect();
		String sql= "insert into user(id,name,age,password,sex,phonenum,message) value(?,?,?,?,?,?,?) ;";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, user.getId());
			pst.setString(2, user.getName());
			pst.setString(3, user.getAge());
			pst.setString(4, user.getPassword());
			pst.setString(5, user.getSex());
			pst.setString(6, user.getPhonenum());
			pst.setString(7, user.getMessage());
			i=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}

}

