
package com.dmxiaoshen.blog.base.dao;

import java.util.List;
import java.util.Map;

import com.dmxiaoshen.blog.base.page.Pagination;


public interface BaseHibernateDao {
    
    void add(Object object);
    
    void update(Object object);
    
    void delete(Object object);
    
    void delete(Class<?> clzss,Object id);
    
    <T> T load(Class<T> clzss,Object id);
    
    <T> T get(Class<T> clzss,Object id);
    
    <T> List<T> findList(String hql,Map<String,Object> paramMap);
    
    <T> List<T> findList(String hql,Map<String,Object> paramMap,int start,int max);
    
    <T> T findOne(String hql,Map<String,Object> paramMap);
    
    <T> Pagination<T> list(final String hql, final Map<String, Object> paramMap, int page, int pageSize);
}
