package com.rms.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Announcement {
	private int announcement_id;
	private String announcement_info;
	private String announcement_time;
	private String m_username;
	private String announcement_title;
	private String as_name;
	private int as_id;
	private int announcement_amount;
	private String m_role;
	private String announcement_type;
	private int announcement_views;
	@Id
	@GeneratedValue
	
	public int getAnnouncement_id() {
		return announcement_id;
	}
	public void setAnnouncement_id(int announcement_id) {
		this.announcement_id = announcement_id;
	}
	public String getAnnouncement_info() {
		return announcement_info;
	}
	public void setAnnouncement_info(String announcement_info) {
		this.announcement_info = announcement_info;
	}
	public String getAnnouncement_time() {
		return announcement_time;
	}
	public void setAnnouncement_time(String announcement_time) {
		this.announcement_time = announcement_time;
	}
	public String getM_username() {
		return m_username;
	}
	public void setM_username(String m_username) {
		this.m_username = m_username;
	}
	public String getAnnouncement_title() {
		return announcement_title;
	}
	public void setAnnouncement_title(String announcement_title) {
		this.announcement_title = announcement_title;
	}
	public String getAs_name() {
		return as_name;
	}
	public void setAs_name(String as_name) {
		this.as_name = as_name;
	}
	public int getAnnouncement_amount() {
		return announcement_amount;
	}
	public void setAnnouncement_amount(int announcement_amount) {
		this.announcement_amount = announcement_amount;
	}
	public int getAs_id() {
		return as_id;
	}
	public void setAs_id(int as_id) {
		this.as_id = as_id;
	}
	public String getM_role() {
		return m_role;
	}
	public void setM_role(String m_role) {
		this.m_role = m_role;
	}
	public String getAnnouncement_type() {
		return announcement_type;
	}
	public void setAnnouncement_type(String announcement_type) {
		this.announcement_type = announcement_type;
	}
	public int getAnnouncement_views() {
		return announcement_views;
	}
	public void setAnnouncement_views(int announcement_views) {
		this.announcement_views = announcement_views;
	}
	
}
