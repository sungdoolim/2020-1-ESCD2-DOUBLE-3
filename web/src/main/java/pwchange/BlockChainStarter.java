package pwchange;
import java.util.ArrayList;

public class BlockChainStarter {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		
		
		//Transaction tr=new Transaction("staris","hama",30);
		//System.out.println(tr.getInfo());
		
		//int blockID,String previousBlockHash, int nonce, ArrayList transactionList)
		Blockchain block=new Blockchain(1,null,0,new ArrayList());
		block.mine();
		block.getinfo(); 
		Blockchain block2=new Blockchain(2,block.getBlockHash(),0,new ArrayList());
		block2.addTransaction(new Transaction("staris","hama",1.5));
		block2.addTransaction(new Transaction("시은","hama",0.7));
		
		block2.mine();
		block2.getinfo();
		Blockchain block3=new Blockchain(3,block2.getBlockHash(),0,new ArrayList());
		block3.addTransaction(new Transaction("가경","시은",8.2));
		block3.addTransaction(new Transaction("hama","staris",0.4));
		
		
		block3.mine();
		block3.getinfo();
		Blockchain block4=new Blockchain(4,block3.getBlockHash(),0,new ArrayList());
		block4.addTransaction(new Transaction("시은","staris",0.1));
		
		block4.mine();
		block4.getinfo();
		
	}

}