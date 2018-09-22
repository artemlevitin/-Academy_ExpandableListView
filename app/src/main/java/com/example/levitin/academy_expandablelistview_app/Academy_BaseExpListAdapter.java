package com.example.levitin.academy_expandablelistview_app;

import android.app.Activity;
import android.content.Context;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.zip.Inflater;

public class Academy_BaseExpListAdapter extends BaseExpandableListAdapter {

    LayoutInflater inflater;
    Context context;
    Academy academy;

    public Academy_BaseExpListAdapter(Context context, Activity activity, Academy academy){

   // inflater=activity.getLayoutInflater();
    inflater = (LayoutInflater) activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    this.context =context;
    this.academy =academy;

    }

    @Override
    public int getGroupCount() {
        return academy.getGroups().size();
    }

    @Override
    public int getChildrenCount(int groupPosition) {
        // ArrayList<Group> groupList= academy.getGroups();
        // Group gr= groupList.get(groupPosition);
        //  academy.getGroups().get(groupPosition).getStudents().size();
        return academy.getGroups().get(groupPosition).getStudents().size();
    }


    @Override
    public Object getGroup(int groupPosition) {
        return academy.getGroups().get(groupPosition);
    }

    @Override
    public Object getChild(int groupPosition, int childPosition) {
        return academy.getGroups().get(groupPosition).getStudents().get(childPosition);
    }

    @Override
    public long getGroupId(int groupPosition) {
        return  groupPosition;
    }

    @Override
    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    @Override
    public boolean hasStableIds() {
        return true;
    }

    @Override
    public View getGroupView(int groupPosition, boolean isExpanded, View convertView, ViewGroup parent) {
       View resView = inflater.inflate(R.layout.group_item,null);
       TextView text= resView.findViewById(R.id.groupName_Text);
       text.setText(academy.getGroups().get(groupPosition).getGroupName());

        return resView;
    }

    @Override
    public View getChildView(int groupPosition, int childPosition, boolean isLastChild, View convertView, ViewGroup parent) {
        View resView = inflater.inflate(R.layout.student_item,null);
        TextView fName = resView.findViewById(R.id.firstName);
        TextView lName = resView.findViewById(R.id.lastName);
        TextView idStudent = resView.findViewById(R.id.idStudent);
        ImageView imgGender = resView.findViewById(R.id.gender_Image);


        Student student = academy.getGroups().get(groupPosition).getStudents().get(childPosition);
        fName.setText(student.getFirstName());
        lName.setText(student.getLastName());
        idStudent.setText(student.getIdStudent());

        int gender = student.getGender()== Student.Gender.MALE? R.drawable.boy:R.drawable.girl;
        imgGender.setImageResource(gender);
        return resView;
    }

    @Override
    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return true;
    }
}
