package com.threeotakus.dao;

import com.threeotakus.model.Video;
import com.threeotakus.model.VideoPage;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

public interface VideoDAO {
    @Insert("INSERT INTO `videos`(title, author, description, cover, permission, ctime) VALUES " +
            "(#{title}, #{author}, #{description}, #{cover}, #{permission}, #{ctime})")
    @Options(useGeneratedKeys=true,keyProperty="oid")
    int insertNewVideo(Video newvideo);

    @Select("SELECT * FROM `videos` WHERE title=#{title}")
    Video selectVideoByTitle(String title);

    @Insert("INSERT INTO `vpages`(oid, pid, ptitle, ispub) VALUES (#{oid}, #{pid}, #{ptitle}, #{ispub})")
    int insertNewVPage(VideoPage newVPage);

    @Select("SELECT count(*) FROM `vpages` WHERE oid=#{oid}")
    int getVPageCountOfVideo(int oid);

    @Select("SELECT * FROM `videos` WHERE author=#{author} ORDER BY ctime DESC")
    ArrayList<Video> selectVideosByAuthorOCtimeD(int author);

    @Select("SELECT * FROM `videos` WHERE oid=#{oid}")
    Video selectVideoByOId(int oid);

    @Select("SELECT * FROM `vpages` WHERE oid=#{0} and pid=#{1}")
    VideoPage selectVideoPageByOIdPid(int oid, int pid);

    @Select("SELECT * FROM `videos` WHERE `videos`.permission in (select pgname from permgroup where permission = #{0}) limit #{1}, #{2}")
    ArrayList<Video> selectVideoListByPage(int permission, int start, int end);
}
