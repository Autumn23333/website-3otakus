package com.threeotakus.utils;

import java.io.IOException;
import java.util.Properties;

public class Permission {
    private static Properties prop = new Properties();
    private static Permission ourInstance = new Permission();

    public static Permission getInstance() {
        return ourInstance;
    }

    private Permission() {
        try {
            prop.load(StringTable.class.getResourceAsStream("/spring/permission.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static int getPermission(String name) {
        try {
            return Integer.parseInt(prop.getProperty(name));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
