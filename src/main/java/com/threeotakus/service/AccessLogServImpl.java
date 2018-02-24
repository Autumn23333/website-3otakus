package com.threeotakus.service;

import com.threeotakus.dao.AccessLogDAO;
import com.threeotakus.model.AccessLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

@Service
public class AccessLogServImpl implements AccessLogServ{
    @Autowired
    private AccessLogDAO accessLogDAO;

    @Override
    public ArrayList<AccessLog> selectAccessInPeriod(String ip, int period) {
        Date now = new Date();
        return accessLogDAO.selectAccessInPeriod(ip, new Date(now.getTime()-period*1000));
    }

    @Override
    public int insertAccess(String ip, String session_id, String accessURL, String accessPara,
                            String accessMethod, boolean is_blocked) {
        Date now = new Date();
        AccessLog accessLog = new AccessLog(ip, session_id, now, now, accessURL, accessPara, accessMethod);
        if (!is_blocked)
            accessLog.setBlock_time(null);
        return accessLogDAO.insertUser(accessLog);
    }

    @Override
    public AccessLog selectLastBlock(String ip) {
        return accessLogDAO.selectLastBlock(ip);
    }
}
