plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.alrc.radiobusiness"
    compileSdk = 34
    ndkVersion = "29.0.13599879"

    defaultConfig {
        applicationId = "com.alrc.radio"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }
}
