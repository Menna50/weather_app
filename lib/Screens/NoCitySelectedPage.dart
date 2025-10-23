import 'package:flutter/material.dart';

class NoCitySelectedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const
         Text("There is no weather 😔 start \n searching now 🔍"
          ,textAlign: TextAlign.center
        ,style: TextStyle(fontSize: 26,)


      ),
    )
    ;
  }
}
