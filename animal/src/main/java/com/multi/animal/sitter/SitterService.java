package com.multi.animal.sitter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SitterService {
	@Autowired
	SitterDAO dao;
	
	public void insert(SitterVO sittervo) {
		System.out.println(sittervo);
		dao.insert(sittervo);
	}

	public List<SitterVO> list(PageVO pvo,SitterVO sittervo) {
		System.out.println("<< service >>" + sittervo);
		pvo.setStartEnd(pvo.getPage());
		System.out.println("<< service >> " + pvo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PageVO", pvo);
		map.put("SitterVO", sittervo);
		List<SitterVO> list = dao.list(map);
//		System.out.println(list.get(0));
		return list;
	}

	public int count() {
		return dao.count();
	}


	public SitterVO one(String sitterId) {
		System.out.println(sitterId);
		SitterVO sittervo = dao.one(sitterId);
		System.out.println(sittervo);
		return sittervo;
	}

	public void delete(String sitterId) {
		System.out.println(sitterId);
		dao.delete(sitterId);
		
	}

	public void update2(SitterVO vo) {
		System.out.println("<< service >>"+vo);
		dao.update(vo);
	}

	public List<SitterVO> filter(FilterVO filtervo, PageVO pagevo) {
		pagevo.setStartEnd(pagevo.getPage());
		System.out.println(pagevo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PageVO", pagevo);
		map.put("FilterVO", filtervo);
		List<SitterVO> list = dao.filter(map);
//		System.out.println(list.get(0));
		return list;
		
	}

	public int searchCount(SitterVO sittervo) {
		return dao.searchCount(sittervo);
	}

	public int filterCount(FilterVO filtervo) {
		return dao.filterCount(filtervo);
	}


}
