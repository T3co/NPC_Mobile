package com.moob.app;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
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

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import io.github.controlwear.virtual.joystick.android.JoystickView;

public class MainActivity extends AppCompatActivity {

    CheckBox lightBox;
    TextView tempText;
    WebView camView;
    Slider servoSlider;
    Button shootButton;
    int packet,motors,servo,speed,laser;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        lightBox = findViewById(R.id.lightBox);
        tempText = findViewById(R.id.tempText);
        camView = findViewById(R.id.camView);
        servoSlider = findViewById(R.id.servoSlider);
        shootButton = findViewById(R.id.shootButton);


        FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference dbRef = database.getReference("kar98Info");

        JoystickView joystick = (JoystickView) findViewById(R.id.joystick);
        joystick.setOnMoveListener(new JoystickView.OnMoveListener() {
            @Override
            public void onMove(int angle, int strength) {
                CompilePacket(dbRef);
                if(strength < 30){ //stop car when no input
                    motors = 0;
                    speed = 0;
                    return;
                }

                if(strength > 35 && strength < 60){
                    speed = 0;
                }

                if(strength > 60){
                    speed = 1;
                }

                CompilePacket(dbRef);
                if(angle < 135 && angle > 45) //forward
                    motors =2;
                CompilePacket(dbRef);

                if(angle < 315 && angle > 225)//backward
                    motors =1;
                CompilePacket(dbRef);

                if(angle < 45 && angle > 0 || angle > 315 && angle < 360)
                {
                    //right
                    motors =4;
                }
                CompilePacket(dbRef);

                if(angle < 180 && angle > 135 || angle > 180 && angle < 225)
                {
                    //left
                    motors =3;
                }
                CompilePacket(dbRef);

            }
        });

        servoSlider.addOnChangeListener(new Slider.OnChangeListener() {
            @Override
            public void onValueChange(@NonNull Slider slider, float value, boolean fromUser) {
                switch((int)value) {
                    case 0:
                        servo=0;
                        CompilePacket(dbRef);
                        break;
                    case 10:
                        servo=1;
                        CompilePacket(dbRef);
                        break;
                    case 20:
                        servo=2;
                        CompilePacket(dbRef);
                        break;
                    case 30:
                        servo=3;
                        CompilePacket(dbRef);
                        break;
                    case 40:
                        servo=4;
                        CompilePacket(dbRef);
                        break;
                    case 50:
                        servo=5;
                        CompilePacket(dbRef);
                        break;
                    case 60:
                        servo=6;
                        CompilePacket(dbRef);
                        break;
                    case 70:
                        servo=7;
                        CompilePacket(dbRef);
                        break;
                    default:
                        servo=0;
                        CompilePacket(dbRef);
                        break;
                }
            }
        });

        lightBox.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(lightBox.isChecked()){
                    dbRef.child("led").setValue(1);
                }else {
                    dbRef.child("led").setValue(0);
                }
            }
        });

      shootButton.setOnTouchListener(new View.OnTouchListener() {
          @Override
          public boolean onTouch(View view, MotionEvent motionEvent) {

            if(motionEvent.getAction() == MotionEvent.ACTION_DOWN)
                laser =1;

            if(motionEvent.getAction() == MotionEvent.ACTION_UP)
                laser =0;

            CompilePacket(dbRef);
            return  false;
          }
      });

        dbRef.addValueEventListener(new ValueEventListener() {
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
    public void  CompilePacket(DatabaseReference dbRef){
        packet = motors + speed * 4 + servo * 8 + laser * 64;
        dbRef.child("carControl").setValue(packet);
    }
}
