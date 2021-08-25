
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubPageStateFul();
  }
}

/// SnackBar
// class SubPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("SnackBar"),
//         ),
//         body: Center(
//           child: RaisedButton(
//             onPressed: () {
//               final snackBar = SnackBar(
//                   content: Text("お知らせ!"),
//                 action: SnackBarAction(
//                   label: "閉じる",
//                   onPressed: () {
//                     Scaffold.of(context).removeCurrentSnackBar();
//                   },
//                 ),
//                 duration: Duration(seconds: 3),
//               );
//               Scaffold.of(context).showSnackBar(snackBar);
//             },
//             child: Text("スナックバーを開く"),
//           ),
//         ),
//       ),
//     );
//   }
// }

class SubPageStateFul extends StatefulWidget {
  @override
  SubpageState createState() => SubpageState();

}

class SubpageState extends State<SubPageStateFul> {
  String _value = "";

  Color _color = Colors.blue.shade100;

  Alignment _alignment = Alignment.topLeft;

  TextStyle _style = TextStyle(
    color: Colors.blueAccent,
    fontSize: 30,
    fontWeight: FontWeight.w900
  );

  void _onTapText() => setState(() => _style = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w300
  ));

  void _onTap() => setState(() => _color = Colors.blue.shade900);

  void _onTapAlignment() => setState(() => _alignment = Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("subPage"),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _onTap,
        onPressed: _onTapText,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(), child: Text("戻る"),
              ),
              Text(_value, style: TextStyle(fontSize: 30, color: Colors.blue),),
              RaisedButton(
                onPressed: () => {
                  openDialog(context)
                },
                child: Text("ダイアログを開く"),
              ),
              /// AnimatedContainerだと親要素としないとうまく動いてくれないので注意
              AnimatedAlign(
                alignment: _alignment,
                duration: Duration(seconds: 1),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                ),
              ),
              AnimatedDefaultTextStyle(
                  child: Text("変更されるよー"),
                  style: _style,
                  duration: Duration(seconds: 1))
            ],
          ),
        ),
      ),
    );
  }

  /// SimpleDialog
  // void openDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => SimpleDialog(
  //         title: Text("SimpleDialog"),
  //         children: [
  //           SimpleDialogOption(
  //             child: Text("YES"),
  //             onPressed: () {
  //               Navigator.pop(context, "YES");
  //             },
  //           ),
  //           SimpleDialogOption(
  //             child: Text("NO"),
  //             onPressed: () {
  //               Navigator.pop(context, "NO");
  //             },
  //           )
  //         ],
  //       )
  //   ).then((value) {
  //     _setValue(value);
  //   });
  // }
  /// AlertDialog
  // void openDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text("SimpleDialog"),
  //         content: Text("アラートダイアログです\n以下のボタンを押下してください"),
  //         actions: [
  //           SimpleDialogOption(
  //             child: Text("YES"),
  //             onPressed: () {
  //               Navigator.pop(context, "YES");
  //             },
  //           ),
  //           SimpleDialogOption(
  //             child: Text("NO"),
  //             onPressed: () {
  //               Navigator.pop(context, "NO");
  //             },
  //           )
  //         ],
  //       )
  //   ).then((value) {
  //     _setValue(value);
  //   });
  // }

  /// ActionSheet
  void openDialog(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) {
     return Container(
       height: 250,
       padding: EdgeInsets.all(10),
       child: Column(
         children: [
           Text("複数行の内容を"),
           Text("記載することができる。"),
           Text("ヘルプや"),
           Text("ユーザー候補に使える。"),
           RaisedButton(
             child: Text("OK"),
               onPressed: () {
               Navigator.pop(context, "OK");
             }),
           RaisedButton(
               child: Text("Close"),
               onPressed: () {
                 Navigator.pop(context, "Close");
               }),
         ],
       ),
     );
    }).then((value) {
      _setValue(value);
    });
  }


  void _setValue(String value) {
    setState(() {
      _value = value;
    });
  }
}