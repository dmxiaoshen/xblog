package com.dmxiaoshen.blog.web.home.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@RequestMapping("/index")
	public String index(ModelMap model){
		return "/home/index";
	}
	
	@RequestMapping("/article")
	public String article(ModelMap model){
		return "/home/article";
	}

}
