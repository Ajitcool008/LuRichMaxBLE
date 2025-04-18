plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}


android {
    namespace = "com.lurichmaxble.lurichmaxble"
    compileSdk = 35 // Or: flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.lurichmaxble.lurichmaxble"
        minSdk = 23
        targetSdk = 34 // Or: flutter.targetSdkVersion
        versionCode = 1 // Or: flutter.versionCode
        versionName = "1.0.0" // Or: flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:33.12.0"))

    // Firebase products
    implementation("com.google.firebase:firebase-analytics")
    // Add more if needed
}

flutter {
    source = "../.."
}
