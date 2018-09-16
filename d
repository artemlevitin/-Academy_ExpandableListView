[1mdiff --git a/app/src/main/java/com/example/levitin/academy_expandablelistview_app/Academy_BaseExpListAdapter.java b/app/src/main/java/com/example/levitin/academy_expandablelistview_app/Academy_BaseExpListAdapter.java[m
[1mnew file mode 100644[m
[1mindex 0000000..ce5a333[m
[1m--- /dev/null[m
[1m+++ b/app/src/main/java/com/example/levitin/academy_expandablelistview_app/Academy_BaseExpListAdapter.java[m
[36m@@ -0,0 +1,98 @@[m
[32m+[m[32mpackage com.example.levitin.academy_expandablelistview_app;[m
[32m+[m
[32m+[m[32mimport android.app.Activity;[m
[32m+[m[32mimport android.content.Context;[m
[32m+[m[32mimport android.view.ContextMenu;[m
[32m+[m[32mimport android.view.LayoutInflater;[m
[32m+[m[32mimport android.view.View;[m
[32m+[m[32mimport android.view.ViewGroup;[m
[32m+[m[32mimport android.widget.BaseExpandableListAdapter;[m
[32m+[m[32mimport android.widget.ExpandableListView;[m
[32m+[m[32mimport android.widget.ImageView;[m
[32m+[m[32mimport android.widget.TextView;[m
[32m+[m
[32m+[m[32mimport java.util.ArrayList;[m
[32m+[m[32mimport java.util.zip.Inflater;[m
[32m+[m
[32m+[m[32mpublic class Academy_BaseExpListAdapter extends BaseExpandableListAdapter {[m
[32m+[m
[32m+[m[32m    LayoutInflater inflater;[m
[32m+[m[32m    Context context;[m
[32m+[m[32m    Academy academy;[m
[32m+[m
[32m+[m[32m    public Academy_BaseExpListAdapter(Context context, Activity activity, Academy academy){[m
[32m+[m
[32m+[m[32m   // inflater=activity.getLayoutInflater();[m
[32m+[m[32m    inflater = (LayoutInflater) activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);[m
[32m+[m[32m    this.context =context;[m
[32m+[m[32m    this.academy =academy;[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public int getGroupCount() {[m
[32m+[m[32m        return academy.getGroups().size();[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public int getChildrenCount(int groupPosition) {[m
[32m+[m[32m        // ArrayList<Group> groupList= academy.getGroups();[m
[32m+[m[32m        // Group gr= groupList.get(groupPosition);[m
[32m+[m[32m        //  academy.getGroups().get(groupPosition).getStudents().size();[m
[32m+[m[32m        return academy.getGroups().get(groupPosition).getStudents().size();[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public Object getGroup(int groupPosition) {[m
[32m+[m[32m        return academy.getGroups().get(groupPosition);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public Object getChild(int groupPosition, int childPosition) {[m
[32m+[m[32m        return academy.getGroups().get(groupPosition).getStudents().get(childPosition);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public long getGroupId(int groupPosition) {[m
[32m+[m[32m        return  groupPosition;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public long getChildId(int groupPosition, int childPosition) {[m
[32m+[m[32m        return childPosition;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public boolean hasStableIds() {[m
[32m+[m[32m        return true;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public View getGroupView(int groupPosition, boolean isExpanded, View convertView, ViewGroup parent) {[m
[32m+[m[32m       View resView = inflater.inflate(R.layout.group_item,null);[m
[32m+[m[32m       TextView text= resView.findViewById(R.id.groupName_Text);[m
[32m+[m[32m       text.setText(academy.getGroups().get(groupPosition).getGroupName());[m
[32m+[m
[32m+[m[32m        return resView;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public View getChildView(int groupPosition, int childPosition, boolean isLastChild, View convertView, ViewGroup parent) {[m
[32m+[m[32m        View resView = inflater.inflate(R.layout.student_item,null);[m
[32m+[m[32m        TextView fName = resView.findViewById(R.id.firstName);[m
[32m+[m[32m        TextView lName = resView.findViewById(R.id.lastName);[m
[32m+[m[32m        ImageView imgGender = resView.findViewById(R.id.gender_Image);[m
[32m+[m
[32m+[m[32m        Student student = academy.getGroups().get(groupPosition).getStudents().get(childPosition);[m
[32m+[m[32m        fName.setText(student.getFirstName());[m
[32m+[m[32m        lName.setText(student.getLastName());[m
[32m+[m[32m        int gender = student.getGender()== Student.Gender.MALE? R.drawable.boy:R.drawable.girl;[m
[32m+[m[32m        imgGender.setImageResource(gender);[m
[32m+[m[32m        return resView;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public boolean isChildSelectable(int groupPosition, int childPosition) {[m
[32m+[m[32m        return true;[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/src/main/java/com/example/levitin/academy_expandablelistview_app/Group.java b/app/src/main/java/com/example/levitin/academy_expandablelistview_app/Group.java[m
[1mindex b304a0a..270f696 100644[m
[1m--- a/app/src/main/java/com/example/levitin/academy_expandablelistview_app/Group.java[m
[1m+++ b/app/src/main/java/com/example/levitin/academy_expandablelistview_app/Group.java[m
[36m@@ -6,7 +6,7 @@[m [mpublic class Group {[m
     private ArrayList<Student> students ;[m
     private String groupName;[m
     public Group(String groupName){[m
[31m-         this.groupName= groupName;[m
[32m+[m[32m         this.setGroupName(groupName);[m
          setStudents(new ArrayList<Student>());[m
     }[m
 [m
[36m@@ -53,4 +53,11 @@[m [mpublic class Group {[m
         return groupSting;[m
     }[m
 [m
[32m+[m[32m    public String getGroupName() {[m
[32m+[m[32m        return groupName;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setGroupName(String groupName) {[m
[32m+[m[32m        this.groupName = groupName;[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/app/src/main/java/com/example/levitin/academy_expandablelistview_app/MainActivity.java b/app/src/main/java/com/example/levitin/academy_expandablelistview_app/MainActivity.java[m
[1mindex 556239d..c0049e2 100644[m
[1m--- a/app/src/main/java/com/example/levitin/academy_expandablelistview_app/MainActivity.java[m
[1m+++ b/app/src/main/java/com/example/levitin/academy_expandablelistview_app/MainActivity.java[m
[36m@@ -1,7 +1,9 @@[m
 package com.example.levitin.academy_expandablelistview_app;[m
 [m
[32m+[m[32mimport android.app.Activity;[m
 import android.support.v7.app.AppCompatActivity;[m
 import android.os.Bundle;[m
[32m+[m[32mimport android.widget.ExpandableListView;[m
 [m
 public class MainActivity extends AppCompatActivity {[m
 [m
[36m@@ -12,6 +14,9 @@[m [mpublic class MainActivity extends AppCompatActivity {[m
         super.onCreate(savedInstanceState);[m
         setContentView(R.layout.activity_main);[m
         createAcademy();[m
[32m+[m[32m        Academy_BaseExpListAdapter academy_Adapter = new Academy_BaseExpListAdapter(this,this,academy);[m
[32m+[m[32m        ExpandableListView expandableListView = findViewById(R.id.academy_expandableListView);[m
[32m+[m[32m        expandableListView.setAdapter(academy_Adapter);[m
 [m
     }[m
 [m
[1mdiff --git a/app/src/main/res/drawable/boy.gif b/app/src/main/res/drawable/boy.gif[m
[1mnew file mode 100644[m
[1mindex 0000000..4b74e5d[m
Binary files /dev/null and b/app/src/main/res/drawable/boy.gif differ
[1mdiff --git a/app/src/main/res/drawable/girl.gif b/app/src/main/res/drawable/girl.gif[m
[1mnew file mode 100644[m
[1mindex 0000000..52e599b[m
Binary files /dev/null and b/app/src/main/res/drawable/girl.gif differ
[1mdiff --git a/app/src/main/res/layout/activity_main.xml b/app/src/main/res/layout/activity_main.xml[m
[1mindex 84f1951..cd02ccf 100644[m
[1m--- a/app/src/main/res/layout/activity_main.xml[m
[1m+++ b/app/src/main/res/layout/activity_main.xml[m
[36m@@ -6,13 +6,40 @@[m
     android:layout_height="match_parent"[m
     tools:context=".MainActivity">[m
 [m
[31m-    <TextView[m
[31m-        android:layout_width="wrap_content"[m
[31m-        android:layout_height="wrap_content"[m
[31m-        android:text="Hello World!"[m
[31m-        app:layout_constraintBottom_toBottomOf="parent"[m
[31m-        app:layout_constraintLeft_toLeftOf="parent"[m
[31m-        app:layout_constraintRight_toRightOf="parent"[m
[31m-        app:layout_constraintTop_toTopOf="parent" />[m
[32m+[m[32m    <LinearLayout[m
[32m+[m[32m        android:layout_width="match_parent"[m
[32m+[m[32m        android:layout_height="match_parent"[m
[32m+[m[32m        android:orientation="vertical">[m
[32m+[m
[32m+[m[32m        <LinearLayout[m
[32m+[m[32m            android:layout_width="match_parent"[m
[32m+[m[32m            android:layout_height="wrap_content"[m
[32m+[m[32m            android:orientation="horizontal">[m
[32m+[m
[32m+[m[32m            <Button[m
[32m+[m[32m                android:id="@+id/addStd_button"[m
[32m+[m[32m                android:layout_width="wrap_content"[m
[32m+[m[32m                android:layout_height="wrap_content"[m
[32m+[m[32m                android:layout_weight="1"[m
[32m+[m[32m                android:onClick="addStudentClick"[m
[32m+[m[32m                android:text="Add Student" />[m
[32m+[m
[32m+[m[32m            <Button[m
[32m+[m[32m                android:id="@+id/remStd_button"[m
[32m+[m[32m                android:layout_width="wrap_content"[m
[32m+[m[32m                android:layout_height="wrap_content"[m
[32m+[m[32m                android:layout_weight="1"[m
[32m+[m[32m                android:onClick="onRemoveStudentClick"[m
[32m+[m[32m                android:text="Remove Student" />[m
[32m+[m
[32m+[m[32m        </LinearLayout>[m
[32m+[m
[32m+[m[32m        <ExpandableListView[m
[32m+[m[32m            android:id="@+id/academy_expandableListView"[m
[32m+[m[32m            android:layout_width="match_parent"[m
[32m+[m[32m            android:layout_height="0dp"[m
[32m+[m[32m            android:layout_weight="1" />[m
[32m+[m
[32m+[m[32m    </LinearLayout>[m
 [m
 </android.support.constraint.ConstraintLayout>[m
\ No newline at end of file[m
[1mdiff --git a/app/src/main/res/layout/group_item.xml b/app/src/main/res/layout/group_item.xml[m
[1mnew file mode 100644[m
[1mindex 0000000..7967b5c[m
[1m--- /dev/null[m
[1m+++ b/app/src/main/res/layout/group_item.xml[m
[36m@@ -0,0 +1,22 @@[m
[32m+[m[32m<?xml version="1.0" encoding="utf-8"?>[m
[32m+[m[32m<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"[m
[32m+[m[32m    android:layout_width="match_parent"[m
[32m+[m[32m    android:layout_height="match_parent"[m
[32m+[m[32m    android:orientation="horizontal"[m
[32m+[m[32m    android:gravity="center_vertical">[m
[32m+[m[32m    <ImageView android:id="@+id/image1"[m
[32m+[m[32m        android:src="@drawable/ic_launcher_foreground"[m
[32m+[m[32m        android:layout_width="50dp"[m
[32m+[m[32m        android:layout_height="50dp"[m
[32m+[m[32m        android:layout_marginLeft="25dp" />[m
[32m+[m
[32m+[m[32m    <TextView[m
[32m+[m[32m        android:id="@+id/groupName_Text"[m
[32m+[m[32m        android:layout_width="wrap_content"[m
[32m+[m[32m        android:layout_height="50dp"[m
[32m+[m[32m        android:layout_marginLeft="95dp"[m
[32m+[m[32m        android:gravity="center_vertical"[m
[32m+[m[32m        android:text="TextView"[m
[32m+[m[32m        android:textColor="#000000"[m
[32m+[m[32m        android:textSize="20sp" />[m
[32m+[m[32m</RelativeLayout>[m
\ No newline at end of file[m
[1mdiff --git a/app/src/main/res/layout/student_item.xml b/app/src/main/res/layout/student_item.xml[m
[1mnew file mode 100644[m
[1mindex 0000000..6bfec7e[m
[1m--- /dev/null[m
[1m+++ b/app/src/main/res/layout/student_item.xml[m
[36m@@ -0,0 +1,36 @@[m
[32m+[m[32m<?xml version="1.0" encoding="utf-8"?>[m
[32m+[m[32m<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"[m
[32m+[m[32m    xmlns:app="http://schemas.android.com/apk/res-auto"[m
[32m+[m[32m    xmlns:tools="http://schemas.android.com/tools"[m
[32m+[m[32m    android:orientation="horizontal" android:layout_width="fill_parent"[m
[32m+[m[32m    android:layout_height="40dp">[m
[32m+[m
[32m+[m
[32m+[m[32m    <ImageView[m
[32m+[m[32m        android:id="@+id/gender_Image"[m
[32m+[m[32m        android:layout_width="wrap_content"[m
[32m+[m[32m        android:layout_height="wrap_content"[m
[32m+[m[32m        android:layout_weight="1"[m
[32m+[m[32m        app:srcCompat="@mipmap/ic_launcher" />[m
[32m+[m
[32m+[m[32m    <TextView[m
[32m+[m[32m        android:id="@+id/firstName"[m
[32m+[m[32m        android:layout_width="wrap_content"[m
[32m+[m[32m        android:layout_height="wrap_content"[m
[32m+[m[32m        android:layout_weight="1"[m
[32m+[m[32m        android:text="firstName" />[m
[32m+[m
[32m+[m[32m    <TextView[m
[32m+[m[32m        android:id="@+id/lastName"[m
[32m+[m[32m        android:layout_width="wrap_content"[m
[32m+[m[32m        android:layout_height="wrap_content"[m
[32m+[m[32m        android:layout_weight="1"[m
[32m+[m[32m        android:text="lastName" />[m
[32m+[m
[32m+[m[32m    <CheckBox[m
[32m+[m[32m        android:id="@+id/student_checkBox"[m
[32m+[m[32m        android:layout_width="wrap_content"[m
[32m+[m[32m        android:layout_height="wrap_content"[m
[32m+[m[32m        android:layout_weight="1"[m
[32m+[m[32m        android:checked="false"/>[m
[32m+[m[32m</LinearLayout>[m
\ No newline at end of file[m
[1mdiff --git a/app/src/main/res/values/styles.xml b/app/src/main/res/values/styles.xml[m
[1mindex 5885930..0d653f3 100644[m
[1m--- a/app/src/main/res/values/styles.xml[m
[1m+++ b/app/src/main/res/values/styles.xml[m
[36m@@ -1,7 +1,7 @@[m
 <resources>[m
 [m
     <!-- Base application theme. -->[m
[31m-    <style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">[m
[32m+[m[32m    <style name="AppTheme" parent="Base.Theme.AppCompat.Light.DarkActionBar">[m
         <!-- Customize your theme here. -->[m
         <item name="colorPrimary">@color/colorPrimary</item>[m
         <item name="colorPrimaryDark">@color/colorPrimaryDark</item>[m
