package com.rms.service.Impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.rms.model.Announce_section;
import com.rms.model.Announcement;
import com.rms.service.AnnouncementService;
import com.rms.service.BaseService;
@Component("announcementService")
public class AnnouncementServiceImpl extends BaseService implements AnnouncementService {

	//发布公告
	public boolean publish(Announcement an) {

		return this.announcementDao.publish(an);
	}

	//查询公告总数
	public int findAllCount() {
		
		return this.announcementDao.findAllCount();
	}

	//查询公告
	public List<Announcement> findAll(int pageNow) {
		
		return this.announcementDao.findAll(pageNow);
	}


	//添加栏目
	public boolean addSection(Announce_section as) {
		
		return this.announcementDao.addSection(as);
	}


	//删除栏目
	public void deleteSection(Announce_section s) {
		announcementDao.deleteSection(s);
		
	}


	//查找栏目
	public List<Announce_section> findAll1() {
		
		return this.announcementDao.findall1();
	}


	//根据id修改栏目
	public Announce_section changeSectionByid(int as_id) {
		List<Announce_section> as_section =announcementDao.changeSectionByid(as_id);
		if(as_section != null && as_section.size() > 0){
			Announce_section s = as_section.get(0);
			return s;
		}
		return null;
	}


	//更新栏目信息
	public void updateA_sectioninfo(Announce_section s) {
		announcementDao.updateA_sectioninfo(s);
		
	}


	/*
	 * 根据栏目id查看已发布公告
	 * */
	public List<Announcement> findbyAsid(int as_id) {
		
		return this.announcementDao.findbyAsid(as_id);
	}
	
	/*
	 * 根据栏目id查看未发布公告
	 * */
	public List<Announcement> findbyAsid1(int as_id) {
		
		return this.announcementDao.findbyAsid1(as_id);
	}

	//根据id查看公告
	public List<Announcement> findAllinfobyid( int announcement_id) {
		// TODO Auto-generated method stub
		return this.announcementDao.findAllinfobyid(announcement_id);
	}

	//根据id删除公告
	public void deleteAbyid(Announcement s) {
		announcementDao.deleteAbyid(s);
	}

	public void changeviews(Announcement an) {
		announcementDao.changeviews(an);
	}

	//查询未发布公告总数
	public int findAll2Count() {
		return this.announcementDao.findAll2Count();
	}


	//查询未发布公告
	public List<Announcement> findAll2(int pageNow) {
		return this.announcementDao.findAll2(pageNow);
	}

	/*查看上一条公告
	 * 
	 * */
	public List<Announcement> findLoad(int id) {
		return this.announcementDao.findLoad(id);
	}

	/**
	 * 查看下一条公告
	 */
	public List<Announcement> findNext(int id) {
		// TODO Auto-generated method stub
		return this.announcementDao.findNext(id);
	}

	/**
	 * 查询公告信息（）
	 */
	public List<Announcement> findAnnoinfos(int pageNow, String announcement_type,String as_name) {
		 List<Announcement> anno=announcementDao.findAnnoinfos(pageNow,announcement_type,as_name);
		 if(anno!=null&&anno.size()>0){
			 return anno;
		 }
		return null;
	}
	
	
	public long findallasno(String announcement_type, String as_name) {
		List<Announcement> msi = announcementDao.findasnonum(announcement_type,as_name);
		if(msi != null && msi.size() > 0){
			System.out.println("+++++++++++++++++++--"+msi.size());
			return msi.size();
		}
		return 0;
	}

	@Override
	public void updateAnno(Announcement ann) {
		announcementDao.updateAnno(ann);
	}

	/**
	 * 查询出未发布的公告的数量
	 */
	public int findweifabunum() {
		List<Announcement> announcement = announcementDao.findasnonum("保存未发布", "全部公告");
		if(announcement!=null && announcement.size()>0){
			return announcement.size();
		}
		return 0;
	}

	/**
	 * 根据announcement_type 查询出已发布的公告数量
	 * @param announcement_type
	 * @return
	 */
	public int findyifabunumbytype(String announcement_type, String as_name) {
		List<Announcement> announcement = announcementDao.findasnonum(announcement_type, as_name);
		if(announcement!=null && announcement.size()>0){
			return announcement.size();
		}
		return 0;
	}

	/**
	 * 根据announcement_type 查询出wei 发布的公告数量
	 * @param announcement_type
	 * @return
	 */
	public int findweifabunumbytype(String announcement_type, String as_name) {
		List<Announcement> announcement = announcementDao.findasnonum("保存未发布", as_name);
		if(announcement!=null && announcement.size()>0){
			return announcement.size();
		}
		return 0;
	}

}


	





