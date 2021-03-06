import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/sub_page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(DrawerSample());
}

/// 基本的なレイアウト
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Flutter"),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 30),
          margin: EdgeInsets.all(100),
          alignment: Alignment.center,
          // transform: Matrix4.rotationZ(100),
          child: Row(
            /// 順番逆転
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(Icons.star),
                  Container(
                    child: Text("Star", style: TextStyle(color: Colors.red, fontSize: 30),),
                  ),
                ],
              ),
              Column(
                /// 天地逆転
                verticalDirection: VerticalDirection.up,
                children: [
                  Icon(Icons.call),
                  Container(
                    child: Text("call", style: TextStyle(color: Colors.red, fontSize: 30)),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.print),
                  Container(
                    child: Text("print", style: TextStyle(color: Colors.red, fontSize: 30)),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
/**
 * =====================================================================================================================================
 */

/// ListView（要素が固定の場合）
class ListViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListViewSample"),
        ),
        body: ListView(
          children: [
            _menuItem("メニュー1", Icon(Icons.settings)),
            _menuItem("メニュー2", Icon(Icons.map)),
            _menuItem("メニュー3", Icon(Icons.room)),
            _menuItem("メニュー4", Icon(Icons.local_shipping)),
            _menuItem("メニュー5", Icon(Icons.airplanemode_active))
          ],
        ),
      ),
    );
  }

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0
            ),
          ),
          onTap: () {
            print("onTaped");
          },
          onLongPress: () {
            print("onLongPress");
          },
        ),
        )
    );
  }
}

/// ListView(要素が動的な場合)
class ListViewSample2 extends StatelessWidget {
  var list = ["メッセージ", "メッセージ", "メッセージ", "メッセージ", "メッセージ",];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListViewSample"),
        ),
        body: ListView.builder(
          /// スクロール方向を指定
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index >= list.length) {
                list.addAll(["メッセージ","メッセージ","メッセージ","メッセージ",]);
              }
              return _messageItem(list[index]);
            }
        ),
      ),
    );
  }
  Widget _messageItem(String title) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0
          ),
        ),
        onTap: () {
          print("");
        },
        onLongPress: () {
          print("");
        },
      ),
    );
  }
}
/**
 * =====================================================================================================================================
 */

/// GridViewについて
class GridViewSample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /// TODO: 例となるimageなので、指定のディレクトリに、ファイル名を追加して確認
    var list = [
      _photoItem("pic0"),
      _photoItem("pic1"),
      _photoItem("pic2"),
      _photoItem("pic3"),
    ];
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: GridView.count(
          /// スクロールの方向も指定できる
          scrollDirection: Axis.horizontal,
          /// 表示するgridViewの横の個数
          crossAxisCount: 2,
          children: list,
        ),
      ),
    );
  }
  Widget _photoItem(String image) {
    var assetsImage = "assets/img/" + image + ".png";
    return Container(
      child: Image.asset(assetsImage, fit: BoxFit.cover),
    );
  }
}

/**
 * =====================================================================================================================================
 */

/// スタックView
class StackSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("StackSample"),
        ),
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: Container(color: Colors.green,),
            ),
            Positioned(
                left: 100,
                top: 100,
                width: 300,
                height: 300,
                child: Container(color: Colors.red,)
            ),
            Positioned(
                right: 100,
                bottom: 100,
                width: 300,
                height: 300,
                child: Container(color: Colors.grey,)
            ),
            Positioned(
                left: 200,
                top: 200,
                width: 100,
                height: 100,
                child: Container(color: Colors.blue,)
            ),
            Text("sample")
          ],
        ),
      ),
    );
  }
}

/**
 * =====================================================================================================================================
 */

/// カード
class CardSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("CardSample"),
        ),
        body: Card(
          margin: EdgeInsets.all(100),
          child: Container(
            margin: EdgeInsets.all(50),
            width: 300,
            height: 100,
            child: Text("Card", style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
    );
  }
}

/**
 * =====================================================================================================================================
 */

/// StatefulWidgetに関して
class StateFul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("StateFul"),
        ),
        body: StateFulSample(),
      ),
    );
  }

}

class StateFulSample extends StatefulWidget {
  StateFulSampleState createState() => StateFulSampleState();
}

