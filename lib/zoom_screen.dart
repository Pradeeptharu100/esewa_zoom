import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_native_sdk/zoom_native_sdk.dart';

class ZoomMeetingScreen extends StatefulWidget {
  const ZoomMeetingScreen({Key? key}) : super(key: key);

  @override
  _ZoomMeetingScreenState createState() => _ZoomMeetingScreenState();
}

class _ZoomMeetingScreenState extends State<ZoomMeetingScreen> {
  final _zoomNativelyPlugin = ZoomNativeSdk();
  bool isInitialized = false;
  final TextEditingController meetingIdController = TextEditingController();
  final TextEditingController meetingPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      if (!isInitialized) {
        isInitialized = (await _zoomNativelyPlugin.initZoom(
              appKey: "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I",
              appSecret: "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb",
            )) ??
            false;
      }
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
    if (!mounted) return;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: meetingIdController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                labelText: 'Meeting ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: meetingPasswordController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                labelText: 'Meeting Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  debugPrint("joinMeeting -> isInitialized = $isInitialized");
                  if (isInitialized) {
                    if (meetingIdController.text.isEmpty ||
                        meetingPasswordController.text.isEmpty) {
                      _showMessage(
                          "Please enter both Meeting ID and Password.");
                    } else {
                      await _zoomNativelyPlugin.joinMeting(
                        meetingNumber: meetingIdController.text,
                        meetingPassword: meetingPasswordController.text,
                      );
                    }
                  }
                },
                child: const Text("Join"),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                debugPrint("joinMeting -> isInitialized = $isInitialized");
                if (isInitialized) {
                  await _zoomNativelyPlugin.joinMeting(
                    meetingNumber: "",
                    meetingPassword: "",
                  );
                }
              },
              child: const Text("join"),
            ),
          ],
        ),
      ),
    );
  }
}
