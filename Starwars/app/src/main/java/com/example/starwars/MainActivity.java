package com.example.starwars;

import androidx.appcompat.app.AppCompatActivity;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.graphics.Path;
import android.os.Bundle;
import android.os.Build;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.PathInterpolator;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    boolean joystickIsPressed = false;
    ImageView imageView1;
    ImageView imageView2;
    ImageView imageView3;
    ImageView imageView4;
    ImageView imageViewJoyExt;
    ImageView imageViewJoyCen;
    ImageView imageViewTie;
    Handler handlerForMovingTie;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        imageView1 = findViewById(R.id.imageView1);
        imageView2 = findViewById(R.id.imageView2);
        imageView3 = findViewById(R.id.imageView3);
        imageView4 = findViewById(R.id.imageView4);
        imageViewJoyExt = findViewById(R.id.imageViewJoyExt);
        imageViewJoyCen = findViewById(R.id.imageViewJoyCen);
        imageViewJoyCen.setOnTouchListener((View.OnTouchListener) this);
        imageViewTie = findViewById(R.id.imageViewTie);

        handlerForMovingTie = new Handler();
        Runnable movingTie = new Runnable() {
            @Override
            public void run() {
                //imageViewTie.setX(...);
                //imageViewTie.setY(...);
                if (joystickIsPressed) {
                    handlerForMovingTie.postDelayed(this, 10);
                }
            }
        };

        Path path1 = new Path();
        path1.arcTo(0f, 0f, 1000f, 1000f, 270f, -180f, true);
        ObjectAnimator animator1 = ObjectAnimator.ofFloat(imageView1, View.X, View.Y, path1);
        animator1.setDuration(2000);
        animator1.setRepeatCount(Animation.INFINITE);
        animator1.start();

        Path path2 = new Path();
        path2.arcTo(500f, 500f, 1500f, 1500f, 180f, -90f, true);
        ObjectAnimator animator2 = ObjectAnimator.ofFloat(imageView2, View.X, View.Y, path2);
        animator2.setDuration(2000);
        animator2.setRepeatCount(Animation.INFINITE);
        animator2.start();

        Path path3 = new Path();
        path3.addOval(0f, 0f, 1000f, 1000f, Path.Direction.CW);
        ObjectAnimator animator3 = ObjectAnimator.ofFloat(imageView3, View.X, View.Y, path3);
        animator3.setDuration(2000);
        animator3.setRepeatCount(Animation.INFINITE);
        animator3.start();

        Path path4 = new Path();
        path2.arcTo(0f, 0f, 1000f, 1000f, 270f, -180f, true);
        ObjectAnimator animator4 = ObjectAnimator.ofFloat(imageView4, View.X, View.Y, path4);
        animator4.setDuration(2000);
        animator4.setRepeatCount(Animation.INFINITE);
        animator4.start();

    }

    public boolean onTouch(View v, MotionEvent me) {
        switch (me.getAction()) {
            case MotionEvent.ACTION_DOWN:
                joystickIsPressed = true;
                //appeler la fonction qui déplace le vaisseau (l. 43-53)
                break;
            case MotionEvent.ACTION_MOVE:
                //déplacer le vaisseau
                break;
            case MotionEvent.ACTION_UP:
                joystickIsPressed = false;
                //stopper le vaisseau
                break;
            default:
                return false;
        }
        return true;
    }

}