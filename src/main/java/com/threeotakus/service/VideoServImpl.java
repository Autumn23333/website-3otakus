package com.threeotakus.service;

import com.threeotakus.controller.HomeController;
import com.threeotakus.dao.UserDAO;
import com.threeotakus.dao.VideoDAO;
import com.threeotakus.model.User;
import com.threeotakus.model.Video;
import com.threeotakus.model.VideoPage;
import com.threeotakus.utils.FileOper;
import com.threeotakus.utils.Prop;
import com.threeotakus.utils.StringTable;
import com.threeotakus.utils.UnicodeUtil;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class VideoServImpl implements VideoServ {
    @Autowired
    private VideoDAO videoDAO;
    @Autowired
    private UserDAO userDAO;

    // Looger
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


    @Override
    public int insertNewVideo(String title, int author, String description, String coverName,
                              String videoPath, String videoName, String ptitle) {
        Video existedVideo = videoDAO.selectVideoByTitle(title);
        if (existedVideo != null) {
            return -1; // Indicate there has already a video with same title
        } else {
            Video newvideo = new Video(title, author, description, coverName, "UnReviewedVideo");

            int rs = videoDAO.insertNewVideo(newvideo);
            if (rs == 0) {
                logger.warn("Video is uploaded but not add into database. Info: " + newvideo + ", Addr: " + videoName);
            } else {
                newvideo = videoDAO.selectVideoByTitle(title);
                // First part
                String newvideoName = "otk" + newvideo.getOid() + "-1.mp4";
                boolean flag = FileOper.rename(videoPath, videoName, newvideoName);
                if (!flag) {
                    logger.warn("Rename video to otk format failed. Origin name: " + videoName);
                } else {
                    logger.info("Video is uploaded successfully. Info: " + newvideo);
                }
                insertVPage(newvideo.getOid(), ptitle, null, null);
            }
            return 0;
        }
    }

    @Override
    public int insertVPage(int oid, String ptitle, String videoPath, String videoName) {
        int vcount = 0;
        int rs = 0;
        int trytimes = 0;
        do {
            vcount = videoDAO.getVPageCountOfVideo(oid);
            VideoPage videoPage = new VideoPage(oid, vcount + 1, ptitle);
            try {
                rs = videoDAO.insertNewVPage(videoPage);
                System.out.println("rs=" + rs);
            } catch (Exception e) {
                e.printStackTrace();
                rs = -1;
            }
            trytimes++;
        } while (rs > 1 && trytimes < 3);
        if (trytimes < 3 && videoPath != null && videoName != null) {
            String newvideoName = "otk" + oid + "-" + (vcount + 1) + ".mp4";
            boolean flag = FileOper.rename(videoPath, videoName, newvideoName);
            if (!flag) {
                logger.warn("Rename video to otk format failed. Origin name: " + videoName);
            } else {
                logger.info("Video is uploaded successfully. File:" + newvideoName);
            }

        }
        return rs;
    }

    @Override
    public ArrayList<Video> selectVideosByAuthor(int author) {
        return videoDAO.selectVideosByAuthorOCtimeD(author);
    }

    @Override
    public Video selectVideoByOId(int oid) {
        return videoDAO.selectVideoByOId(oid);
    }

    @Override
    public VideoPage selectVideoPageByOIdPId(int oid, int pid) {
        return videoDAO.selectVideoPageByOIdPid(oid, pid);
    }

    @Override
    public String selectVideoList(int permission, int page, int count) throws Exception {
        JSONObject jsonObject = new JSONObject();
        if (count > 100) {
            // Too large count per page
            jsonObject.put("code", -1);
            jsonObject.put("state", StringTable.getValue("WrongParameters"));
            jsonObject.put("data", new ArrayList<Video>());
        } else {
            int start = (page - 1) * count;
            int end = count;
            ArrayList<Video> videos = videoDAO.selectVideoListByPage(permission, start, end);
            JSONArray videosJson = new JSONArray();
            for (Video v: videos) {
                Map<String, String> attr = new HashMap<>();
                attr.put("cover", Prop.getValue("CoverShowPath")+ File.separator+v.getCover());
                User user = userDAO.selectUserByUId(v.getAuthor());
                attr.put("author", user!=null?user.getUsername():"");
                attr.put("oid", String.valueOf(v.getOid()));
                attr.put("title", v.getTitle());
                attr.put("ctime", v.getCtime().toString());
                attr.put("desc", v.getDescription());
                videosJson.put(attr);
            }
            jsonObject.put("data", videosJson);
            jsonObject.put("code", 0);
            jsonObject.put("state", StringTable.getValue("Success"));
        }
        return jsonObject.toString();
    }
}
