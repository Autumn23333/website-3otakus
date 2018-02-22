package com.threeotakus.controller;

import com.threeotakus.utils.Prop;
import com.threeotakus.utils.StringTable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ErrorHandler {
    @RequestMapping("/error")
    public ModelAndView error(@RequestParam("errcode") String errcode,
                              HttpServletResponse response) {
        ModelAndView model = new ModelAndView("error");
        System.out.println(errcode);
        String error = StringTable.getValue("Error"+errcode);
        model.addObject("err", error.equals("")?"出现了一些错误":error);
        return model;
    }
}
