package com.threeotakus.utils;

import org.json.JSONArray;
import org.json.JSONObject;

public class LoginTool {
    public static String cookiep2pwd(String cookiep) {
        return "$2a$10$"+cookiep;
    }

    public static String pwd2cookiep(String pwd) {
        return pwd.substring(7);
    }

    public static JSONObject getAPITemplate() {
        JSONObject obj = new JSONObject();
        obj.put("code", 0);
        obj.put("state", "");
        obj.put("data", new JSONArray());
        return obj;
    }
}
