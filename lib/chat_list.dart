library chat_list;

import 'package:chat_list/models/message_model.dart';
import 'package:chat_list/widgets/message_widget.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/widgets.dart';


class ChatList extends StatelessWidget {


  ScrollController scrollController = ScrollController();
  List<MessageModel> messageList = List();
  bool isTyping = false;

  ChatList(this.messageList, {this.isTyping, this.scrollController});

  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child:
          ListView.builder(
            shrinkWrap: true,
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            itemCount: messageList.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return MessageWidget(
                  MessageModel(
                      messageList[index].content,
                      messageList[index].ownerType,
                      ownerName: messageList[index].ownerName)
              );
            },
          ),
          flex: 8,
        ),
//        isTyping ?
//        Flexible(
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              SizedBox(
//                width: 50,
//                height: 50,
//                child: FlareActor(
//                  'files/typing_animation.flr',
//                  fit: BoxFit.contain,
//                  animation: 'startTyping',
//                ),
//              ),
//            ],
//          ),
//          flex: 1,
//        ) : SizedBox(height: 30, width: 50, child: Container(),)
      ],
    );
  }


}