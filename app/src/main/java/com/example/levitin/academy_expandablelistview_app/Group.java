package com.example.levitin.academy_expandablelistview_app;

import java.util.ArrayList;

public class Group {
    private ArrayList<Student> students ;
    public Group(){
         setStudents(new ArrayList<Student>());
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }
}
