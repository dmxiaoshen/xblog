package com.dmxiaoshen.blog.common.dict.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dmxiaoshen.blog.base.service.ServiceSupport;
import com.dmxiaoshen.blog.common.constants.AppConstants;
import com.dmxiaoshen.blog.common.dict.entity.Dict;
import com.dmxiaoshen.blog.common.dict.service.DictService;

@Service
public class DictServiceImpl extends ServiceSupport implements DictService{

	@Override
	public List<Dict> findByType(String type) {
		String hql = " from Dict where delFlag=:delFlag and type=:type order by sort ";
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("delFlag", AppConstants.DEL_FLAG_NO);
		paramMap.put("type", type);
		return baseHibernateDao.findList(hql, paramMap);
	}

}
