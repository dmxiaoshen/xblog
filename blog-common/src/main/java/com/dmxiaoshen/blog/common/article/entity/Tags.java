package com.dmxiaoshen.blog.common.article.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.dmxiaoshen.blog.base.entity.BaseEntity;

@Entity
@Table(name = "x_tags")
public class Tags extends BaseEntity {

	/** */
	private static final long serialVersionUID = -2684480806569539321L;

	private String name;
	private int total;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