class StateFulSampleState extends State<StateFulSample> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Icon(
                  Icons.thumb_up,
                  color: _active ? Colors.orange[700] : Colors.grey[500],
                  size: 100.0,
                ),
              ),
              width: 200.0,
              height: 200.0,
            ),
            Container(
              child: Center(
                child: Text(
                  _active ? "Active" : "Inactive",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white
                  ),
                ),
              ),
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: _active ? Colors.orange[700] : Colors.grey[600]
              ),
            )
          ],
        ),
      ),
    );
  }
}

/**
 * =====================================================================================================================================
 */

/// Button色々
class ButtonSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ButtonSample"),
        ),
        body: Center(
          child: ButtonStateFul(),
        ),
      ),
    );
  }
}

class ButtonStateFul extends StatefulWidget {
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<ButtonStateFul> {
  int count = 0;

  void handlePressed() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$count",
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.w500
          ),
        ),
        // OutlineButton(
        //     onPressed: handlePressed,
        //     // 角丸
        //     // shape: RoundedRectangleBorder(
        //     //   borderRadius: BorderRadius.circular(20)
        //     // ),
        //     // color: Colors.blue,
        //     borderSide: BorderSide(
        //       color: Colors.blue
        //     ),
        //     child: Text("更新", style: TextStyle(color: Colors.blue, fontSize: 20.0),)
        // )
        FloatingActionButton.extended(
          onPressed: handlePressed,
          backgroundColor: Colors.blue,
          icon: Icon(Icons.add),
          label: Text("ボタン"),
        ),
        popupButton(),
        dropdown()
      ],
    );
  }
  /// メニューボタン
  Widget popupButton() {
    return PopupMenuButton(
      onSelected: handle,
        itemBuilder: (context) => <PopupMenuEntry<int>>[
          PopupMenuItem(
              value: 1,
              child: Text("選択1")
          ),
          PopupMenuItem(
              value: 2,
              child: Text("選択2")
          ),
          PopupMenuItem(
              value: 3,
              child: Text("選択3")
          ),
          PopupMenuItem(
              value: 4,
              child: Text("選択4")
          ),
        ]);
  }
  void handle(int value) {
    setState(() {
      count = value;
    });
  }

  /// ドロップダウンメニュー
  Widget dropdown() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text("$text", style: TextStyle(fontSize: 30.0, color: Colors.blueAccent, fontWeight: FontWeight.w500),),
          DropdownButton<String>(
            onChanged: onChange,
              value: defaultValue,
              items: list.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value)
                );
              }).toList()
          )
        ],
      ),
    );
  }

  String defaultValue = "りんご";
  List<String> list = <String>["りんご", "オレンジ", "みかん", "ぶどう"];
  String text = "";

  void onChange(String? value) {
    setState(() {
      text = value!;
      defaultValue = value;
    });
  }
}

/**
 * =====================================================================================================================================
 */

/// テキストフィールド
class TextFieldSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextFieldSample"),
          /// 左
          leading: Icon(Icons.menu),
          backgroundColor: Colors.orange,
          centerTitle: true,
          /// 右
          actions: [
            IconButton(
              onPressed: () {},
                icon: Icon(Icons.face, color: Colors.white,)
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.email, color: Colors.white,)
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite, color: Colors.white,)
            ),
          ],
        ),
        body: TextFieldStateFul(),
      ),
    );
  }
}

class TextFieldStateFul extends StatefulWidget {
  TextFormFieldState createState() => TextFormFieldState();

}
class TextFieldState extends State<TextFieldStateFul> {
  String text = "";

  void handleText(String e) {
    setState(() {
      text = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 30
            ),
          ),
          TextField(
            enabled: true,
            /// 最大旧力文字数
            maxLength: 10,
            /// 最大入力文字数を超えても入力ができる（エラー表記になる）
            maxLengthEnforced: false,
            style: TextStyle(color: Colors.red),
            /// 文字を隠すかどうか
            obscureText: true,
            /// 行数
            maxLines: 1,
            /// フォーマッターの設定
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              icon: Icon(Icons.face),
              /// ヒント
              hintText: "お名前をご入力ください",
              /// 題名のような
              labelText: "名前*"
            ),
            onChanged: handleText,
          )
        ],
      ),
    );
  }
}

/// TextEditingControllerについて
class TextFieldStateController extends State<TextFieldStateFul> {
  final TextEditingController textEditingController = TextEditingController();

  String text = "";

  void handleText(String e) {
    setState(() {
      text = e;
    });
  }

  void printLatestValue() {
    print("入力状況：${textEditingController.text}");
  }

