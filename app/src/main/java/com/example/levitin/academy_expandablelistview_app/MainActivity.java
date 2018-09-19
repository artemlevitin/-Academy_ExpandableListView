package com.example.levitin.academy_expandablelistview_app;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ExpandableListView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    private Academy academy;
    ExpandableListView expandableListView;
    Academy_BaseExpListAdapter academy_Adapter;
    final int addStudent_reqCode =1;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        createAcademy();
         academy_Adapter = new Academy_BaseExpListAdapter(this,this,academy);
         expandableListView = findViewById(R.id.academy_expandableListView);
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

    public void onRemoveStudentClick(View view){
        for( int i =0; i<expandableListView.getCount();++i){
            LinearLayout line= (LinearLayout)expandableListView.getChildAt(i);
            CheckBox chBox = line.findViewById(R.id.student_checkBox);
            if (chBox.isChecked()) {
                TextView lNameView =(TextView) line.findViewById(R.id.lastName);
              //  studentDataList.remove( findStudent(lNameView.getText().toString()) );
                academy_Adapter.notifyDataSetChanged();
            }
        }

    }


    public  void addStudentClick(View view){
        Intent intent = new Intent(this,AddNewStudentActivity.class);
        startActivityForResult(intent, addStudent_reqCode);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent intent){
        if(requestCode== addStudent_reqCode){
            if(resultCode==RESULT_OK){
                addStudent(intent);
                }
        }
        else{
            super.onActivityResult(requestCode, resultCode, intent);
        }
    }

    private void addStudent(Intent intent) {
        Student st = (Student) intent.getSerializableExtra("student");
        String groupName = "IOT-21";
        ArrayList<Group> grList = academy.getGroups();
        for( int position =0; position < grList.size(); ++position){
            Group group = grList.get(position);
            if(group.getGroupName().equals(groupName))
                group.addStudent(st);
            academy_Adapter.addStudent(st,position);
        }
        academy.getGroups().get(0).addStudent(st);
    }
}
