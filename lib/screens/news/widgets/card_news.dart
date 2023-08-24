import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rckdu/models/news_model.dart';
import 'package:rckdu/screens/news/single_news.dart';

class NewsWidget extends StatelessWidget {
  final NewsModel data;

  const NewsWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleNewsScreen(
              newsId: data.id ?? 0,
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(12, 0, 0, 0),
              blurRadius: 20.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: Card(
          shadowColor: const Color.fromARGB(12, 0, 0, 0),
          borderOnForeground: false,
          color: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: data.image != null
                    ? Image.network(
                        data.image.toString(),
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        color: Colors.amber,
                      ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(193, 2, 48, 1),
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                      ),
                      Html(
                        data: data.excerpt!,
                        style: {
                          "body": Style(
                            margin: Margins.zero,
                            padding: HtmlPaddings.zero,
                          ),
                          "p": Style(
                            alignment: Alignment.topLeft,
                            padding: HtmlPaddings.zero,
                            maxLines: 2,
                            fontSize: FontSize.small,
                            display: Display.block,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(74, 74, 74, 1),
                          ),
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/calendar.svg',
                            height: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            DateFormat('dd. MMMM, yyyy.', 'hr_HR')
                                .format(DateTime.parse(data.date ?? '')),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(122, 122, 122, 1),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