  void submission(String e) {
    print(textEditingController.text);
    textEditingController.clear();
    setState(() {
      text = "";
    });
  }

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(printLatestValue);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30,
              fontWeight: FontWeight.w500
            ),
          ),
          TextField(
            enabled: true,
            maxLines: 10,
            maxLengthEnforced: false,
            obscureText: false,
            controller: textEditingController,
            onChanged: handleText,
            onSubmitted: submission,
          )
        ],
      ),
    );
  }

}

class TextFormFieldState extends State<TextFieldStateFul> {
  /// ユニークなグループを作成
  /// こちらを設定すれば、設定されたFormのvalidatorを全てチェックしてくれる（formKey.currentState!.validate()）
  final formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child:Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              TextFormField(
                enabled: true,
                maxLength: 20,
                obscureText: false,
                autovalidate: false,
                decoration: InputDecoration(
                  hintText: "お名前をご入力ください",
                  labelText: "名前*"
                ),
                validator: (value) {
                  return value!.isEmpty ? "必須入力です" : null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                maxLength: 100,
                autovalidate: true,
                decoration: InputDecoration(
                  hintText: "連絡先をご入力ください",
                  labelText: "メールアドレス"
                ),
                validator: (value) {
                  return !value!.contains("@") ? "アットマーク「@」がありません。" : null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              RaisedButton(
                onPressed: _submission,
                child: Text("保存"),
              )
            ],
          ),
        )
    );
  }
  void _submission() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
      print(name);
      print(email);
    }
  }

}

/**
 * =====================================================================================================================================
 */

/// tabberについて
class BottomStateles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: BottomStateFul()
    );
  }
}

class BottomStateFul extends StatefulWidget {
  BottomNavigationBarState createState() => BottomNavigationBarState();

}

class BottomNavigationBarState extends State<BottomStateFul> {

  int currentIndex = 0;
  final pageWidget = [
    PageWidget(color: Colors.white, title: "Home",),
    PageWidget(color: Colors.blue, title: "Album",),
    PageWidget(color: Colors.orange, title: "Chat",),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationSample"),
      ),
      body: pageWidget.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home"), backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(icon: Icon(Icons.photo_album), title: Text("Album"), backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("Chat"), backgroundColor: Colors.lightBlue),
        ],
        currentIndex: currentIndex,
        fixedColor: Colors.white,
        onTap: onItemTapped,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
  void onItemTapped(int index) => setState(() => currentIndex = index);

}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  PageWidget({Key? key, required this.color, required this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25
          ),
        ),
      ),
    );
  }
}

/**
 * =====================================================================================================================================
 */

/// Sliverについて
class SliverAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        home: SliverAppBarSampleFul()
    );
  }
}

class SliverAppBarSampleFul extends StatefulWidget {
  SliverAppBarGridSampleState createState() => SliverAppBarGridSampleState();

}
/// ListView
class SliverAppBarSampleState extends State<SliverAppBarSampleFul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sliverAppBarSample"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Demo"),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 200,
            delegate: SliverChildBuilderDelegate( (contex, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text("list item$index", style: TextStyle(fontSize: 30),),
              );
              },
                childCount: 11
            ),
          )
        ],
      ),
    );
  }
}

/// Grid
class SliverAppBarGridSampleState extends State<SliverAppBarSampleFul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sliverAppBarSample"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Demo"),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4
            ),
              delegate: SliverChildBuilderDelegate( (context, index) {
               return Container(
                 alignment: Alignment.center,
                 color: Colors.teal[100 * (index % 9)],
                 child: Text("grid item $index"),
               );
              },
                childCount: 100
              ),
          )
        ]
      ),
    );
  }
}

/**
 * =====================================================================================================================================
 */

/// ドロワーについて
class DrawerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        home: DrawerSampleFul(),
      routes: <String, WidgetBuilder> {
          "/home": (context) => DrawerSample(),
        "/subPage": (context) => SubPage()
      },
    );
  }
}

class DrawerSampleFul extends StatefulWidget {
  DrawerSampleState createState() => DrawerSampleState();

}

class DrawerSampleState extends State<DrawerSampleFul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DrawerSample"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Text("DrawerHeader"),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text("item1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("item2"),
              trailing: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SubPage();
            })), child: Text("次画面へ"),
            // onPressed: () => Navigator.of(context).pushNamed("/subPage"), child: Text("次のページへ"),
            // 次画面遷移後にpop()で戻ろうとすると、戻れなくなる（一方こうとなる）
            // onPressed: () => Navigator.of(context).pushReplacementNamed("/subPage"), child: Text("次のページへ"),
          ),
        ),
      ),
    );
  }
}