package com.moob.panelstest;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.CheckBox;
import android.widget.TextView;




import com.google.android.material.tabs.TabLayout;

public class MainActivity extends AppCompatActivity {

    private TabLayout tabLayout;
    private ViewPager viewPager;
    TextView temperatureText;
    WebView camView;
    CheckBox lightBox;
    boolean lock = false;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tabLayout = findViewById(R.id.tabLayout);
        viewPager = findViewById(R.id.viewpager);

        tabLayout.setupWithViewPager(viewPager);

        VPAdapter vpAdapter = new VPAdapter(getSupportFragmentManager(), FragmentPagerAdapter.BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT);
        vpAdapter.addFragment(new CarController(), "Car Controller");
        vpAdapter.addFragment(new LaserController(), "Laser Controller");
        viewPager.setAdapter(vpAdapter);


        FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference myRef = database.getReference("messages");



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

    }
}