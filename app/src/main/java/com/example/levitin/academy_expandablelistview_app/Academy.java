package com.example.levitin.academy_expandablelistview_app;

import java.util.ArrayList;

public class Academy {
    private ArrayList<Group> groups;
    private String name;

    public Academy(String name){
        this.name=name;
        groups = new ArrayList<>();
    }

    public ArrayList<Group> getGroups() {
        return groups;
    }

    public void setGroups(ArrayList<Group> groups) {
        this.groups = groups;
    }

    public  void addGroup(Group group){
        groups.add(group);
    }

    @Override
    public String toString(){
        String academySting=name;
       String sep =  System.getProperty("line.separator");
        for(Group gr : groups)
            academySting += gr.toString()+sep;
        return academySting;
    }
}
