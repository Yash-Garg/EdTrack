import 'package:flutter/material.dart';

Future<void> showLoadingDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(),
  );
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: SizedBox(
          height: 164.0,
          width: 164.0,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 16.0),
                  Text('Please Wait....')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
