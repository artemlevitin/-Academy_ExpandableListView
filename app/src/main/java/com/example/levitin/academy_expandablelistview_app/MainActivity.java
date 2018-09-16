package com.example.levitin.academy_expandablelistview_app;

import android.app.Activity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ExpandableListView;

public class MainActivity extends AppCompatActivity {

    private Academy academy;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        createAcademy();
        Academy_BaseExpListAdapter academy_Adapter = new Academy_BaseExpListAdapter(this,this,academy);
        ExpandableListView expandableListView = findViewById(R.id.academy_expandableListView);
        expandableListView.setAdapter(academy_Adapter);

    }

    private void createAcademy(){
    academy =new Academy("II Academy");
    Group group;
    group = new Group("IOT-34");
    group.addStudent(new Student("Ivan","Ivanov", Student.Gender.MALE));
    group.addStudent(new Student("Oleg","Olegov", Student.Gender.MALE));
    group.addStudent(new Student("Anna","Annova", Student.Gender.FEMALE));
    academy.addGroup(group);

    group = new Group("RIT-41");
    group.addStudent(new Student("Jan","Janje", Student.Gender.MALE));
    group.addStudent(new Student("Loren","Loreny", Student.Gender.FEMALE));
    group.addStudent(new Student("Elen","Elenny", Student.Gender.FEMALE));
    academy.addGroup(group);

  String academyToString =  academy.toString();

    }
}
