package com.moob.app;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;

import com.google.android.material.slider.Slider;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import io.github.controlwear.virtual.joystick.android.JoystickView;

public class MainActivity extends AppCompatActivity {

    CheckBox lightBox;
    TextView tempText;
    WebView camView;
    Slider servoSlider;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        lightBox = findViewById(R.id.lightBox);
        tempText = findViewById(R.id.tempText);
        camView = findViewById(R.id.camView);
        servoSlider = findViewById(R.id.servoSlider);

        FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference myRef = database.getReference("messages");

        JoystickView joystick = (JoystickView) findViewById(R.id.joystick);
        joystick.setOnMoveListener(new JoystickView.OnMoveListener() {
            @Override
            public void onMove(int angle, int strength) {

                if(strength < 60){ //stop car when no input
                    myRef.child("motors").setValue(0);
                    return;
                }

                if(angle < 135 && angle > 45) //forward
                    myRef.child("motors").setValue(2);

                if(angle < 315 && angle > 225)//backward
                    myRef.child("motors").setValue(1);

                if(angle < 45 && angle > 0 || angle > 315 && angle < 360)//right
                    myRef.child("motors").setValue(4);

                if(angle < 180 && angle > 135 || angle > 180 && angle < 225)//left
                    myRef.child("motors").setValue(3);
            }
        });

        servoSlider.addOnSliderTouchListener(new Slider.OnSliderTouchListener() {
            @Override
            public void onStartTrackingTouch(@NonNull Slider slider) {
                switch((int) slider.getValue()) {
                    case 0:
                        myRef.child("ServoMotors").setValue(0);
                        break;
                    case 10:
                        myRef.child("ServoMotors").setValue(1);
                        break;
                    case 20:
                        myRef.child("ServoMotors").setValue(2);
                        break;
                    case 30:
                        myRef.child("ServoMotors").setValue(3);
                        break;
                    case 40:
                        myRef.child("ServoMotors").setValue(4);
                        break;
                    case 50:
                        myRef.child("ServoMotors").setValue(5);
                        break;
                    case 60:
                        myRef.child("ServoMotors").setValue(6);
                        break;
                    case 70:
                        myRef.child("ServoMotors").setValue(7);
                        break;
                    default:
                        myRef.child("ServoMotors").setValue(0);
                }


            }

            @Override
            public void onStopTrackingTouch(@NonNull Slider slider) {

            }
        });

        lightBox.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(lightBox.isChecked()){
                    myRef.child("leds").setValue(1);
                }else {
                    myRef.child("leds").setValue(0);
                }
            }
        });

        myRef.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                String temp = dataSnapshot.child("temperature").getValue().toString();
                tempText.setText(CalculateCel(Integer.parseInt(temp)));

                String ip = dataSnapshot.child("ip").getValue().toString();
                if (ip != "")
                {
                    camView.loadUrl(ip);
                }
            }
            @Override
            public void onCancelled(DatabaseError error) {
                // Failed to read value
                Log.w("Firebase", "Failed to read value.", error.toException());
            }
        });
    }
    public String CalculateCel(int tempInC){
        tempInC -= 32;
        tempInC /= 1.8000;

        return String.valueOf(tempInC - 25);
    }
}
