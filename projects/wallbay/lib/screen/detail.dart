import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallbay/model/wallpaper.dart';

class Detail extends StatefulWidget {
  final Wallpaper wallpaper;
  const Detail({Key? key, required this.wallpaper}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool downloadPermission = false;
  bool downloadImage = false;
  String downPer = '0%';
  final String nAvail = "Not Available";

  _permissionRequest() async {
    Permission permission = Permission.storage;
    PermissionStatus status = await permission.status;
    if (status.isGranted) {
      setState(() {
        downloadPermission = true;
        setWallpaper();
      });
    } else {
      requestPermission(permission);
    }
  }

  requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.wallpaper.portrait,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                widget.wallpaper.portrait,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: downloadImage
                  ? Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "Downloading.. $downPer",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        if (downloadPermission == false) {
                          print("Requesting Permission");
                          _permissionRequest();
                        } else {
                          print('Permission Granted');
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "Set Wallpaper",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }

  void setWallpaper() async {
    final dir = Platform.isAndroid
        ? await getExternalStorageDirectory() //FOR ANDROID
        : await getApplicationSupportDirectory(); //FOR iOS
    print(dir);
    Dio dio = Dio();
    dio.download(
      widget.wallpaper.original,
      "${dir?.path}/wallbay.png",
      onReceiveProgress: (received, total) {
        if (total != -1) {
          String downloadingPer =
              ((received / total * 100).toStringAsFixed(0) + "%");
          setState(() {
            downPer = downloadingPer;
          });
        }
        setState(() {
          downloadImage = true;
        });
      },
    ).whenComplete(() {
      setState(() {
        downloadImage = false;
      });
      showModalBottomSheet(
          isDismissible: false,
          context: context,
          builder: (_) {
            return Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GFButton(
                    onPressed: () {
                      initPlatformState("${dir?.path}/wallbay.png",
                          WallpaperManager.HOME_SCREEN);
                      Navigator.pop(context);
                    },
                    text: "HomeScreen",
                  ),
                  GFButton(
                    onPressed: () {
                      initPlatformState("${dir?.path}/wallbay.png",
                          WallpaperManager.LOCK_SCREEN);
                      Navigator.pop(context);
                    },
                    text: "LockScreen",
                  ),
                  GFButton(
                    onPressed: () {
                      initPlatformState("${dir?.path}/wallbay.png",
                          WallpaperManager.BOTH_SCREEN);
                      Navigator.pop(context);
                    },
                    text: "Both",
                  ),
                ],
              ),
            );
          });
    });
  }

  Future<void> initPlatformState(String path, int location) async {
    try {
      await WallpaperManager.setWallpaperFromFile(path, location);
      Fluttertoast.showToast(
          msg: 'Wallpaper Applied.', toastLength: Toast.LENGTH_SHORT);
    } on PlatformException {
      Fluttertoast.showToast(
          msg: 'Please Try Again Later.', toastLength: Toast.LENGTH_SHORT);
      print("Platform exception");
    }
    if (!mounted) return;
  }
}
