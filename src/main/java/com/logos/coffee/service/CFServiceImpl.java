package com.logos.coffee.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.logos.coffee.dao.CFDao;
import com.logos.coffee.vo.UserDto;
import com.logos.coffee.vo.UserVO;

@Service("CFService")
public class CFServiceImpl implements CFService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="cfDAO")
	private CFDao cfDAO;
	
	
	@Override
	public List<HashMap<String, Object>> selectMachineInfo(Map<String, Object> map) throws Exception {
		return cfDAO.selectMachineInfo(map);
	}
	
	@Override
	public List<HashMap<String, Object>> selectAssembleInfo(Map<String, Object> map) throws Exception {
		return cfDAO.selectAssembleInfo(map);
	}
	
	@Override
	public List<HashMap<String, Object>> selectAssembleImgInfo(Map<String, Object> map) throws Exception {
		return cfDAO.selectAssembleImgInfo(map);
	}
	
	@Override
	public List<HashMap<String, Object>> selectPressInfo(Map<String, Object> map) throws Exception {
		return cfDAO.selectPressInfo(map);
	}
	
	@Override
	public List<HashMap<String, Object>> selectAutoInfo(Map<String, Object> map) throws Exception {
		return cfDAO.selectAutoInfo(map);
	}
	
	@Override
	public List<HashMap<String, Object>> selectNonOperInfo(Map<String, Object> map) throws Exception {
		return cfDAO.selectNonOperInfo(map);
	}
	
	@Override
	public List<HashMap<String, Object>> selectNonOperGraphInfo(Map<String, Object> map) throws Exception {
		return cfDAO.selectNonOperGraphInfo(map);
	}
	
	@Override
	public Map<String, Object> selectMachineDetail(Map<String, Object> map) throws Exception {
		return cfDAO.selectMachineDetail(map);
	}
	
	@Override
	public Map<String, Object> selectSlideCnt() throws Exception {
		return cfDAO.selectSlideCnt();
	}

	@Override
	public UserDto getUsersByID(String username) throws Exception {
		return cfDAO.getUsersByID(username);
	}
	
}