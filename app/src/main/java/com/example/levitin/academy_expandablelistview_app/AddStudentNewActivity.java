package com.example.levitin.academy_expandablelistview_app;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioButton;

public class AddStudentNewActivity extends AppCompatActivity {
    private EditText fname;
    private EditText lname;
    private EditText grname;
    private RadioButton femaleGender;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_student_new);
        fname = (EditText)findViewById(R.id.fNameNewSt);
        lname = (EditText)findViewById(R.id.lNameNewSt);
        grname = (EditText)findViewById(R.id.grNameNewSt);
        femaleGender =(RadioButton)findViewById(R.id.female_radioButton);
    }

    public void onCanselAddStudentClick(View view){
        finish();
    }

    public void onConfirmAddStudentClick(View view){
        Intent intent = new Intent();
        boolean isGenderFemale=femaleGender.isChecked()? true:false;
        intent.putExtra("isGenderFemale",isGenderFemale);
        intent.putExtra("fName",fname.getText().toString());
        intent.putExtra("lName",lname.getText().toString());
        intent.putExtra("grName",grname.getText().toString());

        setResult(RESULT_OK, intent);
        finish();
    }
}

