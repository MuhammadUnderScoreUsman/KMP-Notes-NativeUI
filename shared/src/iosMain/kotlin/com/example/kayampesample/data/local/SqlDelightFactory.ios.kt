package com.example.kayampesample.data.local

import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.native.NativeSqliteDriver
import com.example.kayampesample.AppDatabase

@Suppress("EXPECT_ACTUAL_CLASSIFIERS_ARE_IN_BETA_WARNING")
actual class SqlDelightFactory {
    actual fun createInstance(): SqlDriver {
        return NativeSqliteDriver(AppDatabase.Schema, "note.db")
    }
}