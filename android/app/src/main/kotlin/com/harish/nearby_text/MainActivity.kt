package com.harish.nearby_text

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream

class MainActivity : FlutterActivity() {
    private val channel = "com.harish.nearby_text/share_apk"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(
            flutterEngine!!.dartExecutor.binaryMessenger,
            channel
        ).setMethodCallHandler { call, result ->
            if (call.method == "getData") {
                val packageManager = context.packageManager
                val packageInfo = packageManager.getPackageInfo(context.packageName, 0)
                val apkPath = packageInfo.applicationInfo!!.sourceDir
                val externalPath =
                    File(applicationContext.applicationInfo.dataDir.plus("/files"), "backup.apk")

                try {
                    FileInputStream(File(apkPath)).use { input ->
                        FileOutputStream(externalPath).use { output ->
                            input.copyTo(output)
                        }
                    }
                    println("APK copied successfully to: ${externalPath.absolutePath}")
                } catch (e: Exception) {
                    println("Error copying APK: ${e.message}")
                }
                result.success("Copied Successfully")
            } else {
                result.error("Failure", "Copy Failure", {})
            }
        }
    }
}
