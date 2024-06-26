package egovframework.mobile.com.util.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.mobile.com.util.service.MailSendService;
import egovframework.mobile.com.util.service.MailSendVO;

@Controller

public class MailSendController {

	/* ComCodeService */
	@Resource(name = "mailSendService")
	private MailSendService mailSendService;
	
	@RequestMapping(value = "/mailSend.do")
	public String mailSend(MailSendVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		// 메일 전송 등록
		mailSendService.insertMailSend(vo);
		return "redirect:/mgnoincoun/login.do";
	}
	
}
