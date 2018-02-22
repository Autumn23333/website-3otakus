package com.threeotakus.controller;

import com.threeotakus.utils.Prop;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

// 注解标注此类为springmvc的controller，url映射为""
@Controller
@RequestMapping("")
public class HatuyukiController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping("/hatuyuki")
    public ModelAndView hatuyuki(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("hatuyuki");
        model.addObject("frame", 0);
        model.addObject("section", "sec1_ch1_1205");
        return model;
    }

    @RequestMapping("/hatuyuki_data")
    public void hatuyuki_data(@RequestParam("section") String section,
                              HttpServletResponse response) throws IOException {
        String encoding = "UTF-8";
        File file = new File(Prop.getValue("HatuyukiDataPath")+ File.separator+section+".json");
        StringBuilder content = new StringBuilder();
        if (file.isFile() && file.exists()) { //判断文件是否存在
            InputStreamReader read = new InputStreamReader(
                    new FileInputStream(file), encoding);//考虑到编码格式
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;
            while ((lineTxt = bufferedReader.readLine()) != null) {
                content.append(lineTxt);
            }
            read.close();
        } else
            logger.warn("找不到指定的文件, "+file.getAbsolutePath());
        response.getWriter().write(content.toString().replaceAll("\n", ""));
    }
}
