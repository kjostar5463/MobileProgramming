package com.cookandroid.baseapp;

import android.graphics.Color;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText edit1, edit2;
    Button BtnAdd, BtnSub, BtnMul, BtnDiv, BtnMod;
    TextView textResult;
    String num1, num2;
    Double result;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("초간단 계산기");

        BtnAdd = (Button) findViewById(R.id.BtnAdd);
        BtnSub = (Button) findViewById(R.id.BtnSub);
        BtnMul = (Button) findViewById(R.id.BtnMul);
        BtnDiv = (Button) findViewById(R.id.BtnDiv);
        BtnMod = (Button) findViewById(R.id.BtnMod);

        edit1 = (EditText) findViewById(R.id.Edit1);
        edit2 = (EditText) findViewById(R.id.Edit2);

        textResult = (TextView) findViewById(R.id.TextResult);

        BtnAdd.setBackgroundColor(Color.GRAY);
        BtnSub.setBackgroundColor(Color.GRAY);
        BtnMul.setBackgroundColor(Color.GRAY);
        BtnDiv.setBackgroundColor(Color.GRAY);
        BtnMod.setBackgroundColor(Color.GRAY);

        BtnAdd.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view){
                num1 = edit1.getText().toString();
                num2 = edit2.getText().toString();
                if(num1.isEmpty()||num2.isEmpty()){
                    Toast.makeText(getApplicationContext(), "값을 입력해주세요.", Toast.LENGTH_SHORT).show();
                    return;
                }
                result = Double.parseDouble(num1) + Double.parseDouble(num2);
                textResult.setText("계산 결과 : " + result.toString());
            }
        });

        BtnSub.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view){
                num1 = edit1.getText().toString();
                num2 = edit2.getText().toString();
                if(num1.isEmpty()||num2.isEmpty()){
                    Toast.makeText(getApplicationContext(), "값을 입력해주세요.", Toast.LENGTH_SHORT).show();
                    return;
                }
                result = Double.parseDouble(num1) - Double.parseDouble(num2);
                textResult.setText("계산 결과 : " + result.toString());
            }
        });

        BtnMul.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view){
                num1 = edit1.getText().toString();
                num2 = edit2.getText().toString();
                if(num1.isEmpty()||num2.isEmpty()){
                    Toast.makeText(getApplicationContext(), "값을 입력해주세요.", Toast.LENGTH_SHORT).show();
                    return;
                }
                result = Double.parseDouble(num1) * Double.parseDouble(num2);
                textResult.setText("계산 결과 : " + result.toString());
            }
        });

        BtnDiv.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view){
                num1 = edit1.getText().toString();
                num2 = edit2.getText().toString();
                if(num1.isEmpty()||num2.isEmpty()){
                    Toast.makeText(getApplicationContext(), "값을 입력해주세요.", Toast.LENGTH_SHORT).show();
                    return;
                }
                if(Double.parseDouble(num2)==0){
                    Toast.makeText(getApplicationContext(), "0이 아닌 다른 값을 입력하시오.", Toast.LENGTH_SHORT).show();
                    return;
                }
                result = Double.parseDouble(num1) / Double.parseDouble(num2);
                textResult.setText("계산 결과 : " + result.toString());
            }
        });

        BtnMod.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view){
                num1 = edit1.getText().toString();
                num2 = edit2.getText().toString();
                if(num1.isEmpty()||num2.isEmpty()) {
                    Toast.makeText(getApplicationContext(), "값을 입력해주세요.", Toast.LENGTH_SHORT).show();
                    return;
                }
                if(Double.parseDouble(num2)==0){
                    Toast.makeText(getApplicationContext(), "0이 아닌 다른 값을 입력하시오.", Toast.LENGTH_SHORT).show();
                    return;
                }
                result = Double.parseDouble(num1) % Double.parseDouble(num2);
                textResult.setText("계산 결과 : " + result.toString());
            }
        });
    }
}