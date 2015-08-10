package com.dmxiaoshen.blog.common.article.service;

import java.util.List;

import com.dmxiaoshen.blog.common.article.entity.Article;


public interface ArticleService {

	void saveOrUpdate(Article article);

	Article get(String id);

	List<Article> findList();


}
