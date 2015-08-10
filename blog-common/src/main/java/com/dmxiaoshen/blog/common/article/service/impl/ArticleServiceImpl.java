package com.dmxiaoshen.blog.common.article.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dmxiaoshen.blog.base.service.ServiceSupport;
import com.dmxiaoshen.blog.base.utils.StringUtil;
import com.dmxiaoshen.blog.common.article.entity.Article;
import com.dmxiaoshen.blog.common.article.entity.Tags;
import com.dmxiaoshen.blog.common.article.service.ArticleService;
import com.dmxiaoshen.blog.common.article.service.TagsService;
import com.dmxiaoshen.blog.common.constants.AppConstants;

@Service
public class ArticleServiceImpl extends ServiceSupport implements ArticleService{
	@Autowired
	private TagsService tagsService;

	@Override
	public void saveOrUpdate(Article article) {
		if(StringUtils.isNotBlank(article.getId())){
			update(article);
		}else{
			save(article);
		}
		
	}
	
	private void update(Article article){
		
	}
	
	private void save(Article article){
		Date now = new Date();
		article.setCreateTime(now);
		article.setUpdateTime(now);
		article.setId(StringUtil.getUUID());
		article.setDelFlag(AppConstants.DEL_FLAG_NO);
		article.setTags(article.getTags().replaceAll("，", ","));
		processTags(article.getTags(),null);
		baseHibernateDao.add(article);
	}
	
	private Set<String> createSet(String[] arrays){
		Set<String> set = new HashSet<String>();
		for(String s:arrays){
			set.add(s);
		}
		return set;
	}

	private void processTags(String tags,String old){
		String[] currentTags = tags.split(",");
		if(old!=null){
			String[] oldTags = old.split(",");
			if(!old.equals(tags)){
				addTags(comparison(currentTags,createSet(oldTags)));
				removeTags(comparison(oldTags, createSet(currentTags)));
			}
		}else{
			List<String> list = new ArrayList<String>();
			for(String tag : currentTags){
				list.add(tag);
			}
			addTags(list);
		}
	}
	
	private List<String> comparison(String[] source,Set<String> dist){
		List<String> result = new ArrayList<String>();
		
		return result;
	}
	
	private Map<String,Tags> getAllTagsMap(){
		List<Tags> tagsAllList = tagsService.findAllList();
		Map<String,Tags> tagsMap = new HashMap<String,Tags>();
		for(Tags tag : tagsAllList){
			tagsMap.put(tag.getName(), tag);
		}
		return tagsMap;
	}
	private void addTags(List<String> tags){
		Map<String,Tags> tagsMap = getAllTagsMap();
		for(String tag:tags){
			if(tagsMap.containsKey(tag)){
				Tags old = tagsMap.get(tag);
				old.setTotal(old.getTotal()+1);
				old.setUpdateTime(new Date());
				if(AppConstants.DEL_FLAG_YES.equals(old.getDelFlag())){
					old.setDelFlag(AppConstants.DEL_FLAG_NO);					
				}
				baseHibernateDao.update(old);
			}else{
				Tags newTag = new Tags();
				newTag.setId(StringUtil.getUUID());
				newTag.setName(tag);
				newTag.setTotal(newTag.getTotal()+1);
				newTag.setDelFlag(AppConstants.DEL_FLAG_NO);
				Date now = new Date();
				newTag.setCreateTime(now);
				newTag.setUpdateTime(now);
				baseHibernateDao.add(newTag);
			}
		}
	}
	
	private void removeTags(List<String> tags){
		Map<String,Tags> tagsMap = getAllTagsMap();
		for(String tag:tags){
			Tags old = tagsMap.get(tag);
			old.setTotal(old.getTotal()-1);
			if(old.getTotal()==0){
				old.setDelFlag(AppConstants.DEL_FLAG_YES);
			}
			old.setUpdateTime(new Date());
			baseHibernateDao.update(old);
		}
	}
	
	public static void main(String[] args) {
		String s = "后说,java，jquery".replaceAll("，", ",");
		String[] str = s.split(",");
		System.out.println(str.length);
		System.out.println(Arrays.toString(str));
	}

	@Override
	public Article get(String id) {
		Article article = baseHibernateDao.get(Article.class, id);
		processArticle(article, true);
		return article;
	}

	@Override
	public List<Article> findList() {
		String hql = " from Article where delFlag=:flag order by date desc";
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("flag", AppConstants.DEL_FLAG_NO);
		List<Article> result = baseHibernateDao.findList(hql, paramMap);
		for(Article article : result){
			processArticle(article, false);
		}
		return result;
	}
	
	private void processArticle(Article article,boolean isFull){		
		if(article.getHtmlContent().indexOf("&lt;!--")!=-1){
			StringBuilder sb = new StringBuilder();
			String htmlContent = article.getHtmlContent();
			sb.append(htmlContent.substring(0, htmlContent.indexOf("&lt;!--")));
			if(isFull){
				sb.append(htmlContent.substring(htmlContent.indexOf("--&gt;")+6, htmlContent.length()));
			}else{
				sb.append("<a href='${ctx}/article/view?id="+article.getId()+"'>Read More >></a></p>");
			}
			
			article.setHtmlText(sb.toString());
		}else{
			article.setHtmlText(article.getHtmlContent());
		}		
	}
		
}
