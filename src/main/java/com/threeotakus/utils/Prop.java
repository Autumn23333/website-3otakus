package com.threeotakus.utils;

import java.io.IOException;
import java.util.Properties;

public class Prop {
    private static Properties prop = new Properties();

    private static Prop ourInstance = new Prop();

    public static Prop getInstance() {
        return ourInstance;
    }

    private Prop() {
        try {
            prop.load(StringTable.class.getResourceAsStream("/spring/application.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getValue(String key) {
        return prop.getProperty(key);
    }


}
