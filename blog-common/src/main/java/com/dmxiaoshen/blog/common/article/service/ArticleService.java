package com.dmxiaoshen.blog.common.article.service;

import java.util.List;

import com.dmxiaoshen.blog.common.article.entity.Article;

public interface ArticleService {

	void save(Article article);

	List<Article> findList();

	Article get(Long id);

}
