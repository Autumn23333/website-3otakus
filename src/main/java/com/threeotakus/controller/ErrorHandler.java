package com.threeotakus.controller;

import com.threeotakus.interceptor.FreqInterceptor;
import com.threeotakus.utils.Prop;
import com.threeotakus.utils.StringTable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ErrorHandler {
    private static final Logger logger = LoggerFactory.getLogger(FreqInterceptor.class);

    @RequestMapping("/error/{errcode}")
    public ModelAndView error(@PathVariable("errcode") String errcode,
                              HttpServletResponse response) {
        ModelAndView model = new ModelAndView("error");
        logger.warn(errcode);
        String error = StringTable.getValue("Error"+errcode);
        model.addObject("err", error.equals("")?"出现了一些错误":error);
        return model;
    }
}
