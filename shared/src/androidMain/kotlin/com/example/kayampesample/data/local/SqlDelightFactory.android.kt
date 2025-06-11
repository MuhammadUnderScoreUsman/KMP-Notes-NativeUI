package com.example.kayampesample.data.local

import android.content.Context
import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.android.AndroidSqliteDriver
import com.example.kayampesample.AppDatabase

@Suppress("EXPECT_ACTUAL_CLASSIFIERS_ARE_IN_BETA_WARNING")
actual class SqlDelightFactory(
    private val context: Context
) {
    actual fun createInstance(): SqlDriver {
        return AndroidSqliteDriver(AppDatabase.Schema, context,"note.db")
    }
}