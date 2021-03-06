package com.rms.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.rms.dao.AnnouncementDao;
import com.rms.dao.BaseDao;
import com.rms.model.Announce_section;
import com.rms.model.Announcement;

@Repository
@Component("announcementDao")
public class AnnouncementDaoImpl extends BaseDao implements AnnouncementDao{
	
	/**
	 * 发布公告
	 */
	public boolean publish(Announcement an) {
		hibernateTemplate.save(an);
		return true;
	}

	/**
	 * 查看已发布公告
	 */
	public int findAllCount() {
		@SuppressWarnings("unchecked")
		List<Announcement> an = hibernateTemplate.find(" from Announcement where announcement_type='保存并发布'");
		int row = an.size();
		return row;
	}

	/**
	 * 查看已发布公告
	 */
	public List<Announcement> findAll(int pageNow) {
		String sql="";
		sql="from Announcement where announcement_type='保存并发布 ' order by announcement_id desc ";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(sql);
		query.setFirstResult((pageNow - 1) * 20);
		query.setMaxResults(20);
		@SuppressWarnings("unchecked")
	
		List<Announcement> an = query.list();
		session.close();
		return an;
	}

	/**
	 * 添加栏目
	 */
	public boolean addSection(Announce_section as) {
		hibernateTemplate.save(as);
		return true;
	}

	/*
	 * 删除栏目
	 */
	public void deleteSection(Announce_section s) {
		hibernateTemplate.delete(s);
	}

	/**
	 * 查询出所有的栏目内容
	 */
	public List<Announce_section> findall1() {
		@SuppressWarnings("unchecked")
		List<Announce_section> aaa = hibernateTemplate.find("from Announce_section ");
		return aaa;
	}

	/**
	 * 根据id查询出栏目的详细信息
	 */
	public List<Announce_section> changeSectionByid(int as_id) {
		@SuppressWarnings("unchecked")
		List<Announce_section> as = hibernateTemplate.find("from Announce_section where as_id = '"+as_id+"'");
		return as;
	}

	/**
	 * 更新栏目信息的方法
	 */
	public void updateA_sectioninfo(Announce_section s) {
		hibernateTemplate.update(s);
	}

	/**
	 * 根据id查询出“保存并发布”公告的详细信息
	 */
	public List<Announcement> findbyAsid(int  as_id) {
		@SuppressWarnings("unchecked")
		List<Announcement> ann=hibernateTemplate.find("from Announcement where announcement_type='保存并发布' and  as_id='"+as_id+"' ");
		return ann ;
	}
	
	/**
	 * 根据id查询出“保存未发布” 的公告的信息
	 */
	public List<Announcement> findbyAsid1(int as_id) {
		@SuppressWarnings("unchecked")
		List<Announcement> ann=hibernateTemplate.find("from Announcement where announcement_type='保存未发布' and as_id='"+as_id+"' ");
		return ann ;
	}

	/**
	 * 根据id查询出公告的信息
	 */
	public List<Announcement> findAllinfobyid(int announcement_id) {
		@SuppressWarnings("unchecked")
		List<Announcement> ann=hibernateTemplate.find("from Announcement where announcement_id='"+announcement_id+"'");
		return ann ;
	}

	/**
	 * 删除公告的方法
	 */
	public void deleteAbyid(Announcement s) {
		hibernateTemplate.delete(s);
	}

	/**
	 * 更新浏览次数的方法
	 */
	public void changeviews(Announcement an) {
		hibernateTemplate.update(an);
	}
	
	/**
	 * 查询出所有“保存未发布” 的公告数量的方法
	 */
	public int findAll2Count() {
		@SuppressWarnings("unchecked")
		List<Announcement> an = hibernateTemplate.find(" from Announcement where announcement_type='保存未发布 '");
		int row = an.size();
		return row;
	}

	/**
	 * 分页显示“保存未发布” 的公告的方法
	 */
	public List<Announcement> findAll2(int pageNow) {
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("from Announcement where announcement_type='保存未发布 ' order by announcement_id desc");
		query.setFirstResult((pageNow - 1) * 20);
		query.setMaxResults(20);
		@SuppressWarnings("unchecked")
		List<Announcement> an = query.list();
		session.close();
		return an;
	}

	@Override
	public List<Announcement> findLoad(int id) {
		@SuppressWarnings("unchecked")
		List<Announcement> ann=hibernateTemplate.find("from Announcement where announcement_id<"+id+"  order by announcement_id desc ");
		return ann;
		
	}

	@Override
	public List<Announcement> findNext(int id) {
		@SuppressWarnings("unchecked")
		List<Announcement> ann=hibernateTemplate.find("from Announcement where announcement_id>"+id+"order by announcement_id asc ");
		return ann ;
	}

	/**
	 * 根据pageNow 和 announcement_type as_name 查询出公告信息的方法
	 */
	public List<Announcement> findAnnoinfos(int pageNow, String announcement_type,String as_name) {
		String sql = "";
		System.out.println("pageNow=="+pageNow+",anouncement_type="+announcement_type+",as_name="+as_name);
		if(announcement_type.equals("保存并发布")){
			if(as_name.equals("全部公告")){
				sql = "from Announcement where   announcement_type='保存并发布' order by announcement_id desc";
			}else{
				sql = "from Announcement where announcement_type='保存并发布'  and as_name= '"+as_name+"' order by announcement_id desc";
			}
		}else{
			if(as_name.equals("全部公告") ){
				sql = "from Announcement where announcement_type='保存未发布' order by announcement_id desc";
			}else{
				sql = "from Announcement where announcement_type='保存未发布' and as_name= '"+as_name+"' order by announcement_id desc";
			}
			
		}
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(sql);
		query.setFirstResult((pageNow - 1) * 20);
		query.setMaxResults(20);
		@SuppressWarnings("unchecked")
		List<Announcement> anno =  query.list();
		session.close();
		return anno;
	}

	/**
	 * 根据pageNow 和 announcement_type as_name 查询出公告信息的  数量  的方法
	 */
	public List<Announcement> findasnonum(String announcement_type, String as_name) {
		String sql = "";
		if(announcement_type.equals("保存并发布")){
			if(as_name.equals("全部公告")){
				sql = "from Announcement where announcement_type = '保存并发布'";
			}else {
				sql = "from Announcement where announcement_type = '保存并发布' and as_name='"+ as_name+"'";
			}
		}else{
			if(as_name.equals("全部公告")){
				sql = "from Announcement where announcement_type = '保存未发布' ";
			}else{
				sql = "from Announcement where announcement_type = '保存未发布' and as_name='"+ as_name+"'";
			}
		}
		@SuppressWarnings("unchecked")
		List<Announcement> msi = hibernateTemplate.find(sql);
		return msi;
	}

	/**
	 * 编辑未发布公告
	 */
	public void updateAnno(Announcement ann) {
		hibernateTemplate.update(ann);
	}

}



	

