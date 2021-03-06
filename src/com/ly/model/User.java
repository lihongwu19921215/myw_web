package com.ly.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ly.tool.Cnd;

import java.util.List;


public class User extends Model<User> {

    public static final User userDao = new User();

    public User getUser(Integer id)
    {
        return userDao.findById(id);
    }

    public Page<User> getListUser(int pageNum,int pageSize,User user)
    {
    	StringBuffer sb = new StringBuffer();
        if(Cnd.getSql(user, sb))
        {
            return userDao.paginate(pageNum, 20, "select *", sb.toString());
        }else{
        	return userDao.paginateByCache("user", "page_user_" + pageNum, pageNum, pageSize, "select *", "from user order by id desc");
        }
    }

    public boolean saveOrUpdate(User user)
    {
        boolean ok = false;
        Integer id = user.getInt("id");
        if (id == null || id <= 0){
            ok =  user.save();
        }else{
            ok = user.update();
        }
        CacheKit.removeAll("user");
        return ok;
    }

    public  User login(String email,String pwd)
    {
        User u = userDao.findFirst("select * from user where email = '"+email+"' and password = '"+pwd+"' order by id");
        if (u == null)
        {
            u = userDao.findFirst("select * from user where phone = '"+email+"' and password = '"+pwd+"' order by id");
        }
        return u;
    }
}