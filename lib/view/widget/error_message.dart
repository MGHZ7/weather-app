import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String _message;
  const ErrorMessage({@required String message, Key key})
      : _message = message,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Container(
        color: Theme.of(context).colorScheme.error,
        child: Text(
          _message,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    ));
  }
}
