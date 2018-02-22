package com.threeotakus.service;

import com.threeotakus.dao.PermissionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PermissionServImpl implements PermissionServ {
    @Autowired
    private PermissionDAO permissionDAO;

    @Override
    public boolean checkPermission(String action, int permission) {
        int rs = permissionDAO.checkPermission(action, permission);
        return rs >= 1;
    }
}
