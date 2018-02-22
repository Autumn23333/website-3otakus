package com.threeotakus.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class StringTable {
    private static Properties prop = new Properties();
    private static StringTable ourInstance = new StringTable();

    public static StringTable getInstance() {
        return ourInstance;
    }

    private StringTable() {
        try {
            prop.load(StringTable.class.getResourceAsStream("/spring/string-table.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getValue(String key) {
        try {
            return new String(prop.getProperty(key).getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return "";
        }
    }
}
