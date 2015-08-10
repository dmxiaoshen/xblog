package com.dmxiaoshen.blog.common.article.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dmxiaoshen.blog.base.service.ServiceSupport;
import com.dmxiaoshen.blog.common.article.entity.Tags;
import com.dmxiaoshen.blog.common.article.service.TagsService;

@Service
public class TagsServiceImpl extends ServiceSupport implements TagsService{

	@Override
	public List<Tags> findAllList() {
		return findList(null);
	}
	
	private List<Tags> findList(String delFlag){
		StringBuilder sb = new StringBuilder(" from Tags");
		Map<String,Object> paramMap = new HashMap<String,Object>();
		if(delFlag!=null){
			sb.append(" where delFlag=:flag ");
			paramMap.put("flag", delFlag);		
		}
		return baseHibernateDao.findList(sb.toString(), paramMap);
	}

}
