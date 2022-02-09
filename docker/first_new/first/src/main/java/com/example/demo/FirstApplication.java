package com.example.demo;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@RestController
public class FirstApplication {

	@RequestMapping("/")
	public String home() {
		return "Hello Docker World";
	}

	@RequestMapping("/employees")
	public List<Object> getListOfObjects() {
		List<Object> arrayList = new ArrayList<Object>();
		// do some work
		arrayList.add(1);
		arrayList.add(2);
		arrayList.add(3);

		return arrayList;
	}

	public static void main(String[] args) {
		SpringApplication.run(FirstApplication.class, args);
	}

}
