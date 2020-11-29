package com.logos.coffee.controller;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
 
import org.springframework.mail.javamail.JavaMailSenderImpl; 
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.core.io.FileSystemResource;

import com.logos.coffee.service.CFService;
import com.logos.mail.SMTPAuthenticatior;

import net.sf.json.JSONObject;

@Controller
public class CoffeeController {
	protected final Log logger = LogFactory.getLog(this.getClass());
	
	@Autowired
	CFService cfservice;
	private JavaMailSenderImpl mailSender;
	
	/**
	 * main open
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/board/openMain.do")
    public ModelAndView openMain(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/coffee/cf_main");
        return mv;
    }
	
	/**
	 * admin login
	 * http://localhost:8888/admin/login_proc.jsp 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/login.do")
    public ModelAndView moveSlidePage01(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/admin/login");
        return mv;
    }
	
	/**
	 * second
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/monitor/slideBoard02.do")
    public ModelAndView moveSlidePage02(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/monitor/slideBoard02");
        return mv;
    }
	
	/**
	 * ������
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/monitor/slideBoard04.do")
    public ModelAndView moveSlidePage04(Map<String,Object> commandMap, ModelMap model) throws Exception{
        ModelAndView mv = new ModelAndView("/monitor/slideBoard04");
        
        Map<String, Object> slideCnt = cfservice.selectSlideCnt();
        logger.debug("selectSlideCnt s =========================================");
        logger.debug("slideCnt: "+slideCnt.get("CNT"));
        logger.debug("selectSlideCnt e =========================================");
        
        int sCnt = 0;
        sCnt = (int) slideCnt.get("CNT");
        model.put("endCount", sCnt);
        return mv;
    }
	
	/**
	 * ���� ���
	 * @param model
	 * @return
	 */
	@RequestMapping("/monitor/machineInfo.do")
	public void selectList(@RequestParam Map<String, Object> paramMap
			               , HttpServletResponse response, ModelMap model) throws Throwable{
		List<HashMap<String, Object>> fxData = cfservice.selectMachineInfo(paramMap);
		
		JSONObject jso = new JSONObject();
		jso.put("data", fxData);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jso.toString());
		
