package com.dmxiaoshen.blog.web.home.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dmxiaoshen.blog.common.article.service.ArticleService;

@Controller
@RequestMapping("/home")
public class HomeController {
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/index")
	public String index(ModelMap model){
		return "/home/index";
	}
	
	@RequestMapping("/article")
	public String article(ModelMap model){
		model.put("articleList", articleService.findList());
		return "/home/article";
	}

}
