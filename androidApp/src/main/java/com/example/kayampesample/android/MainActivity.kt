package com.example.kayampesample.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import com.example.kayampesample.NoteSource
import com.example.kayampesample.android.note_screen.NoteScreen

class MainActivity : ComponentActivity() {

    private val notes = NoteSource().notes()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            NoteScreen(notes)
        }
    }
}
