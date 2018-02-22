package com.threeotakus.utils;

import java.io.File;

public class FileOper {
    public static boolean rename(String path, String oldName, String newName) {
        // Old file
        File oldFile = new File(path, oldName);
        // new file
        File newFile = new File(path, newName);
        // renameTo() return boolean value
        //It return true if rename operation is successful
        boolean flag = oldFile.renameTo(newFile);
        return flag;
    }

}
