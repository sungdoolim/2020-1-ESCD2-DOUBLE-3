package zx9.web.dao;

import java.util.List;

import zx9.web.vo.BankVO;
import zx9.web.vo.BlistVO;

public interface BlistDao {

	void update_rest(BlistVO blv, BankVO bv);

	List<BlistVO> select_list(BlistVO bl);

	int getCount(String bid);

	public void sendmsg(BlistVO blv);

	void fileio(BlistVO blv);

	List<String> selectallfile();

	List<List<BlistVO>> blockchain(String Smajor);

	

	BlistVO selseq(int a);

		
		
	
}
