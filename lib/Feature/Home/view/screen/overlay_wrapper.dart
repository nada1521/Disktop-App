import 'dart:io';
import 'package:desktop_app/Feature/Auth/SignIn/view/screen/login_screen.dart';
import 'package:desktop_app/main.dart';
import 'package:flutter/material.dart';
import '../../../../core/function/check_user.dart';
import '../../../../core/function/is_running_as_admin.dart';
import '../../../../core/function/relaunch_as_admin.dart';
import '../../../../core/service/screen_record_blocker.dart';
import '../widget/show_privacy_dialog.dart';
import '../widget/show_privacy_mac_os_and_linux.dart';

class OverlayWrapper extends StatefulWidget {
  const OverlayWrapper({super.key});

  @override
  State<OverlayWrapper> createState() => _OverlayWrapperState();
}

class _OverlayWrapperState extends State<OverlayWrapper> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final context = navigatorKey.currentState?.context;
     
      if (context != null) {
       await checkUser(context);
        final isAdmin = await isRunningAsAdmin();
        if (!isAdmin) {
          bool userAgreed = false;
          if (Platform.isWindows) {
            userAgreed = await showPrivacyDialogWindows();
          } else if (Platform.isMacOS || Platform.isLinux) {
            userAgreed = await showPrivacyDialogMacOsAndLinux();
          }

          if (!userAgreed) {
            relaunchAsAdmin();
            
          }
          
        } else {
          // إذا كان المستخدم لديه صلاحيات المسؤول، نعرض الشاشة الرئيسية
          ScreenRecorderBlocker.startMonitoring(context);
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
