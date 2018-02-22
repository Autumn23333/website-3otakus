package com.threeotakus.dao;

import org.apache.ibatis.annotations.Select;

public interface PermissionDAO {
    @Select("SELECT count(*) FROM `permgroup` WHERE pgname=#{0} and permission=#{1}")
    int checkPermission(String action, int permission);

}
