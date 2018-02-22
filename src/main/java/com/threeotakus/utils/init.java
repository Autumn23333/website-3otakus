package com.threeotakus.utils;

import org.apache.log4j.BasicConfigurator;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

public class init {
    private String  message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @PostConstruct
    public void  init(){
        System.out.println("I'm  init  method  using  @PostConstrut...."+message);
        BasicConfigurator.configure();

    }

    @PreDestroy
    public void  dostory(){
        System.out.println("I'm  destory method  using  @PreDestroy....."+message);
    }
}
