package com.carcontroller;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
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
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends AppCompatActivity {

    Button forward;
    Button backward;
    Button right;
    Button left;
    TextView temperatureText;
    WebView camView;
    CheckBox lightBox;
    boolean lock = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference myRef = database.getReference("messages");


        forward = findViewById(R.id.forward);
        backward = findViewById(R.id.backwards);
        right = findViewById(R.id.right);
        left = findViewById(R.id.left);
        temperatureText = findViewById(R.id.tempView);
        camView = findViewById(R.id.camView);
        lightBox = findViewById(R.id.lightsBox);

        lightBox.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (lightBox.isChecked()){
                    myRef.child("leds").setValue(1);
                }else {
                    myRef.child("leds").setValue(0);
                }
            }
        });
        forward.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if(motionEvent.getAction() == MotionEvent.ACTION_DOWN){
                    myRef.child("motors").setValue(1);
                }
                else  if(motionEvent.getAction() == MotionEvent.ACTION_UP){
                    myRef.child("motors").setValue(0);
                }
                return  false;
            }
        });
        backward.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if(motionEvent.getAction() == MotionEvent.ACTION_DOWN){
                    myRef.child("motors").setValue(2);
                }
                else  if(motionEvent.getAction() == MotionEvent.ACTION_UP){
                    myRef.child("motors").setValue(0);
                }
                return  false;
            }
        });
        right.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if(motionEvent.getAction() == MotionEvent.ACTION_DOWN){
                    myRef.child("motors").setValue(3);
                }
                else  if(motionEvent.getAction() == MotionEvent.ACTION_UP){
                    myRef.child("motors").setValue(0);
                }
                return  false;
            }
        });
        left.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if(motionEvent.getAction() == MotionEvent.ACTION_DOWN){
                    myRef.child("motors").setValue(4);
                }
                else  if(motionEvent.getAction() == MotionEvent.ACTION_UP){
                    myRef.child("motors").setValue(0);
                }
                return  false;
            }
        });

        myRef.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                String temp = dataSnapshot.child("temperature").getValue().toString();
                temperatureText.setText(CalculateCel(Integer.parseInt(temp)));

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

    public class mywebClient extends WebViewClient{
        @Override
        public void onPageStarted(WebView view, String url, Bitmap favicon){
            super.onPageStarted(view,url,favicon);
        }
        @Override
        public boolean shouldOverrideUrlLoading(WebView view,String url){
            view.loadUrl(url);
            return true;
        }
    }
    @Override
    public void onBackPressed(){
        if(camView.canGoBack()) {
            camView.goBack();
        }
        else{
            super.onBackPressed();
        }
    }
}
