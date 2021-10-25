package com.cookandroid.optionmenu;

import android.os.Bundle;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("옵션 메뉴 출력");
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);

        menu.add(0, 1, 0, "학번");
        menu.add(0, 2, 0, "이름");
        menu.add(0, 3, 0, "개발자 정보");

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        Toast numT = Toast.makeText(MainActivity.this, "2017848028", Toast.LENGTH_SHORT);
        Toast nameT = Toast.makeText(MainActivity.this, "김준우", Toast.LENGTH_SHORT);
        Toast infoT = Toast.makeText(MainActivity.this, "2017848028 김준우", Toast.LENGTH_SHORT);
        switch (item.getItemId()) {
            case 1:
                numT.setGravity(Gravity.CENTER_VERTICAL,0,0);
                numT.show();
                return true;
            case 2:
                nameT.show();
                return true;
            case 3:
                infoT.show();
                return true;
        }
        return false;
    }
}