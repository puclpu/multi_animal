package com.multi.animal.expert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExpertController {

	@Autowired
	ExpertService es;
	
	@RequestMapping("sitter/expert_insert")
	public void insert(ExpertVO vo) {
		es.insert(vo);
	}
}
