package com.dmxiaoshen.blog.common.dict.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.dmxiaoshen.blog.base.entity.BaseEntity;

@Entity
@Table(name = "x_dict")
public class Dict extends BaseEntity {

	/** */
	private static final long serialVersionUID = -54984128359559002L;

	private String value;
	private String label;
	private int sort;
	private String type;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
