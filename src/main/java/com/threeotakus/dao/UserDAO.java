package com.threeotakus.dao;

import com.threeotakus.model.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;


public interface UserDAO {
    @Select("select * from `users` where username=#{username}")
    User selectUserByName(String username) throws Exception;

    @Select("select * from `users` where uid=#{uid}")
    User selectUserByUId(int uid) throws Exception;

    @Insert("INSERT INTO `users`(username, password, ctime) VALUES (#{username}, #{password}, #{ctime})")
    @Options(useGeneratedKeys=true,keyProperty="uid")
    int insertUser(User newuser);


}
