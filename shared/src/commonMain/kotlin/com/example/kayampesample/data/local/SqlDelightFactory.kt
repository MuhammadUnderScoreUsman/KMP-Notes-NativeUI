package com.example.kayampesample.data.local

import app.cash.sqldelight.db.SqlDriver

@Suppress("EXPECT_ACTUAL_CLASSIFIERS_ARE_IN_BETA_WARNING")
expect class SqlDelightFactory {
    fun createInstance(): SqlDriver
}