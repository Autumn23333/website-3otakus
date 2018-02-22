package com.threeotakus.controller;

import com.threeotakus.model.User;
import com.threeotakus.model.Video;
import com.threeotakus.model.VideoPage;
import com.threeotakus.service.PermissionServ;
import com.threeotakus.service.UserServ;
import com.threeotakus.service.VideoServ;
import com.threeotakus.utils.MultipartFileSender;
import com.threeotakus.utils.Permission;
import com.threeotakus.utils.Prop;
import com.threeotakus.utils.StringTable;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Paths;
import java.util.*;
import java.util.regex.Pattern;

// 注解标注此类为springmvc的controller，url映射为"/3otakus"
@Controller
@RequestMapping("")
public class VideoController {
    @Autowired
    private UserServ userServ;
    @Autowired
    private VideoServ videoServ;
    @Autowired
    private PermissionServ permissionServ;

    //添加一个日志器
    private static final Logger logger = LoggerFactory.getLogger(VideoController.class);


    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public ModelAndView upload(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("upload");
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        if (loginUser == null) {
            // User is not login
            model.addObject("error", StringTable.getValue("LoginInNotice"));
        } else if (!permissionServ.checkPermission("UploadVideo", loginUser.getPermission())) {
            // User doesnt have enough permission
            model.addObject("error", StringTable.getValue("NoUploadPermission"));
        } else {
            model.addObject("username", loginUser.getUsername());
            ArrayList<Video> orivlist = videoServ.selectVideosByAuthor(loginUser.getUid());
            ArrayList<Map<String, String>> vlist = new ArrayList<Map<String, String>>();
            for (Video v : orivlist) {
                HashMap<String, String> item = new HashMap<String, String>();
                item.put("oid", Integer.toString(v.getOid()));
                item.put("title", v.getTitle());
                item.put("ctime", v.getCtime().toString());
                vlist.add(item);
            }
            System.out.println("vlist = " + vlist);
            model.addObject("vlist", vlist);

        }
        return model;
    }

