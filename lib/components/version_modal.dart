import 'package:flutter/material.dart';

class VersionModal extends StatelessWidget {
  final String version;
  final String releaseDate;
  final String changes;

  const VersionModal({
    super.key,
    required this.version,
    required this.releaseDate,
    required this.changes,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Version: $version'),
          const SizedBox(height: 10),
          Text('Release Date: $releaseDate'),
          const SizedBox(height: 10),
          Text('Changes:\n$changes'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
