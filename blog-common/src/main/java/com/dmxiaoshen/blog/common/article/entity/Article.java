package com.dmxiaoshen.blog.common.article.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.dmxiaoshen.blog.base.entity.BaseEntity;

@Entity
@Table(name="x_article")
public class Article extends BaseEntity{

	/** */
	private static final long serialVersionUID = -5532921914388895195L;

	String title;
	byte[] mdContent;
	byte[] htmlContent;
	private String mdText;
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
	public byte[] getMdContent() {
		return mdContent;
	}
	public void setMdContent(byte[] mdContent) {
		this.mdContent = mdContent;
	}
	public byte[] getHtmlContent() {
		return htmlContent;
	}
	public void setHtmlContent(byte[] htmlContent) {
		this.htmlContent = htmlContent;
	}
	
	@Transient
	public String getMdText() {
		return mdText;
	}
	public void setMdText(String mdText) {
		this.mdText = mdText;
	}

	
}
