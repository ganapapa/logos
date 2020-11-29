package com.logos.coffee.vo;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.logos.utils.DateUtils;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.ServletRequestUtils;

public class CommonInfo implements Serializable {
	private static Log logger = LogFactory.getLog(CommonInfo.class);
	private static final long serialVersionUID = 670837523736237405L;

	private String action = "";

	private String regId = "";
	private String regTm = "";
	private String updId = "";
	private String updTm = "";

	private String regNm = "";
	private String updNm = "";

	private static String extractParamName(String name) {
		StringBuffer sb = new StringBuffer(name.length());
		sb.append(name.substring(3, 4).toLowerCase());
		sb.append(name.substring(4));
		return sb.toString();
	}

	public CommonInfo() {
	}

	/*
	public void load(UploadInfo uploadInfo) {
		for (Method method : this.getClass().getMethods()) {
			try {
				if (method.getName().startsWith("set") && method.getParameterTypes().length == 1) {
					Object value = uploadInfo.get(extractParamName(method.getName()));
					if (value != null) {
						method.invoke(this, value);
					}
				}
			} catch (Exception e) {
				logger.error("error!!!", e);
			}
		}
	}
    */
	
	public void load(HttpServletRequest req) {
		for (Method method : this.getClass().getMethods()) {
			try {
				if (method.getName().startsWith("set") && method.getParameterTypes().length == 1) {
					Object value = ServletRequestUtils.getStringParameter(req, extractParamName(method.getName()));
					if (value != null) {
						method.invoke(this, value);
					} else {
						method.invoke(this, "");
					}
				}
			} catch (Exception e) {
				logger.error("error!!!", e);
			}
		}
	}

	@SuppressWarnings("rawtypes")
	public static List makeInfos(HttpServletRequest req, Class clazz) throws InstantiationException, IllegalAccessException {
		return makeInfos(req, clazz, "action");
	}

	@SuppressWarnings("rawtypes")
	public static List makeInfos(HttpServletRequest req, Class clazz, String action) throws InstantiationException, IllegalAccessException {
		return makeInfos(req, clazz, action, "");
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List makeInfos(HttpServletRequest req, Class clazz, String action, String prefix) throws InstantiationException, IllegalAccessException {
		String[] actions = ServletRequestUtils.getStringParameters(req, prefix + action);
		List infos = new ArrayList();
		for (int i = 0; i < actions.length; ++i) {
			Object obj = clazz.newInstance();
			infos.add(obj);
		}

		for (Method method : clazz.getMethods()) {
			try {
				if (method.getName().startsWith("set") && method.getParameterTypes().length == 1) {
					String[] values = ServletRequestUtils.getStringParameters(req, prefix + extractParamName(method.getName()));
					if (values.length != 1 && actions.length != values.length) {
						continue;
					}
					for (int i = 0; i < actions.length; ++i) {
						String value;
						if (values.length == 1) {
							value = values[0];
						} else {
							value = values[i];
						}
						if (value != null) {
							method.invoke(infos.get(i), value);
						}
					}
				}
			} catch (Exception e) {
				logger.error("error!!!", e);
			}
		}

		for (int i = 0; i < actions.length; ++i) {
			if (infos.get(i) instanceof CommonInfo) {
				CommonInfo info = (CommonInfo) infos.get(i);
/*				
//==============2013-02-14 홈피와 관리자 페이지의 세션 분리를위한작업======================================================== 
				//info.fix(SessionUtils.getUserSeq(req)); 
				if(SessionUtils.getAdminSeq(req)!="")
					info.fix(SessionUtils.getAdminId(req));
				else
					info.fix(SessionUtils.getUserSeq(req));
//======================================================================================================================= 
*/
			}
		}

		return infos;
	}

	public Map<String, Object> makeParams() {
		Map<String, Object> params = new HashMap<String, Object>();
		for (Method method : this.getClass().getMethods()) {
			try {
				if (method.getName().startsWith("get") && method.getParameterTypes().length == 0) {
					Object value = null;
					value = method.invoke(this);
					params.put(extractParamName(method.getName()), value);
				}
			} catch (Exception e) {
				logger.error("error!!!", e);
			}
		}
		return params;
	}

	public void fix() {
	}

	public void fix(String sessionUserId) {
		fix();

		setSessionUserId(sessionUserId);
	}

	public void fix(HttpServletRequest req) {
		fix();
		
/*
//==============2013-02-14 홈피와 관리자 페이지의 세션 분리를위한작업======================================================== 
		//info.fix(SessionUtils.getUserSeq(req)); 
		if(SessionUtils.getAdminSeq(req)!="")
			setSessionUserId(SessionUtils.getAdminId(req));
		else
			setSessionUserId(SessionUtils.getUserId(req));
//======================================================================================================================= 
*/		
	}

	public void setSessionUserId(String sessionUserId) {
		if (sessionUserId == null) {
			setRegId("");
			setUpdId("");
		} else {
			setRegId(sessionUserId);
			setUpdId(sessionUserId);
		}

		setRegTm(DateUtils.getCurrentTime());
		setUpdTm(getRegTm());
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = StringUtils.defaultString(action, "");
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = StringUtils.defaultString(regId, "");
	}

	public String getRegTm() {
		return regTm;
	}

	public void setRegTm(String regTm) {
		this.regTm = StringUtils.defaultString(regTm, "");
	}

	public String getUpdId() {
		return updId;
	}

	public void setUpdId(String updId) {
		this.updId = StringUtils.defaultString(updId, "");
	}

	public String getUpdTm() {
		return updTm;
	}

	public void setUpdTm(String updTm) {
		this.updTm = StringUtils.defaultString(updTm, "");
	}

	public String getRegNm() {
		return regNm;
	}

	public void setRegNm(String regNm) {
		this.regNm = StringUtils.defaultString(regNm, "");
	}

	public String getUpdNm() {
		return updNm;
	}

	public void setUpdNm(String updNm) {
		this.updNm = StringUtils.defaultString(updNm, "");
	}
}