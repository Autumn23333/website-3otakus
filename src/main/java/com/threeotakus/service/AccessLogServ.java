package com.threeotakus.service;

import com.threeotakus.model.AccessLog;

import java.util.ArrayList;

public interface AccessLogServ {
    ArrayList<AccessLog> selectAccessInPeriod(String ip, int period);

    int insertAccess(String ip, String session_id, boolean is_blocked);

    AccessLog selectLastBlock(String ip);
}
