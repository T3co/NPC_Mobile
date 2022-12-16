package com.moob.app;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;


import com.google.android.material.slider.Slider;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import io.github.controlwear.virtual.joystick.android.JoystickView;

public class ServoController extends AppCompatActivity {

    Button switchButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_servo_controller);

        FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference myRef = database.getReference("messages");

        switchButton = findViewById(R.id.switchViewToMain);

        Slider servoSlider  = (Slider) findViewById(R.id.ServoSlider);
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


        switchButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intet = new Intent(ServoController.this, MainActivity.class);
                startActivity(intet);
                finish();
            }
        });
    }
}