package zx9.web.dao;

import java.util.List;

import zx9.web.vo.BankVO;
import zx9.web.vo.BlistVO;
import zx9.web.vo.BlmsgVO;

public interface BlmsgDao {

	void update_rest(BlistVO blv, BankVO bv);


	int getCount(String bid);

	public void sendmsg(BlistVO blv);

	List<BlmsgVO> select_list(BlmsgVO blm);


	void delete_list(BlistVO blv, BankVO newbv);

		
		
	
}
