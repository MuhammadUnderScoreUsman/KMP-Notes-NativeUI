package com.example.kayampesample.data.local

import com.example.kayampesample.AppDatabase
import com.example.kayampesample.db.TodoEntity
import kotlin.random.Random

class NoteRepository(
    private val sqlDelightFactory: SqlDelightFactory
) {

    private val db = AppDatabase(sqlDelightFactory.createInstance())
    private val queries = db.appDatabaseQueries

    private suspend fun getNotes(): List<TodoEntity> = queries.allNotes()
        .executeAsList().sortedByDescending { it.isImportant }

    suspend fun searchNotes(query: String): List<TodoEntity> {
        return if (query.isEmpty()) getNotes() else queries.searchViaTitle(query).executeAsList()
            .sortedByDescending { it.isImportant }
    }

    suspend fun insertNotes(todoEntity: TodoEntity) {
        println("DEBUG: ${todoEntity.id}")
        queries.upsert(
            todoEntity.id ?: Random.nextLong(Long.MIN_VALUE, Long.MAX_VALUE),
            todoEntity.title,
            todoEntity.body,
            todoEntity.isImportant,
            todoEntity.color
        )
    }

    suspend fun deleteAllNotes() {
        queries.deleteAll()
    }

    suspend fun deleteNote(id: Long) {
        queries.deleteNote(id)
    }

    suspend fun pinUnpinNote(todoEntity: TodoEntity) {
        insertNotes(
            TodoEntity(
                todoEntity.id ?: Random.nextLong(Long.MIN_VALUE, Long.MAX_VALUE),
                todoEntity.title,
                todoEntity.body,
                if(todoEntity.isImportant == true) false else true,
                todoEntity.color
            )
        )
    }

}