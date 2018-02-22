package com.threeotakus.controller;

import com.github.mertakdut.BookSection;
import com.github.mertakdut.Reader;
import com.github.mertakdut.exception.OutOfPagesException;
import com.github.mertakdut.exception.ReadingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 注解标注此类为springmvc的controller，url映射为"/"
@Controller
@RequestMapping("")
public class HomeController {


    //添加一个日志器
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    //映射一个action
    @RequestMapping({"/index", "", "/"})
    public  String index(){
        //输出日志文件
        logger.info("the first jsp pages");
        //返回一个index.jsp这个视图
        return "index";
    }

    @RequestMapping(value = "/epub", method = RequestMethod.GET)
    public void epub(@RequestParam("page") int page,
                     HttpServletResponse response) throws ReadingException, IOException {
        Reader reader = new Reader();
        String epubFilePath = "/Users/lichenghong/Downloads/[上栖缀人]新妹魔王的契约者 Ⅲ.epub";
        int pageIndex = page;
        reader.setMaxContentPerSection(500); // Max string length for the current page.
        reader.setIsIncludingTextContent(true); // Optional, to return the tags-excluded version.
        reader.setFullContent(epubFilePath); // Must call before readSection.


        BookSection bookSection = null;
        try {
            bookSection = reader.readSection(pageIndex);
        } catch (OutOfPagesException e) {
            response.getWriter().write("请求的页数超出了书的页数.");
            return;
        }
        String sectionContent = bookSection.getSectionContent(); // Returns content as html.
        String sectionTextContent = bookSection.getSectionTextContent(); // Excludes html tags.
        System.out.println(sectionTextContent);
        response.getWriter().write(sectionContent.replaceAll("../Images/", ""));
    }


}
