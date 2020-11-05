import 'package:News_App/views/article_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:News_App/components/gradient.dart';
import 'package:share/share.dart';

class TNTTile extends StatefulWidget {
  final String img;
  final String head;
  final String des;
  final String source;
  final String tag;
  final String content;

  TNTTile({this.img, this.head, this.des, this.source, this.tag, this.content});
  @override
  _TNTTileState createState() => _TNTTileState();
}

_onShare(BuildContext context, String url) async {
  final RenderBox box = context.findRenderObject();
  await Share.share(url,
      subject: 'Invofinity',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}

class _TNTTileState extends State<TNTTile> {
  final bgColor = const Color(0xFFffffff);
  final cardColor = const Color(0xFFf8f8f8);
  final txtColor = const Color(0xFF171717);
  final border = Colors.grey[300];
  final border1 = Colors.grey[400];
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  final Shader lineargradient = LinearGradient(
    colors: <Color>[Color(0xFFff416c), Color(0xFFff4b2b)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: widget.des,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFf6f6f6),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: widget.img != null
                ? widget.content != ""
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: RadiantGradientMask(
                              child: Text(
                                widget.tag,
                                style: TextStyle(
                                  fontFamily: 'PoppinsSemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  foreground: Paint()..shader = lineargradient,
                                  //color: txtColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: border1,
                            height: 1.2,
                            width: MediaQuery.of(context).size.width - 46,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: bgColor,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    widget.img,
                                  ),
                                  fit: BoxFit.scaleDown),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.head,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.content,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(widget.source,
                                    style: TextStyle(
                                        fontFamily: 'PoppinsSemiBold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: border1)),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 190),
                              GestureDetector(
                                onTap: () => _onShare(context, widget.des),
                                child: Container(
                                  child: Icon(
                                    Feather.share_2,
                                    size: 15,
                                    color: border1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              widget.tag,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: border1,
                            height: 1.2,
                            width: MediaQuery.of(context).size.width - 46,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: bgColor,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    widget.img,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.head,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(widget.source,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        color: border1)),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 190),
                              GestureDetector(
                                onTap: () => _onShare(context, widget.des),
                                child: Container(
                                  child: Icon(
                                    Feather.share_2,
                                    size: 15,
                                    color: border1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )
                : widget.content != ""
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              widget.tag,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            color: border1,
                            height: 1.2,
                            width: MediaQuery.of(context).size.width - 46,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.head,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.content,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(widget.source,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        color: border1)),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 190),
                              GestureDetector(
                                onTap: () => _onShare(context, widget.des),
                                child: Container(
                                  child: Icon(
                                    Feather.share_2,
                                    size: 15,
                                    color: border1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              widget.tag,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            color: border1,
                            height: 1.2,
                            width: MediaQuery.of(context).size.width - 46,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.head,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(widget.source,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        color: border1)),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 190),
                              GestureDetector(
                                onTap: () => _onShare(context, widget.des),
                                child: Container(
                                  child: Icon(
                                    Feather.share_2,
                                    size: 15,
                                    color: border1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )),
      ),
    );
  }
}

class TNTTile2 extends StatefulWidget {
  final String img;
  final String head;
  final String des;
  final String source;
  final String tag;
  final String content;

  TNTTile2(
      {this.img, this.head, this.des, this.source, this.tag, this.content});
  @override
  _TNTTile2State createState() => _TNTTile2State();
}

class _TNTTile2State extends State<TNTTile2> {
  final bgColor = const Color(0xFFffffff);
  final cardColor = const Color(0xFFf8f8f8);
  final txtColor = const Color(0xFF171717);
  final border = Colors.grey[300];
  final border1 = Colors.grey[400];
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  final Shader lineargradient = LinearGradient(
    colors: <Color>[Color(0xFFff416c), Color(0xFFff4b2b)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: widget.des,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFf6f6f6),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: widget.content != null
                ? widget.img != null && widget.img != ""
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: RadiantGradientMask(
                              child: Text(
                                widget.tag,
                                style: TextStyle(
                                  fontFamily: 'PoppinsSemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: txtColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: border1,
                            height: 1.2,
                            width: MediaQuery.of(context).size.width - 46,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: bgColor,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    widget.img,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.head,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.content,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(widget.source,
                                    style: TextStyle(
                                        fontFamily: 'PoppinsSemiBold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: border1)),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 190),
                              GestureDetector(
                                onTap: () => _onShare(context, widget.des),
                                child: Container(
                                  child: Icon(
                                    Feather.share_2,
                                    size: 15,
                                    color: border1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              widget.tag,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            color: border1,
                            height: 1.2,
                            width: MediaQuery.of(context).size.width - 46,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.head,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.content,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(widget.source,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        color: border1)),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 190),
                              GestureDetector(
                                onTap: () => _onShare(context, widget.des),
                                child: Container(
                                  child: Icon(
                                    Feather.share_2,
                                    size: 15,
                                    color: border1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )
                : widget.img != null && widget.img != ""
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: RadiantGradientMask(
                              child: Text(
                                widget.tag,
                                style: TextStyle(
                                  fontFamily: 'PoppinsSemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: txtColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: border1,
                            height: 1.2,
                            width: MediaQuery.of(context).size.width - 46,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: bgColor,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    widget.img,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.head,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(widget.source,
                                    style: TextStyle(
                                        fontFamily: 'PoppinsSemiBold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: border1)),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 190),
                              GestureDetector(
                                onTap: () => _onShare(context, widget.des),
                                child: Container(
                                  child: Icon(
                                    Feather.share_2,
                                    size: 15,
                                    color: border1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              widget.tag,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            color: border1,
                            height: 1.2,
                            width: MediaQuery.of(context).size.width - 46,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 46,
                            child: Text(
                              widget.head,
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: txtColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                child: Text(widget.source,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        color: border1)),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 190),
                              GestureDetector(
                                onTap: () => _onShare(context, widget.des),
                                child: Container(
                                  child: Icon(
                                    Feather.share_2,
                                    size: 15,
                                    color: border1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      )),
      ),
    );
  }
}
