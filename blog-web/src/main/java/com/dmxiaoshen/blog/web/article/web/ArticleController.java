package com.dmxiaoshen.blog.web.article.web;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dmxiaoshen.blog.common.article.entity.Article;
import com.dmxiaoshen.blog.common.article.service.ArticleService;
import com.dmxiaoshen.blog.common.dict.constants.DictConstants;
import com.dmxiaoshen.blog.common.dict.entity.Dict;
import com.dmxiaoshen.blog.common.dict.service.DictService;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	private  final Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private ArticleService articleService;
	@Autowired
	private DictService dictService;

	@RequestMapping(value = "/index")
	public String adminIndex(ModelMap model) {
		return "/article/index";
	}
	
	@RequestMapping(value = "/add")
	public String addPage(ModelMap model,String id) {
		if(StringUtils.isNotBlank(id)){
			//model.put("article", articleService.get(Long.valueOf(id)));
		}
		List<Dict> categoryList = dictService.findByType(DictConstants.CATEGORY);
		model.put("categoryList", categoryList);
		model.put("defaultCate", categoryList.get(0));
		return "/article/add";
	}
	
	@RequestMapping(value="/save")
	@ResponseBody
	public String save(Article article){
		//articleService.save(article);
		String html = article.getHtmlContent();
		//logger.debug(""+html.contains("<p>&lt;!--more--&gt;</p>"));
		int start = html.indexOf("&lt;");
		int end = html.indexOf("&gt;");
		StringBuilder sb = new StringBuilder();
		String s1 = html.substring(0,start);
		String s2 = html.substring(end+4, html.length());
		sb.append(html.substring(0, start)).append(html.substring(end, html.length()));
		String kkk = sb.toString();
		logger.debug(start+"-"+end);
		html.replaceAll("&lt;","");
		logger.debug(html);
		logger.debug(kkk);
		return "success";
	}
}
