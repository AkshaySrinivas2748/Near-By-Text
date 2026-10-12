import 'package:flutter/material.dart';
import 'package:nearby_text/main.dart';
import 'package:nearby_text/src/utils/extensions/double_extension.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  appData.errorMessage ?? 'Unknown Error',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              15.0.height,
              ElevatedButton(
                onPressed: () async => await appData.onRetry(context),
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
