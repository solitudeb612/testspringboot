package com.yyh.springboot_test;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @RequestMapping("/hi")
    public String hello() {
        return "hello ,mamaomao";
    }
}
