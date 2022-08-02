import 'package:animax/model/comments.dart';
import 'package:animax/widgets/comment_item.dart';
import 'package:flutter/material.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '29.5K Comments',
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'See all',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemBuilder: ((context, index) {
            final comment = mockCommentsList[index];
            return CommentItem(
              userName: comment.userName,
              content: comment.content,
              likeNum: comment.likeNum,
            );
          }),
          itemCount: mockCommentsList.length,
        ),
      ),
    ]);
  }
}
