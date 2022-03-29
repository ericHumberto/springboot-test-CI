package com.example.springboottestCI.controller;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class DemoControllerTest {

    @Autowired
    private DemoController demoController;

    @Test
    public void contextLoads() throws Exception {
        assertThat(demoController).isNotNull();
    }
}