import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home',
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: HomePage(),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _tateController;
  bool showVideo = false;
  bool matrix = false, showMoney=false;
  bool hackerMode =false;
  final player = AudioPlayer();
  double top=0, left=0;
  @override
  void initState() {
    super.initState();
    _tateController = VideoPlayerController.asset("assets/videos/tate.mp4");
    _tateController.addListener(() {
      setState(() {

      });

    });
     player.setAsset("assets/audios/andrew-tate-suicide-official-music-video-By-Tuna.mp3");
    _tateController.setLooping(true);
    _tateController.initialize().then((_) => setState(() {}));
    // _tateController.play();
  }




  Widget _appBar(){
    bool hover = false;
    return StatefulBuilder(
        builder: (context, setState) {
          return MouseRegion(
            onHover: (v){
              setState((){
                hover = true;
                print(v);
              });
            },
            onExit: (v){
              setState((){
                hover = false;
                print(v);
              });
            },

            child: SizedBox(
              height: 132,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: hover?GestureDetector(

                  onTap: () async{
                    if(!player.playerState.playing){
                      await player.play();

                    }else{
                      await player.stop();
                    }
                  },
                  child: Column(
                    children: [
                      Image.asset("assets/images/xdor8nni.png", height: 100,),
                      const Text("What's the color of your bugatti", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ):Image.asset("assets/images/Tate-Logo-Web3.png", height: 100,),

              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        hackerMode?Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: MatrixEffect(),
        ):const SizedBox(),
        SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _appBar(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [

                    showVideo?Positioned(
                        left: 45,
                        top: -25,
                        child: SizedBox(
                            width: 420,
                            height: 310,
                            child: VideoPlayer(_tateController))
                      // ,
                    ):const SizedBox(
                      height: 280,
                      width: 300,
                      child: ColoredBox(color: backgroundColor),
                    ),

                    Image.asset("assets/images/smart-tv-3889141_960_720.png", width: 500, height: 300,),

                  ],
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 100,),
                        const Text( "CONNECT WITH AMBITIOUS MEN\n", style: TextStyle(color: Colors.red)),
                         Text.rich(TextSpan(children: [
                          const TextSpan(text: "Your net worth is your network. You need to surround yourself with successful men, men you can learn from.\n"),
                          const TextSpan(text: "If you were in a group of 100 "),
                           const TextSpan(text:"ice cream"),
                           const TextSpan(text:" experts and ALL you spoke about was making ice-cream, you’d learn A LOT about how to make ice-cream.\n"),
                          const TextSpan(text:"IT IS THE SAME WITH "), WidgetSpan(child:InkWell(child: const Text("MONEY.", style: TextStyle(color: Colors.white),), onTap: (){
                            setState(() {
                              showMoney = !showMoney;
                            });
                           },))
                        ], style: const TextStyle(color: Colors.white, ))),

                        const SizedBox(height: 50,),
                        const Text("WHAT IS THE REAL WORLD?", style: TextStyle(color: Colors.red),),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan( children:[
                            const TextSpan( text:"The Real World is a global community of like-minded individuals striving to acquire an abundance of wealth.\nWe provide our members with advanced education and mentoring from multimillionaire experts.\nOur fully independent learning platform is designed to break people free from the ",               style: TextStyle(color: Colors.white),
                            ),
                            WidgetSpan(child: StatefulBuilder(
                                builder: (context, setState_) {
                                  return InkWell(
                                      onHover: (v){
                                        setState_((){
                                          matrix =!matrix;
                                        });
                                      },
                                      onTap: (){

                                        setState((){
                                          hackerMode = !hackerMode;

                                        });
                                      },
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          const Text("Matrix", style: TextStyle(color: Colors.green),),
                                          matrix?Positioned(
                                              top:15,
                                              child: Image.asset("assets/images/136fde9d083701b2062f746beb88b776.jpg", height: 200,)):const SizedBox(),

                                        ],
                                      ));
                                }
                            ))
                          ]
                          ),
                        ),
                        SizedBox(
                          height: size.height,
                        ),
                      ],
                    ),
                  ],
                ),
                Opacity(
                  opacity: showMoney?1:0,
                  child: SizedBox(
                    width: size.width,
                  height: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          top: top,
                          left: left,
                          child: MouseRegion(
                            onHover: (v){
                              setState(() {
                                top += v.delta.dy *2;
                                left += v.delta.dx*2;
                                if(top > 250 || top < 50){
                                  top = Random().nextDouble()*300.0;
                                }
                                if(left < 60 || left > size.width - 60){
                                  left = Random().nextDouble()*size.width -60;
                                }
                              });
                            },
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("assets/images/united-states-dollar-usd.jpeg", width: 70),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Image.asset("assets/images/remote.png", height: 150,),
                    Positioned(
                      bottom: 40,
                      left: 20,
                      child: GestureDetector(

                        onTap: (){

                          _tateController.play();
                          setState(() {
                            showVideo = !showVideo;
                          });
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
      ],
    );
  }
}

class MatrixEffect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MatrixEffectState();
  }
}

class _MatrixEffectState extends State<MatrixEffect> {
  List<Widget> _verticalLines = [];
  late Timer timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: _verticalLines
    );
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      setState(() {
        _verticalLines.add(
            _getVerticalTextLine(context)
        );
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Widget _getVerticalTextLine(BuildContext context) {
    Key key = GlobalKey();
    return Positioned(
      key: key,
      left: Random().nextDouble() * MediaQuery.of(context).size.width,
      child: VerticalTextLine(
          onFinished: () {
            setState(() {
              _verticalLines.removeWhere((element) {
                return element.key == key;
              });
            });
          },
          speed: 1 + Random().nextDouble() * 9,
          maxLength: Random().nextInt(10) + 5
      ),
    );
  }
}
class VerticalTextLine extends StatefulWidget {
  const VerticalTextLine({
    required this.onFinished,
    this.speed = 12.0,
    this.maxLength = 10,
    Key? key
  }) : super(key: key);

  final double speed;
  final int maxLength;
  final VoidCallback onFinished;

  @override
  _VerticalTextLineState createState() => _VerticalTextLineState();
}

class _VerticalTextLineState extends State<VerticalTextLine> {
  late int _maxLength;
  late Duration _stepInterval;
  List<String> _characters = [];
  late Timer timer;

  @override
  void initState() {
    _maxLength = widget.maxLength;
    _stepInterval = Duration(milliseconds: (1000 ~/ widget.speed));
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    timer = Timer.periodic(_stepInterval, (timer) {
      final _random = new Random();
      String element = String.fromCharCode(
          _random.nextInt(512)
      );

      final box = context.findRenderObject() as RenderBox;

      if (box.size.height > MediaQuery.of(context).size.height * 2) {
        widget.onFinished();
        return;
      }

      setState(() {
        _characters.add(element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<double> stops = [];
    List<Color> colors = [];

    double greenStart = 0.3;
    double whiteStart = (_characters.length - 1) / (_characters.length);

    colors = [Colors.transparent, Colors.green, Colors.green, Colors.white];

    greenStart = (_characters.length - _maxLength) / _characters.length;

    stops = [0, greenStart, whiteStart, whiteStart];

    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: stops,
            colors: colors,
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: _getCharacters(),
        )
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  List<Widget> _getCharacters() {
    List<Widget> textWidgets = [];

    for (var character in _characters) {
      textWidgets.add(
          Text(character, style: TextStyle(fontFamily: "Monospace", fontSize: 14))
      );
    }

    return textWidgets;
  }
}