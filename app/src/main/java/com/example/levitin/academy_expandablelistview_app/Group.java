package com.example.levitin.academy_expandablelistview_app;

import java.util.ArrayList;

public class Group {
    private ArrayList<Student> students ;
    private String groupName;
    public Group(String groupName){
         this.groupName= groupName;
         setStudents(new ArrayList<Student>());
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }

    public void addStudent(Student student){

        if(student!=null)
            students.add(student);
        else
            throw new NullPointerException("Argument is null");

    }

    public void remStudent(String idStd){
      Student std = this.findStudent(idStd);
      if(std!=null)
           students.remove(std);
      else
          throw new IllegalArgumentException("Student not Found");
    }

    public Student findStudent(String idStd){
        for(Student std : students){
            if (std.getIdStudent().equals(idStd))
                    return std;
                break;
            }
        return null;
    }

    @Override
    public String toString(){
        String groupSting="";
        String separator = System.getProperty("line.separator");
        for(Student s : students)
            groupSting += s.toString()+separator;
        return groupSting;
    }

}
