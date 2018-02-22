package com.threeotakus.service;

import com.threeotakus.model.Video;
import com.threeotakus.model.VideoPage;

import java.util.ArrayList;

public interface VideoServ {
    int insertNewVideo(String title, int author, String description, String coverName,
                       String videoPath, String videoName, String ptitle);

    int insertVPage(int oid, String ptitle, String videoPath, String videoName);

    ArrayList<Video> selectVideosByAuthor(int author);

    Video selectVideoByOId(int oid);

    VideoPage selectVideoPageByOIdPId(int oid, int pid);

    String selectVideoList(int permission, int page, int count) throws Exception;
}
