import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.orange,
    ),
    title: 'advenced programing',
    // ignore: prefer_const_constructors
    home: MyHomePage(),
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('고급 프로그래밍\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.lightBlue[300]),),
                const Text('학번 : 2017848028\n', style: TextStyle(fontSize: 20)),
                const Text('김준우', style: TextStyle(fontSize: 20))
              ]
          )
      ),
      drawer: Drawer(
        // 앱바 왼편에 햄버거 버튼 생성
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(Icons.menu, color: Colors.grey[850]),
              title: const Text('Flutter App'),
              tileColor: Colors.orange[300],
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.grey[850]),
              title: const Text('Introduce'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.text_snippet, color: Colors.grey[850]),
              title: const Text('Reference'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RefPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.grey[850]),
              title: const Text('Q&A'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QnAPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('소개'),
          backgroundColor: Colors.orange,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.info_outline), text: '간단 소개',),
              Tab(icon: Icon(Icons.web), text: '홈페이지',),
              Tab(icon: Icon(Icons.videocam), text: '소개 영상',),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Intro(),
            const HomePage(),
            const Player(),
          ],
        ),
      ),
    );
  }
}
class RefPage extends StatelessWidget {
  const RefPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reference"),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Card(
                child: ListTile(
                  title:const Text("자료") ,
                  onTap: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return const AlertDialog(
                        title: Text("자료 출처"),
                        content: Text("학교 마크 https://cms1.ks.ac.kr/kor/Contents.do?mCode=MN0014 \n\n "
                            "유튜브 영상 https://www.youtube.com/watch?v=pjK8BUlonfw&list=PL1xlevos-f-4vwXPAlpoueiYbKdLm1Wm_&index=88\n\n"
                            "홈페이지 캡쳐 https://careers.smilegate.com/"),
                      );
                    });
                  },
                )
            ),
            Card(
              child: ListTile(
                title: const Text("코드"),
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return const AlertDialog(
                      title: Text("코드 출처"),
                      content: Text("아이콘 변경 https://asufi.tistory.com/entry/Flutter-Flutter-%EC%95%B1-%EC%B6%9C%EC%8B%9C-%ED%95%98%EA%B8%B0-release-build-apk\n\n"
                          "로딩 화면 https://pub.dev/packages/flutter_native_splash\n\n"
                          "슬라이드 메뉴 https://yongho1037.tistory.com/800\n\n"
                          "ListView https://codesinsider.com/flutter-listview-example/\n\n"
                          "상단바 가리기 https://ahang.tistory.com/3\n\n"
                          "유튜브 재생 https://www.youtube.com/watch?v=GQyWIur03aw\n\n"),
                    );
                  });
                },
              ),
            ),
            Card(
                child: ListTile(
                  title: const Text("수업자료"),
                 onTap: (){
                   showDialog(context: context, builder: (BuildContext context){
                     return const AlertDialog(
                       title: Text("수업자료 참고"),
                       content: Text("탭바, 레이아웃, 웹 뷰, dialog, 텍스트 입력"),
                     );
                   });
                 },
                )
            ),
          ],
        )
    );
  }
}
class QnAPage extends StatefulWidget {
  const QnAPage({Key? key}) : super(key: key);

  @override
  _QnAState createState() => _QnAState();
}
class _QnAState extends State<QnAPage> {
  List question = [];
  String input = "";

// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q&A"),
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: const Text("Add Question"),
                    content: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(onPressed: (){
                        setState(() {
                          question.add(input);
                        });
                        Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                      },
                          child: const Text("Add"))
                    ]
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: question.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible( // 삭제 버튼 및 기능 추가
                key: Key(question[index]),
                child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(borderRadius:
                    BorderRadius.circular(8)
                    ),
                    child: ListTile(
                      title: Text(question[index]),
                      trailing: IconButton(icon: const Icon(
                          Icons.delete,
                          color: Colors.red
                      ),
                          onPressed: () {
                            setState(() {
                              question.removeAt(index);
                            });
                          }),
                    )
                ));
          }),
    );
  }
}

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late YoutubePlayerController controller;

  @override
  void initState(){
    super.initState();

    const url = "https://www.youtube.com/watch?v=pjK8BUlonfw&list=PL1xlevos-f-4vwXPAlpoueiYbKdLm1Wm_&index=88";

    controller = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(url)!);
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>
      YoutubePlayerBuilder(
        player: YoutubePlayer(controller:  controller,),
        builder: (context, player) =>
            Scaffold(
              appBar: AppBar(title: const Text('소개 영상'),backgroundColor: Colors.grey,),
              body: ListView(
                children: [
                  player,
                ],
              ),
            ),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://www.smilegate.com/ko/company/about.do',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

class Intro extends StatelessWidget {
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'SmileGate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Widget textSection = const Padding(
    padding: EdgeInsets.all(40),
    child: Text(
      'AI, 게임 제작, 사업, 경영 지원, 기술/인프라, 사회공헌을 목표로 하는 기업입니다.\n'
          '이 중 저는 게임 제작 계열을 목표로 하고 있는데,\n'
          '게임 계열로는 각종 게임 개발, e스포츠, 퍼블리싱, 플랫폼 서비스 개발 등이 있습니다.',
      softWrap: true,
    ),
  );

  Intro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Image.asset('assets/intro.jpg',width: 600, height: 400, fit: BoxFit.cover,),
            titleSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

