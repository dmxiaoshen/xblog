package com.dmxiaoshen.blog.common.article.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.dmxiaoshen.blog.base.entity.BaseEntity;
import com.dmxiaoshen.blog.base.serializer.DateSerializer;
import com.dmxiaoshen.blog.common.dict.entity.Dict;

@Entity
@Table(name = "x_article")
public class Article extends BaseEntity {

	/** */
	private static final long serialVersionUID = -5532921914388895195L;

	private String title;
	private Date date;
	private Dict category;
	private String tags;
	private String mdFileName;
	private String mdContent;
	private String htmlContent;
	private String htmlText;

	@Transient
	public String getHtmlText() {
		return htmlText;
	}

	public void setHtmlText(String htmlText) {
		this.htmlText = htmlText;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@JsonSerialize(using=DateSerializer.class)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@ManyToOne
	@JoinColumn(name="category_id")
	public Dict getCategory() {
		return category;
	}

	public void setCategory(Dict category) {
		this.category = category;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getMdFileName() {
		return mdFileName;
	}

	public void setMdFileName(String mdFileName) {
		this.mdFileName = mdFileName;
	}

	public String getMdContent() {
		return mdContent;
	}

	public void setMdContent(String mdContent) {
		this.mdContent = mdContent;
	}

	public String getHtmlContent() {
		return htmlContent;
	}

	public void setHtmlContent(String htmlContent) {
		this.htmlContent = htmlContent;
	}

}
