package com.threeotakus.interceptor;

import com.threeotakus.model.AccessLog;
import com.threeotakus.service.AccessLogServ;
import com.threeotakus.utils.Prop;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

public class FreqInterceptor implements HandlerInterceptor {
    @Resource
    private AccessLogServ accessLogServ;

    private static final Logger logger = LoggerFactory.getLogger(FreqInterceptor.class);
    private static final int CHECK_PERIOD = Integer.parseInt(Prop.getValue("CheckPeriod"));
    private static final int MAX_REQUESTS_COUNT = Integer.parseInt(Prop.getValue("MaxRequestsCount"));
    private static final int BLOCK_TIME = Integer.parseInt(Prop.getValue("BlockTime"));

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String userIP = request.getRemoteAddr();
        String accessURL = request.getRequestURI().substring(0, Math.min(2083, request.getRequestURI().length()));
        String method = request.getMethod();
        String para = request.getQueryString()!=null?request.getQueryString():"";

        logger.info("ip => " + request.getRemoteAddr());

//        Enumeration headerNames = request.getHeaderNames();
//        while (headerNames.hasMoreElements()) {
//            String key = (String) headerNames.nextElement();
//            String value = request.getHeader(key);
//            logger.info(key + " -> " + value);
//        }
        ArrayList<AccessLog> accessLogs = accessLogServ.selectAccessInPeriod(userIP, CHECK_PERIOD);
        AccessLog accessLog = accessLogServ.selectLastBlock(userIP);

        if (accessLogs.size() > MAX_REQUESTS_COUNT) {

            // One IP exceeds max request limit, all requests should be refused
            // response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.sendRedirect("/error/403");
            accessLogServ.insertAccess(userIP, request.getSession().getId(), accessURL,para, method, true);
            return false;
        } else {
            if (accessLog != null && accessLog.getBlock_time() != null &&
                    accessLog.getBlock_time().getTime() >= (new Date()).getTime() - BLOCK_TIME * 1000) {

                // The latest access of one ip is blocked and it is still in blocking time
                response.sendRedirect("/error/403");
                accessLogServ.insertAccess(userIP, request.getSession().getId(), accessURL, para, method, false);
                return false;
            } else {

                // Valid access
                accessLogServ.insertAccess(userIP, request.getSession().getId(), accessURL, para, method, false);
                return true;
            }
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
