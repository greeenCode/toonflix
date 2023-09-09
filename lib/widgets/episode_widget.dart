import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episodes_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatelessWidget {
  final WebtoonEpisodesModel episode;
  final String webtoonId;

  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  onButtonTap() async {
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
    await launchUrl(url);

    // await launchUrlString(
    //     "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(3, 3),
                color: Colors.black26,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  episode.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
