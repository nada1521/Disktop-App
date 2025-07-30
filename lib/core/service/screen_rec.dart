import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:desktop_app/main.dart';
import 'package:flutter/material.dart';
import '../../Feature/Home/view/screen/overlay_entry_black_screen.dart';

//بيظهر شاشة سودا لو اكتشف ان تطبيق بيسجل
class ScreenRecorderBlocker {
  static final List<String> nameOfRecorderApp = [
    'obs64',
    'bdcam', // Bandicam
    'camtasiaStudio', // Camtasia
    'screenrec',
    'snagit32', // Snagit
    'gamebar', // Xbox Game Bar
    'flashbackrecorder',
    'apowerrec', // Apowersoft
    'icecream',
    'screenflow',
    'debut',
    'loom',
    'screencast',
    'recordit',
  ];

  // OverlayEntry لعرض الشاشة السوداء
  // Timer لمراقبة التطبيقات التي تسجل الشاشة
  static OverlayEntry? _overlayEntry;
  static Timer? _timer;

  // windowManager لإدارة نافذة التطبيق
  static void startMonitoring(context) async {
    final isRecordingNow = await _isScreenRecorderRunning();
    if (isRecordingNow) {
      showBlackOverlayScreen(context);
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final isRecording = await _isScreenRecorderRunning();
      if (isRecording) {
        showBlackOverlayScreen(context);
      } else {
        _removeBlackOverlayScreen();
      }
    });
  }

  static Future<bool> _isScreenRecorderRunning() async {
    // استخدام PowerShell للحصول على قائمة العمليات
    final result = await Process.run('powershell', [
      '-Command',
      'Get-Process | Select-Object Name',
    ]);
    // التحقق من وجود أي من تطبيقات تسجيل الشاشة في قائمة العمليات
    if (result.stdout == null) return false;
    for (String name in nameOfRecorderApp) {
      if (result.stdout.toString().toLowerCase().contains(name.toLowerCase())) {
        log('📹 تم الكشف عن مسجل شاشة: $name');
        return true;
      }
    }
    return false;
  }

  static void showBlackOverlayScreen(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(builder: (_) => OverlayEntryBlackScreen());

    final overlay = navigatorKey.currentState?.overlay;
    if (_overlayEntry != null) {
      overlay?.insert(_overlayEntry!);
    }
  }

  static void _removeBlackOverlayScreen() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  static void dispose() {
    _timer?.cancel();
    _removeBlackOverlayScreen();
  }
}



//الكود دة بيقفل اى تطبيق بيسجل 

// class ScreenRecorderBlocker {
  // static final List<String> _recorderKeywords = [
  //   'obs', 'bdcam', 'bandicam', 'camtasia', 'screenrec', 'snagit',
  //   'xbox', 'flashback', 'apowersoft', 'icecream', 'screenflow',
  //   'debut', 'loom', 'screencast', 'recordit'
  // ];

//   static final Set<String> _killedLog = {};

//   static void startMonitoring(BuildContext context) {
//     Timer.periodic(const Duration(seconds: 5), (timer) async {
//       for (var recorder in _recorderKeywords) {
//         var result = await Process.run('powershell', [
//           '-Command',
//           '''
//           Get-Process | Where-Object {
//             \$_.Name -like "*$recorder*" -or \$_.MainWindowTitle -like "*$recorder*"
//           } | ForEach-Object {
//             Stop-Process -Id \$_.Id -Force;
//             Write-Output \$_.Name;
//           }
//           '''
//         ]);

//         var killed = result.stdout.toString().trim();
//         if (killed.isNotEmpty) {
//           for (var name in killed.split('\n')) {
//             if (!_killedLog.contains(name)) {
//               _killedLog.add(name);
//               log("🛑 تم إيقاف: $name");

//               // عرض رسالة تحذير
//               showDialog(
//                 context: context,
//                 builder: (_) => AlertDialog(
//                   title: const Text("تحذير أمني ⚠️"),
//                   content: Text("تم منع تشغيل برنامج تسجيل الشاشة: $name"),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text("حسنًا"),
//                     ),
//                   ],
//                 ),
//               );
//             }
//           }
//         }
//       }
//     });
//   }
// }