		/*logger.debug("============ ������ s ==================");
		logger.debug(jso.toString());
		logger.debug("============ ������ e ==================");*/
	}
	
	/**
	 * ���� & ������
	 * @param model
	 * @return
	 */
	@RequestMapping("/monitor/pressInfo.do")
	public void selectPRESS(@RequestParam Map<String, Object> paramMap
			               , HttpServletResponse response, ModelMap model) throws Throwable{
		List<HashMap<String, Object>> pressData = cfservice.selectPressInfo(paramMap);
		
		JSONObject jso = new JSONObject();
		jso.put("data", pressData);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jso.toString());
		
		/*logger.debug("============ ���� & ������ s ==================");
		logger.debug(jso.toString());
		logger.debug("============ ���� & ������ e ==================");*/
	}
	
	/**
	 * �ڵ���
	 * @param model
	 * @return
	 */
	@RequestMapping("/monitor/autoInfo.do")
	public void selectAUTO(@RequestParam Map<String, Object> paramMap
			               , HttpServletResponse response, ModelMap model) throws Throwable{
		List<HashMap<String, Object>> autoData = cfservice.selectAutoInfo(paramMap);
		
		JSONObject jso = new JSONObject();
		jso.put("data", autoData);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jso.toString());
		
		/*logger.debug("============ �ڵ��� s ==================");
		logger.debug(jso.toString());
		logger.debug("============ �ڵ��� e ==================");*/
	}
	
	/**
	 * �ش� ���� �� �˾�
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/monitor/popUpInfo.do")
	public void selectOne(@RequestParam Map<String, Object> paramMap, HttpServletRequest request
			                , HttpServletResponse response, ModelMap model) throws Throwable{
		Map<String, Object> fxData = cfservice.selectMachineDetail(paramMap);
		
		//���� �̹��� ����
		if(fxData != null){
			String imgPath;
			String faNo;
			List<byte[]> fileBytes = new ArrayList<byte[]>();
			//byte[] fileBytes;// = new byte[];
			imgPath = request.getSession().getServletContext().getRealPath("/")+"images\\machine\\";
			
	        try {
	        	faNo = fxData.get("FA_NO").toString();
	        	fileBytes.add((byte[])fxData.get("PHOTO"));
	            OutputStream targetFile = new FileOutputStream(imgPath+"mch_"+faNo+".jpg");
		        if(null != fileBytes.get(0)){
		        	targetFile.write(fileBytes.get(0));
		        }
		        targetFile.close();
	        }catch (Exception e){
	        	e.printStackTrace();
	        }
		}

		JSONObject jso = new JSONObject();
		jso.put("data", fxData);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jso.toString());
		
		/*logger.debug("============ PopUp Info start ==================");
		logger.debug(jso.toString());
		logger.debug("============ PopUp Info end   ==================");*/
	}
	
	/**
	 * ������
	 * @param model
	 * @return
	 */
	@RequestMapping("/monitor/assembleInfo.do")
	public void selectAssembleInfo(@RequestParam Map<String, Object> paramMap, HttpServletRequest request
			               , HttpServletResponse response, ModelMap model) throws Throwable{
		List<HashMap<String, Object>> fxData = cfservice.selectAssembleInfo(paramMap);
		//List<HashMap<String, Object>> imgData = cfservice.selectAssembleImgInfo(paramMap);
		String imgPath;
		
		//�������� �̹��� ����
		if(fxData != null){
			List<byte[]> fileBytes = new ArrayList<byte[]>();
			imgPath = request.getSession().getServletContext().getRealPath("/")+"images\\item\\";
			
	        try {
	        	for(int i = 0; i < fxData.size(); i++){
	        		fileBytes.add((byte[])fxData.get(i).get("IMG"));
                	//fileBytes[i] = (byte) fxData.get(i).get("IMG");//rs.getBytes(1);
	        		OutputStream targetFile = new FileOutputStream(imgPath+"assmImg_"+i+".jpg");
		            if(null != fileBytes.get(i)){
		            	targetFile.write(fileBytes.get(i));
		            }
		            targetFile.close();
                }
	        }catch (Exception e){
	        	e.printStackTrace();
	        }
		}
		
		JSONObject jso = new JSONObject();
		jso.put("data", fxData);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jso.toString());
		
		/*
		logger.debug("============ ������ s ==================");
		logger.debug(jso.toString());
		logger.debug("============ ������ e ==================");
		*/
	}
	
	/**
	 * �񰡵�����
	 * @param model
	 * @return
	 */
	@RequestMapping("/monitor/nonOperInfo.do")
	public void selectNonOperInfo(@RequestParam Map<String, Object> paramMap
			               , HttpServletResponse response, ModelMap model) throws Throwable{
		List<HashMap<String, Object>> autoData = cfservice.selectNonOperInfo(paramMap);
		
		JSONObject jso = new JSONObject();
		jso.put("data", autoData);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jso.toString());
		
		/*
		logger.debug("============ �񰡵����� s ==================");
		logger.debug(jso.toString());
		logger.debug("============ �񰡵����� e ==================");
		*/
	}
	
	//ĳ���� method
	@SuppressWarnings("unchecked")
	private List<HashMap<String, Object>> getDataset(List<HashMap<String, Object>> datasets, int index){
		return (List<HashMap<String, Object>>) datasets.get(index);
	}
	
	/**
	 * �񰡵� �׷�������
	 * @param model
	 * @return
	 */
	@RequestMapping("/monitor/nonOperGraphInfo.do")
	public void selectNonOperGraphInfo(@RequestParam Map<String, Object> paramMap
			               , HttpServletResponse response, ModelMap model) throws Throwable{
		List<HashMap<String, Object>> nonOperData = cfservice.selectNonOperGraphInfo(paramMap);
		
		JSONObject jso = new JSONObject();
		jso.put("data", nonOperData);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jso.toString());
		
		
		logger.debug("========== NonOperGraphInfo s =================");
		logger.debug(jso.toString());
		logger.debug("========== NonOperGraphInfo e =================");
		
	}
	
	/**
	 * mail sending
	 * @param params
	 * @return
	 */
	@RequestMapping("/coffee/booking.do")
	public void sendMail(@RequestParam Map<String, Object> params
			                             , HttpServletResponse response, ModelMap model) throws Throwable{
		String from = (String) params.get("email");
		String to   = "hemiblues@gmail.com";//(String) params.get("to");
		String subject = (String) params.get("name");
		String content = "Date: "     + (String) params.get("date") 
						+ "Time: "    + (String) params.get("time") 
						+ "People: "  + (String) params.get("people")
						+ "Message: " + (String) params.get("message");
		
		Properties props = new Properties(); // 정보를 담을 Properties 객체
		
		props.put("mail.smtp.host","gmail-smtp.l.google.com");// , smtp.naver.com
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
		    Authenticator auth = new SMTPAuthenticatior();
		    Session ses = Session.getInstance(props, auth);
		    
		    ses.setDebug(true);
		     
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    msg.setSubject(subject); // 제목
		     
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr); // 보내는 사람
		     
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		     
		    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
		     
		    Transport.send(msg); // 전송
		} catch(Exception e){
		    e.printStackTrace();
		    //out.println("<script>alert('Send Mail Failed..');history.back();</script>");
		    // 오류 발생시 뒤로 돌아가도록
		    return;
		}
		
		JSONObject jso = new JSONObject();
		jso.put("data", params);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jso.toString());
		logger.debug("================= sendMail s =================");
		logger.debug(jso.toString());
		logger.debug("================= sendMail e =================");
	}
	
}