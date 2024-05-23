import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom_floating_button.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.8,
          color: Colors.amber,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    Image.asset(
                      'images/photo.png',
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Yuna',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                isThreeLine: true,
                subtitle: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 6),
                  child: Column(
                    children: [
                      Text(
                        'Sleep in Sunday is the best day of the week! #sunspot',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border_rounded,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat_bubble_outline,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_border,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                dense: false,
              );
            },
            itemCount: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.62,
              right: 24),
          child: Align(
            alignment: Alignment.bottomRight,
            child: CustomFloatingButton(
              icon: Icons.add,
              function: () {},
            ),
          ),
        ),
      ],
    );
  }
}

