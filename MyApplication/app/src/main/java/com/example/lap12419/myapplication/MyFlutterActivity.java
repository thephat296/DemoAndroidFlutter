package com.example.lap12419.myapplication;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MyFlutterActivity extends FlutterActivity {

    public static final String CHANNEL = "com.example.lap12419.myapplication";

    private String name;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        name = getIntent().getStringExtra(MainActivity.NAME);

        new MethodChannel(getFlutterView(), CHANNEL)
                .setMethodCallHandler((methodCall, result) -> {
                            if (methodCall.method.contentEquals("getName")) {
                                result.success(name);
                                name = null;
                            } else if (methodCall.method.contentEquals("showNativeView")) {
                                startActivity(new Intent(this, MainActivity.class));
                                result.success(true);
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }
}
