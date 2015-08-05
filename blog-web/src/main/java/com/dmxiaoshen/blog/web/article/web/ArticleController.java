package com.dmxiaoshen.blog.web.article.web;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dmxiaoshen.blog.common.article.entity.Article;
import com.dmxiaoshen.blog.common.article.service.ArticleService;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	@RequestMapping(value = "/index")
	public String adminIndex(ModelMap model) {
		return "/article/index";
	}
	
	@RequestMapping(value = "/add")
	public String addPage(ModelMap model,String id) {
		if(StringUtils.isNotBlank(id)){
			model.put("article", articleService.get(Long.valueOf(id)));
		}
		return "/article/add";
	}
	
	@RequestMapping(value="/save")
	@ResponseBody
	public String save(Article article){
		articleService.save(article);
		return "success";
	}
}
