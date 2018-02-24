package com.threeotakus.controller;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class ToolController {
    @RequestMapping(value = "/upload_music", method = RequestMethod.POST)
    public void upload_music(@RequestParam("music") MultipartFile music,
                             HttpServletResponse response) throws IOException {
        JSONObject result = new JSONObject();
        result.put("status", "okay");
        result.put("path", "hahahahahahaha");
        response.getWriter().write(result.toString());
    }

}
