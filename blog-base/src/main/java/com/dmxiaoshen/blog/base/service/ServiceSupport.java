package com.dmxiaoshen.blog.base.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dmxiaoshen.blog.base.dao.BaseHibernateDao;

public abstract class ServiceSupport {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    protected BaseHibernateDao baseHibernateDao;

}
