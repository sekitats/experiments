import 'package:flutter/material.dart';

import 'dio_client.dart';
import 'models/news.dart';

class DioSample extends StatefulWidget {
  const DioSample({Key? key}) : super(key: key);

  @override
  _DioSampleState createState() => _DioSampleState();
}

class _DioSampleState extends State<DioSample> {
  late DioClient dioClient;
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    dioClient = DioClient();
    articles = dioClient.fetchNewsArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Discover',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Find interesting article and news',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<Article>>(
                  future: articles,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].title ?? ''),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
