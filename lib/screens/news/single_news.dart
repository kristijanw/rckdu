import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rckdu/services/news.dart';

class SingleNewsScreen extends HookWidget {
  final int newsId;

  const SingleNewsScreen({
    super.key,
    required this.newsId,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final refreshToken = useState<int>(0);

    final newsFuture = useMemoized(
      () => NewsService.getNews(newsId),
      [refreshToken.value],
    );
    final news = useFuture(newsFuture);

    if (!news.hasData) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(193, 2, 48, 1),
          title: Text(
            'newsTitle'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.03,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color.fromRGBO(193, 2, 48, 1),
        title: Text(
          'newsTitle'.tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.03,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: news.data!.image != null
                  ? Image.network(
                      news.data!.image.toString(),
                      width: double.infinity,
                      height: size.height * 0.25,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: double.infinity,
                      height: size.height * 0.25,
                      color: Colors.amber,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${news.data!.title}',
                    style: const TextStyle(
                      color: Color.fromRGBO(193, 2, 48, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/calendar.svg',
                        height: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat('dd. MMMM, yyyy.', 'hr_HR').format(
                          DateTime.parse(news.data!.date ?? ''),
                        ),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(122, 122, 122, 1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Html(
                    data: news.data!.content,
                    style: {
                      "body": Style(
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                      ),
                      "p": Style(
                        alignment: Alignment.topLeft,
                        padding: HtmlPaddings.zero,
                        fontSize: FontSize.medium,
                        display: Display.block,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(74, 74, 74, 1),
                      ),
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
