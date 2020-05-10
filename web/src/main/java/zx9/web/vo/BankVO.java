package zx9.web.vo;

import pwchange.bouncy_change;

public class BankVO {
	private String Bid;
	private String Bname;
	private String Bpw;
	private int Brest;

	bouncy_change crt = new bouncy_change();
	public String getBid() {
		return Bid;
	}
	public void setBid(String bid) {
		Bid = bid;
	}
	public String getBname() {
		return Bname;
	}
	public void setBname(String bname) {
		Bname = bname;
	}
	public String getBpw() {
		return Bpw;
	}
	public void setBpw(String bpw) {

		//a.setSpw( crt.CryptoSHA3(a.getSpw(), 224));
		Bpw = crt.CryptoSHA3(bpw, 256);
	}
	public int getBrest() {
		return Brest;
	}
	public void setBrest(int brest) {
		Brest = brest;
	}
	
	

}
