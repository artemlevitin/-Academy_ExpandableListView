package com.example.levitin.academy_expandablelistview_app;

import java.io.Serializable;
import java.util.UUID;


public class Student implements Serializable {
    enum Gender {MALE,FEMALE};
    private String firstName;
    private String lastName;
    private  String idStudent;
    private Gender gender;

    public Student(String fName, String lName, Gender gnd){
        setFirstName(fName);
        setLastName(lName);
        setIdStudent();
        setGender(gnd);
    }

    public String getIdStudent() {
        return idStudent;
    }

    private void setIdStudent() {
        this.idStudent = UUID.randomUUID().toString();
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
   public String toString(){
        String gend = gender==Gender.FEMALE?"female":"male";
        return firstName + " " + lastName + " " + gend;
    }
}
