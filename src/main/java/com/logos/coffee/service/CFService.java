package com.logos.coffee.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.logos.coffee.vo.UserDto;

public interface CFService {

	List<HashMap<String, Object>> selectMachineInfo(Map<String, Object> map) throws Exception;
	
	List<HashMap<String, Object>> selectAssembleInfo(Map<String, Object> map) throws Exception;
	
	List<HashMap<String, Object>> selectAssembleImgInfo(Map<String, Object> map) throws Exception;
	
	List<HashMap<String, Object>> selectPressInfo(Map<String, Object> map) throws Exception;
	
	List<HashMap<String, Object>> selectAutoInfo(Map<String, Object> map) throws Exception;
	
	List<HashMap<String, Object>> selectNonOperInfo(Map<String, Object> map) throws Exception;
	
	List<HashMap<String, Object>> selectNonOperGraphInfo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMachineDetail(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectSlideCnt() throws Exception;
	
	UserDto getUsersByID(String username) throws Exception; 

}