package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Main entry point for the Spring Boot application.
 */
@SpringBootApplication
@RestController
public class DemoApplication {

    /**
     * Launches the application.
     *
     * @param args command line arguments
     */
    public static void main(final String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    /**
     * Handles requests to the root path.
     *
     * @return a simple greeting message
     */
    @GetMapping("/")
    public String home() {
        return "Hello, DevOps!";
    }
}
