package com.yourproject.model;

public class Student {
    private String prn;
    private String name;

    public Student(String prn, String name) {
        this.prn = prn;
        this.name = name;
    }

    public String getPrn() {
        return prn;
    }

    public String getName() {
        return name;
    }
}
