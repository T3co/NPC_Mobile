// Little project from wiwidnadw
// program use java language
//u can reach me on https://github.com/wiwidnadw
//https://www.youtube.com/channel/UClxwaaJ-or0SJtlWMi3pHpA
// line : wiwidnadw
//gmail : nurahmaddw@gmail.com

package com.p4f.esp32camai;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import com.p4f.esp32camai.Esp32CameraFragment;

public class activity_1 extends AppCompatActivity {
    private EditText ip;
    private Button enter_ip;
    public static String ip_address;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_1);

        ip=(EditText) findViewById(R.id.edit_ip_address);
        enter_ip=(Button) findViewById(R.id.button_ip);

        enter_ip.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ip_address = ip.getText().toString();
                Intent intent = new Intent(activity_1.this, Esp32CameraFragment.class);
                startActivity(intent);


            }

        });

    }

}
