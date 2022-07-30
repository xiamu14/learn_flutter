import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String _packageName = '';
  String _version = '';

  @override
  void initState() {
    PackageInfo.fromPlatform().then((info) {
      print(info.version);
      setState(() {
        _packageName = info.packageName;
        _version = info.version;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text("Recommend"),
            subtitle:
                const Text("Share this app with your friends and family."),
            onTap: () {
              // Share.share(
              //   "$message\n${url + _packageName}",
              // );
            },
          ),
          ListTile(
            title: const Text("Source Code"),
            subtitle: const Text("Find Source Code on GitHub."),
            onTap: () => {},
          ),
          ListTile(
            title: const Text("Rate App"),
            subtitle: const Text("Leave a review on the Google Play Store."),
            onTap: () => {},
          ),
          ListTile(
            title: const Text("App Version"),
            subtitle: Text(_version),
          )
        ],
      ),
    );
  }
}
