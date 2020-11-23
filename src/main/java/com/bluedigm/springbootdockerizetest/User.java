package com.bluedigm.springbootdockerizetest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class User {
    @Value("${custom.myname}")
    private String name;

    @Value("${custom.myage}")
    private int age;

    @Value("${custom.mytel}")
    private String tel;

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", tel='" + tel + '\'' +
                '}';
    }
}
