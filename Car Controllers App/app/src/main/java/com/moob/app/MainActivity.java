package com.moob.app;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import io.github.controlwear.virtual.joystick.android.JoystickView;

public class MainActivity extends AppCompatActivity {

    Button switchView;
    CheckBox lightBox;
    TextView tempText;
    WebView camView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        switchView = findViewById(R.id.switchButton);
        lightBox = findViewById(R.id.lightBox);
        tempText = findViewById(R.id.tempText);
        camView = findViewById(R.id.camView);


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
                    myRef.child("motors").setValue(3);

                if(angle < 180 && angle > 135 || angle > 180 && angle < 225)//left
                    myRef.child("motors").setValue(4);
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

        switchView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intet = new Intent(MainActivity.this, ServoController.class);
                startActivity(intet);
                finish();
            }
        });
    }
    public String CalculateCel(int tempInC){
        tempInC -= 32;
        tempInC /= 1.8000;

        return String.valueOf(tempInC - 25);
    }
}
