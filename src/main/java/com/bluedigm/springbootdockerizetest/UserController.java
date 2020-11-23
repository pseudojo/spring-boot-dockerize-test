package com.bluedigm.springbootdockerizetest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
public class UserController {
    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    User user;

    @GetMapping("/user")
    public String userString() {
        String userStr = user.toString();
        logger.info("Return for calling GET /user : [ {} ]", userStr);
        return user.toString();
    }
}
