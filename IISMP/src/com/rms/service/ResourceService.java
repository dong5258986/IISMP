package com.rms.service;

import java.util.List;


import com.rms.model.ResourceInfo;
import com.rms.model.Resource_Type;

public interface ResourceService {
	//查看资源类型
	public List<Resource_Type> findtype();
	//上传资源
	public boolean upload(ResourceInfo re);
	//增加文件库
	public void addRtype(Resource_Type rt);
	
	//根据id查找资源库
	public List<Resource_Type>  findtypeByid(int rt_id);
	//根据id删除资源库
	public void deleteRTbyid(Resource_Type ret);

	//查看全部资源
	public List<ResourceInfo> findreinfo();
	
	//根据资料id进行查找
	public List<ResourceInfo> findrinfo(int resource_id);
	//根据资料id进行删除
	public void deleterebyid(ResourceInfo re);
	//根据资源库id查找资料
	public List<ResourceInfo> findrinfoByrt(int pageNow, int rt_id);
	/**List<ResourceInfo>
	 * @param id
	 * @return
	 */
	public int findreamount(int id);
	/**void
	 * @param tt 
	 * 
	 */
	public void edittype(Resource_Type tt);
	/**List<ResourceInfo>
	 * @return
	 */
	public List<ResourceInfo> findreinfo2();
	/**Resource_Type
	 * @param id
	 * @return
	 */
	public List<Resource_Type> findtyByid(int id);
	/**int
	 * @return
	 */
	public int findAllres();
	/**long
	 * @param rt_id
	 * @return
	 */
	public int findallresByrt(int rt_id);
	/**List<Resource_Type>
	 * @param rt_id
	 * @return
	 */
	public List<Resource_Type> findrtbyid(int rt_id);
	/**List<ResourceInfo>
	 * @param rt_id
	 * @return
	 */
	public List<ResourceInfo> findallres(int rt_id);
	


}
