package zx9.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import zx9.web.dao.BankDao;
import zx9.web.dao.BlistDao;
import zx9.web.dao.BlmsgDao;
import zx9.web.vo.BankVO;
import zx9.web.vo.BlistVO;

@Controller
public class BankController {

	@Autowired
	BlistDao bldao;
	@Autowired
	BankDao bdao;
	
	@Autowired
	BlmsgDao blmdao;
	
	@RequestMapping("/purchase")
	String purchase() {
		return "/bank/purchase";
	}
	@RequestMapping("/purchase_ok")
	String purchase_ok(BlistVO blv,BankVO bv,HttpServletRequest request,Model m){
		HttpSession session=request.getSession();
		
		BankVO newbv=bdao.select_bank(session.getAttribute("Smajor").toString());
		String msg;
		if(newbv.getBpw().equals(bv.getBpw())) {

			blv.setBid(newbv.getBid());
			
			if(Integer.parseInt(session.getAttribute("Siscouncil").toString())>1) {
		
		if(blv.getBuser()==null) {
			blv.setBuser(session.getAttribute("Sname").toString());
		}
			newbv.setBrest(newbv.getBrest()-blv.getBinout());
		bdao.update_rest(newbv);
		bldao.update_rest(blv,newbv);
		blmdao.delete_list(blv,newbv);
		msg="구매 내역을 등록했습니다.";
			
			}
			else {
				blv.setBuser(session.getAttribute("Sname").toString());
				// 승인 메시지를 총무에게 보내기
				msg="총무에게 구매 요청을 보냈습니다.";
				System.out.println(msg);
				bldao.sendmsg(blv);
			}
		}else {
			msg="비밀번호를 확인하세요";
			m.addAttribute("msg", msg);
			return "/bank/purchase";
		}

		m.addAttribute("msg", msg);
		return "/bank/purchase_ok";
	}
	@RequestMapping("/blistall")
	String blistall(HttpServletRequest request,BankVO bvo,BlistVO bl,Model m) {
		HttpSession session=request.getSession();

		int page=1;// 현재 쪽 번호
		int limit=10;//한 페이지에 보여지는 목록 개수
		
		if(request.getParameter("page")!=null) {
			//전달된 page가 존재한다면
			page=Integer.parseInt(request.getParameter("page"));// 내가봤을때는 좀더 효율적으로 바꿀 수 있음
			System.out.println("list 받은 값 : "+page);
			
		}
		bl.setStartrow((page-1)*10+1);
		bl.setEndrow(bl.getStartrow()+limit-1);

		String Bid=bdao.select_bank(session.getAttribute("Smajor").toString()).getBid();
		bl.setBid(Bid);
		int totalCount=this.bldao.getCount(Bid);// 총 게시물 개수
		
		
		System.out.println("못가져오나 계좌?"+Bid);
		
		List<BlistVO> BL=bldao.select_list(bl);

		int maxpage=(int)((double)totalCount/limit+0.95);
		
		//현재 페이지에 보여질 시작 페이지                               page=5라면  1.4 -1  0.4*10+1=5
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;      
		int endpage=maxpage;
		if(endpage>startpage+10-1) {
			endpage=startpage+10-1;
		}
		System.out.println("total: "+ totalCount);
		System.out.println("start : "+ startpage);
		System.out.println("end: "+endpage);
		System.out.println("max : "+maxpage);
		System.out.println("p : "+page);
		m.addAttribute("totalCount",totalCount);
		m.addAttribute("startpage",startpage);
		m.addAttribute("endpage",endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		
		m.addAttribute("bl", BL);
		
		return "/bank/blistall";
	}
}
