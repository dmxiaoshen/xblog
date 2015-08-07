package com.dmxiaoshen.blog.common.dict.service;

import java.util.List;

import com.dmxiaoshen.blog.common.dict.entity.Dict;

public interface DictService {

	List<Dict> findByType(String type);

}
