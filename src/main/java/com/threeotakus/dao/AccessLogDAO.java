package com.threeotakus.dao;

import com.threeotakus.model.AccessLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.Date;

public interface AccessLogDAO {
    @Insert("INSERT INTO `access_log`(ip, session, access_time, block_time, access_url, access_para, access_method) " +
            "VALUES (#{ip}, #{session}, #{access_time}, #{block_time}, #{access_url}, #{access_para}, #{access_method})")
    @Options(useGeneratedKeys=true,keyProperty="id")
    int insertUser(AccessLog newlog);

    // Peroid is in seconds.
    @Select("SELECT * FROM `access_log` WHERE ip=#{0} and access_time >= #{1} order by access_time desc")
    ArrayList<AccessLog> selectAccessInPeriod(String ip, Date period);

    @Select("SELECT * FROM `access_log` WHERE ip=#{0} order by block_time desc limit 0, 1")
    AccessLog selectLastBlock(String ip);
}
