package com.logos.coffee.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.logos.coffee.vo.UserDto;
import com.logos.coffee.vo.UserVO;

@Repository("cfDAO")
public class CFDao extends AbstractDAO{
	
	public List<HashMap<String, Object>> selectList(){
		List<HashMap<String, Object>> result = new ArrayList<>();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectMachineInfo(Map<String, Object> map) throws Exception{
		return (List<HashMap<String, Object>>)selectList("coffee.selectMachineInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectAssembleInfo(Map<String, Object> map) throws Exception{
		return (List<HashMap<String, Object>>)selectList("coffee.selectAssembleInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectAssembleImgInfo(Map<String, Object> map) throws Exception{
		return (List<HashMap<String, Object>>)selectList("coffee.selectAssembleImgInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectPressInfo(Map<String, Object> map) throws Exception{
		return (List<HashMap<String, Object>>)selectList("coffee.selectFA_MONITOR_PRESS_V", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectAutoInfo(Map<String, Object> map) throws Exception{
		return (List<HashMap<String, Object>>)selectList("coffee.selectFA_MONITOR_AUTO_V", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectNonOperInfo(Map<String, Object> map) throws Exception{
		return (List<HashMap<String, Object>>)selectList("coffee.selectNonOper", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectNonOperGraphInfo(Map<String, Object> map) throws Exception{
		return (List<HashMap<String, Object>>)selectList("coffee.selectNonOperGraph", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMachineDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("coffee.selectMachineDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectSlideCnt() throws Exception{
		return (Map<String, Object>)selectOne("coffee.selectAssmCnt", "");
	}
	
	@SuppressWarnings("unchecked")
	public UserDto getUsersByID(String param) throws Exception{
		return (UserDto)selectList("coffee.selectUsersByID", param);
	}
}