    @RequestMapping(value = "/upload_video", method = RequestMethod.POST)
    public ModelAndView upload_video(@RequestParam("video") MultipartFile video,
                                     @RequestParam("cover") MultipartFile cover,
                                     @RequestParam("author") String authorName,
                                     @RequestParam("title") String title,
                                     @RequestParam("description") String description,
                                     @RequestParam("ptitle1") String ptitle1,
                                     @RequestParam("ptitle2") String ptitle2,
                                     @RequestParam("type") String type,
                                     @RequestParam("partvideo") String partVideo,
                                     HttpServletRequest request) throws IllegalStateException, IOException {
        System.out.println(request.getCharacterEncoding());
        request.setCharacterEncoding("UTF-8");
        System.out.println(title);

        User loginUser = (User) request.getSession().getAttribute("loginUser");

        ModelAndView model = new ModelAndView("upload");

        if (loginUser == null) {
            // User is not login
            model.addObject("error", StringTable.getValue("LoginInNotice"));

        } else if (!permissionServ.checkPermission("UploadVideo", loginUser.getPermission())) {
            // User doesnt have enough permission
            model.addObject("error", StringTable.getValue("NoUploadPermission"));

        } else {
            int author = loginUser.getUid();
            // Uploaded video and create a new item

            //服务端的目录需要手动创建好
//            String coverPath = request.getServletContext().getRealPath("/WEB-INF/static/image/cover");
            String coverPath = Prop.getValue("CoverUploadPath");
//            String videoPath = request.getServletContext().getRealPath("/WEB_INF/video");
            String videoPath = Prop.getValue("VideoUploadPath");
            String coverName = UUID.randomUUID().toString().replaceAll("-", "");
            String videoName = UUID.randomUUID().toString().replaceAll("-", "") + ".mp4";
            boolean hasCover = false, hasVideo = false;
//                System.out.println("1 " + videoPath);
            File videoFile = null;
            File coverFile = null;

            // Check each files and write them to disk
            // However, it doesnt mean that it can be access by users. Only administrator can see it first.
            // When a file is uploaded, it is write to the disk first then change its filename if necessary
            if (!video.isEmpty()) {
                // Video is not empty
                String fileName = video.getOriginalFilename();
                if (fileName.endsWith(".mp4")) {
                    try {

                        InputStream inputStream = video.getInputStream();
                        byte[] bytes = new byte[1024 * 1024];
                        videoFile = new File(videoPath + File.separator + videoName);

                        while (videoFile.exists()) {
                            // There has been a file existed, we have to make uploaded file with another name
                            // However,s in general, this case should not be happened.
                            videoName = UUID.fromString(fileName + (new Date()).toString()).toString().replaceAll("-", "") + ".mp4";
                            videoFile = new File(videoPath + File.separator + videoName);

                        }

                        // There is no file existed, we could write new file in it
                        if (videoFile.createNewFile()) {
                            BufferedOutputStream buffStream =
                                    new BufferedOutputStream(new FileOutputStream(videoFile));
                            while (inputStream.read(bytes) > -1)
                                buffStream.write(bytes);
                            inputStream.close();
                            buffStream.close();
                            hasVideo = true;
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

            if (!type.equals("2")) {
                if (!cover.isEmpty()) {
                    // Cover is not empty
                    String fileName = cover.getOriginalFilename();
                    String postfix = fileName.substring(fileName.lastIndexOf("."));
                    if (postfix.equals(".jpg") || postfix.equals(".png") || postfix.equals(".gif") || postfix.equals(".jpeg")) {
                        try {

                            InputStream inputStream = cover.getInputStream();
                            byte[] bytes = new byte[1024 * 1024];
                            coverFile = new File(coverPath + File.separator + coverName + postfix);

                            while (coverFile.exists()) {
                                // There has been a file existed, we have to make uploaded file with another name
                                // However,s in general, this case should not be happened.
                                coverName = UUID.fromString(fileName + (new Date()).toString()).toString().replaceAll("-", "");
                                coverFile = new File(coverPath + File.separator + coverName + postfix);

                            }

                            coverName += postfix;
                            // There is no file existed, we could write new file in it
                            if (coverFile.createNewFile()) {
                                BufferedOutputStream buffStream =
                                        new BufferedOutputStream(new FileOutputStream(coverFile));
                                while (inputStream.read(bytes) > -1)
                                    buffStream.write(bytes);
                                inputStream.close();
                                buffStream.close();
                                hasCover = true;
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }

                if (hasCover && hasVideo) {
                    // There are cover and video file uploaded
                    int rs = videoServ.insertNewVideo(title, author, description, coverName, videoPath, videoName, ptitle1);
                    if (rs == 0) {
                        model.addObject("msg", StringTable.getValue("UploadSuccessAndWait"));
                    } else if (rs == -1) {
                        model.addObject("error", StringTable.getValue("RepeatedVideoTitle"));
                        model.addObject("username", loginUser.getUsername());
//                        model.addObject("title", title);
//                        model.addObject("description", description);
                    } else {
                        model.addObject("error", StringTable.getValue("UnknownError"));
                        model.addObject("username", loginUser.getUsername());
                    }
                } else {
                    model.addObject("error", StringTable.getValue("InvalidFileFormat"));
                    model.addObject("username", loginUser.getUsername());
                }
            } else {
                // Add new part
                int oid = Integer.parseInt(partVideo.substring(0, partVideo.indexOf(" - ")));
                if (!hasVideo) {
                    model.addObject("error", StringTable.getValue("InvalidFileFormat"));
                    model.addObject("username", loginUser.getUsername());
                } else if (partVideo.equals("未选择")) {
                    model.addObject("error", StringTable.getValue("SelectVideoNotice"));
                    model.addObject("username", loginUser.getUsername());
                } else {
                    if (videoServ.insertVPage(oid, ptitle2, videoPath, videoName) > 0) {
                        model.addObject("msg", StringTable.getValue("UploadSuccessAndWait"));
                    } else {
                        model.addObject("error", StringTable.getValue("UnknownError"));
                        model.addObject("username", loginUser.getUsername());
                    }
                }
            }

        }
        return model;
    }

    @RequestMapping(value = "/video", method = RequestMethod.GET)
    public void video(@RequestParam(value = "oid", required = false, defaultValue = "1") String oid,
                             @RequestParam(value = "pid", required = false, defaultValue = "1") String pid,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        if (! isNNInteger(oid) || ! isNNInteger(pid)) {
            // Video info is not found in database, return 404 code
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        User loginUser = (User) request.getSession().getAttribute("loginUser");
        int permission = loginUser == null ? 0 : loginUser.getPermission();

        Video videoObj = videoServ.selectVideoByOId(Integer.parseInt(oid));
        if (videoObj == null) {
            // Video info is not found in database, return 404 code
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String videoPermission = videoObj.getPermission();
        if (!permissionServ.checkPermission(videoPermission, permission)) {
            // Invalid permission, return 403 code
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        VideoPage videoPage = videoServ.selectVideoPageByOIdPId(Integer.parseInt(oid), Integer.parseInt(pid));
        System.out.println("VideoPage="+videoPage);
        if (videoPage == null ||
                (videoPage.getIspub() == 0 && !permissionServ.checkPermission("UnReviewedVideo", permission))) {
            // Part pid of video is not published, and user has not UnReviewedVideo permission
            // Give 404 page cause it is not seen by normal user
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            return;
        }

        File video = new File(Prop.getValue("VideoUploadPath") + "/otk" +
                oid + "-" + pid + ".mp4");

        if (video.exists()) {
            try {
                logger.info("Get video oid=" + oid + ", pid=" + pid);
                MultipartFileSender.fromPath(Paths.get(Prop.getValue("VideoUploadPath") + "/otk" +
                        oid + "-" + pid + ".mp4"))
                        .with(request)
                        .with(response)
                        .serveResource();
            } catch (java.io.IOException e) {
                ; // Ignore it
            }
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    //映射一个action
    @RequestMapping(value = "/vplay", method = RequestMethod.GET)
    public ModelAndView vplay(@RequestParam(value = "oid", required = false, defaultValue = "1") String oid,
                              @RequestParam(value = "pid", required = false, defaultValue = "1") String pid,
                              HttpServletRequest request, HttpServletResponse response){

        ModelAndView mad = new ModelAndView("vplay");
        if (! isNNInteger(oid))
            oid = "1";
        if (! isNNInteger(pid))
            pid = "1";
        logger.info("Get video oid=" + oid + ", pid=" + pid);

        User loginUser = (User) request.getSession().getAttribute("loginUser");
        int permission = loginUser == null ? 0 : loginUser.getPermission();

        Video videoObj = videoServ.selectVideoByOId(Integer.parseInt(oid));
        if (videoObj == null) {
            // Video info is not found in database, return 404 code
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return mad;
        }

        String videoPermission = videoObj.getPermission();
        if (!permissionServ.checkPermission(videoPermission, permission)) {
            // Invalid permission, return 403 code
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return mad;
        }

        VideoPage videoPage = videoServ.selectVideoPageByOIdPId(Integer.parseInt(oid), Integer.parseInt(pid));
        System.out.println("VideoPage="+videoPage);
        if (videoPage == null ||
                (videoPage.getIspub() == 0 && !permissionServ.checkPermission("UnReviewedVideo", permission))) {
            // Part pid of video is not published, and user has not UnReviewedVideo permission
            // Give 404 page cause it is not seen by normal user
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            return mad;
        }

        mad.addObject("vaddr", "/video?oid="+oid+"&pid="+pid);
        mad.addObject("title", videoObj.getTitle());
        mad.addObject("ptitle", videoPage.getPtitle());
        //返回一个index.jsp这个视图 and parameters that be replaced in jsp
        return mad;
    }

    private static boolean isNNInteger(String str) {
        Pattern pattern = Pattern.compile("^[\\d]*$");
        return pattern.matcher(str).matches();
    }

    @RequestMapping("/videolist")
    public void videolist(@RequestParam("page") int page,
                          @RequestParam("count") int count,
                          HttpServletResponse response, HttpServletRequest request) throws Exception {
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        int permission = loginUser == null ? 0 : loginUser.getPermission();
        response.getWriter().write(videoServ.selectVideoList(permission, page, count));
    }

    @RequestMapping("/anime")
    public ModelAndView anime(HttpServletRequest request) throws Exception {
        ModelAndView model = new ModelAndView("anime");
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        int permission = loginUser == null ? 0 : loginUser.getPermission();
        model.addObject("vlist", videoServ.selectVideoList(permission, 1, 10)
                .replace("\\", "\\\\").replace("\'", "\\'"));

        //返回一个index.jsp这个视图 and parameters that be replaced in jsp
        return model;
    }

}
