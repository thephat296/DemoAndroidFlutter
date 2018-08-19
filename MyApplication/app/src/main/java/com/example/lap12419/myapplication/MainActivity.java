package com.example.lap12419.myapplication;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    public static String NAME = "name";
    EditText edt_name;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        edt_name = findViewById(R.id.edt_name);

        findViewById(R.id.btn_navigate_to_flutter).setOnClickListener(l -> {
            String text = edt_name.getText().toString();
            if (TextUtils.isEmpty(text)) {
                Toast.makeText(this, "Please type something!", Toast.LENGTH_SHORT).show();
            } else {
                Intent intent = new Intent(this, MyFlutterActivity.class);
                intent.putExtra(NAME, text);
                startActivity(intent);
            }
        });
    }
}
