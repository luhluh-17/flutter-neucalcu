import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neucalcu/ui/widgets/constant/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double _size = 40;
    const String _appName = 'NeuCalcu';
    const String _appVersion = 'v1.2.1';
    final _theme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Row(
        children: <Widget>[
          SizedBox(
            width: _size,
            height: _size,
            child: Image.asset('assets/logo.png'),
          ),
          SizedBox(width: appPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _appName,
                style: _theme.subtitle1.copyWith(color: _theme.headline1.color),
              ),
              Text(_appVersion, style: _theme.caption.copyWith(color: _theme.subtitle1.color)),
            ],
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'NeuCalcu is a Flutter calculator application that uses Neumorphic Design',
            style: _theme.bodyText1.copyWith(color: _theme.headline1.color),
          ),
          SizedBox(height: appPadding),
          ContentText(
            leadingText:
                'This project is open-source you can grab the project at ',
            trailingText: 'Github',
            url: 'https://github.com/luhluh-17/flutter-neucalcu',
          ),
          SizedBox(height: appPadding),
          ContentText(
            leadingText: 'Icons by ',
            trailingText: 'Icons8',
            url: 'https://icons8.com',
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    );
  }
}

class ContentText extends StatelessWidget {
  final String leadingText;
  final String trailingText;
  final String url;

  ContentText({this.leadingText, this.trailingText, this.url});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: leadingText,
            style: _theme.bodyText1.copyWith(color: _theme.headline1.color),
          ),
          TextSpan(
            text: trailingText,
            style: _theme.bodyText1.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchURL(url: url),
          ),
        ],
      ),
    );
  }

  _launchURL({@required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
