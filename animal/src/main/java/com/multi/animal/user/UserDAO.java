package com.multi.animal.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int checkId(String userId) {
		return my.selectOne("user.checkid", userId);
	}

	public void join(UserVO vo) {
		my.insert("user.insert", vo);
	}

	public UserVO one(String userId) {
		return my.selectOne("user.one", userId);
	}

}
