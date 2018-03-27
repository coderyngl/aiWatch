package bdqn_yl.service.Impl;

import bdqn_yl.dao.IRegisterDao;
import bdqn_yl.dao.Impl.IRegisterDaoImpl;
import bdqn_yl.entity.User;
import bdqn_yl.service.IRegisterService;

public class IRegisterServiceImpl implements IRegisterService {
	IRegisterDao iregisterdao=new IRegisterDaoImpl();
	int num=0;

	@Override
	public boolean register(User user) {
		boolean flag=false;
		num=iregisterdao.register(user);
		if(1 == num){
			flag=true;
		}
		return flag;
	}

}
