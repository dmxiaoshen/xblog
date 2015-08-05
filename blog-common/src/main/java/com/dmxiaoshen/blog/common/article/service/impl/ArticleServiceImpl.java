package com.dmxiaoshen.blog.common.article.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.dmxiaoshen.blog.base.service.ServiceSupport;
import com.dmxiaoshen.blog.common.article.entity.Article;
import com.dmxiaoshen.blog.common.article.service.ArticleService;

@Service
public class ArticleServiceImpl extends ServiceSupport implements ArticleService{

	@Override
	public void save(Article article) {
		if(article.getId()==null){
			
			article.setMdContent(article.getMdText().getBytes());
			article.setHtmlContent(article.getHtmlText().getBytes());
			Date now = new Date();
			article.setCreateTime(now);
			article.setUpdateTime(now);
			baseHibernateDao.add(article);
		}else{
			Article old = get(article.getId());
			old.setMdContent(article.getMdText().getBytes());
			old.setHtmlContent(article.getHtmlText().getBytes());
			old.setTitle(article.getTitle());
			old.setUpdateTime(new Date());
			baseHibernateDao.update(old);
		}
		
	}

	@Override
	public List<Article> findList() {
		String hql = " from Article";
		List<Article> list = baseHibernateDao.findList(hql, null);
		for(Article art:list){
			art.setHtmlText(new String(art.getHtmlContent()));
			art.setMdText(new String(art.getMdContent()));
		}
		return list;
	}

	@Override
	public Article get(Long id) {
		Article article= baseHibernateDao.get(Article.class, id);
		if(article!=null){
			article.setMdText(new String(article.getMdContent()));
		}
		return article;
	}

}
