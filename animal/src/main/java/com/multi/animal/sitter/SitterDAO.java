package com.multi.animal.sitter;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.animal.user.UserVO;


@Repository
public class SitterDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(SitterVO sittervo) {
		my.insert("sitter.insert", sittervo);
	}

	public List<SitterVO> list(Map<String, Object> map) {
		System.out.println("<< DAO >>"+map.get("SitterVO"));
		System.out.println("<< DAO >>"+map.get("PageVO"));
		System.out.println("<< DAO >>"+map.get("UserVO"));
		return my.selectList("sitter.search", map);
	}

	public Integer count() {
		return my.selectOne("sitter.count");
	}

	public SitterVO one(String sitterId) {
		System.out.println(sitterId);
		return my.selectOne("sitter.one", sitterId);
	}

	public void delete(String sitterId) {
		my.delete("sitter.delete", sitterId);
	}

	public void update(SitterVO vo) {
		System.out.println("<< DAO >>"+vo);
		my.update("sitter.update", vo);
	}

	public List<SitterVO> filter(Map<String, Object> map) {
		System.out.println("<< DAO >>"+map.get("FilterVO"));
		System.out.println("<< DAO >>"+map.get("PageVO"));
		System.out.println("<< DAO >>"+map.get("UserVO"));
		return my.selectList("sitter.filter", map);
	}

	public int searchCount(Map<String, Object> map) {
		return my.selectOne("sitter.scount", map);
	}

	public int filterCount(Map<String, Object> map) {
		return my.selectOne("sitter.fcount", map);
	}

	public UserVO getSigunguCode(String userId) {
		return my.selectOne("user.one", userId);
	}

	
}
