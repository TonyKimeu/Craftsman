import 'package:craftsman/ui/widgets/platform_text.dart';
import 'package:flutter/material.dart';
import 'package:craftsman/ui/widgets/custom_flat_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Image(
              image: new AssetImage("assets/images/logo.png"),
              width: 125.0,
              height: 125.0,
              color: null,
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
            )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
            child: PlatformText(
              "CRAFTMAN",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(96, 125, 139, 1.0),
                decoration: TextDecoration.none,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                fontFamily: "OpenSans",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PlatformText(
              "Lorem ipsum dolor sit amet, eam facilis temporibus ei. Ex omnium adipisci qui. Zril oportere suavitate eu mei.",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                fontFamily: "OpenSans",
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomFlatButton(
              title: "Log In",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed("/signin");
              },
              splashColor: Colors.black12,
              borderColor: Color.fromRGBO(96, 125, 139, 1.0),
              borderWidth: 0,
              color: Color.fromRGBO(96, 125, 139, 1.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomFlatButton(
              title: "Sign Up",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.black54,
              onPressed: () {
                Navigator.of(context).pushNamed("/signup");
              },
              splashColor: Colors.black12,
              borderColor: Colors.black12,
              borderWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}
