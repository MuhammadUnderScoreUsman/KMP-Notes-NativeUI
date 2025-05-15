package com.example.kayampesample.android.note_screen

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.kayampesample.NoteSource
import com.example.kayampesample.model.Note

val backGroundColor = Color(0xfff1f3f7)

@Composable
fun NoteScreen(notes: List<Note>) {
    LazyColumn(modifier = Modifier.fillMaxSize().background(backGroundColor)) {
        items(notes) {
            NoteCard(it)
        }
    }
}


@Composable
fun NoteCard(note: Note) {

    var isExpanded by remember {
        mutableStateOf(false)
    }

    Column(
        modifier = Modifier
            .padding(15.dp)
            .clip(RoundedCornerShape(8.dp))
            .background(Color.White)
    ) {
        Text(text = note.title, modifier = Modifier.textPaddings(),
            style = TextStyle(
                fontSize = 18.sp
            )
        )
        Spacer(modifier = Modifier.fillMaxWidth().padding(start = 13.dp).height(1.dp).background(Color.LightGray))
        Text(text = note.description, modifier = Modifier.textPaddings().clickable {
            isExpanded = !isExpanded
        },
            style = TextStyle(
                fontSize = 18.sp
            ),
            maxLines = if(isExpanded) 15 else 3,
            overflow = TextOverflow.Ellipsis
        )
    }

}

fun Modifier.textPaddings(): Modifier{
    return this.padding(13.dp)
}


@Preview(showBackground = true)
@Composable
fun NotePreview() {
    Column(modifier = Modifier
        .fillMaxSize()
        .background(backGroundColor)) {

        NoteScreen(NoteSource().notes())

    }
}