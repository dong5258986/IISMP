package com.rms.dao;

import java.util.List;

import com.rms.model.Announce_section;
import com.rms.model.Announcement;
import com.rms.model.Contest;
public interface AnnouncementDao {
	
	//添加公告
	public abstract boolean publish(Announcement an);
	
	public abstract int findAllCount();

	public abstract List<Announcement> findAll(int pageNow);

	public abstract boolean addSection(Announce_section as);

	public abstract void deleteSection(Announce_section s);

	public abstract List<Announce_section> findall1();

	public abstract List<Announce_section> changeSectionByid(int as_id);

	public abstract void updateA_sectioninfo(Announce_section s);

	public abstract List<Announcement> findbyAsid(int as_id);

	public abstract List<Announcement> findAllinfobyid(int announcement_id);

	public abstract void deleteAbyid(Announcement s);

	public abstract void changeviews(Announcement an);

	public abstract int findAll2Count();

	public abstract List<Announcement> findAll2(int pageNow);

	public abstract List<Announcement> findLoad(int id);

	public abstract List<Announcement> findNext(int id);

	public abstract List<Announcement> findbyAsid1(int as_id);

	public abstract List<Announcement> findAnnoinfos(int pageNow,
			String announcement_type, String as_name);

	public abstract List<Announcement> findasnonum(String announcement_type,
			String as_name);

	
	//编辑未发布公告
	public abstract void updateAnno(Announcement ann);
	

	


}
