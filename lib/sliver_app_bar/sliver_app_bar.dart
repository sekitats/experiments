import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliverAppBarSample extends StatefulWidget {
  const SliverAppBarSample({Key? key}) : super(key: key);

  @override
  State<SliverAppBarSample> createState() => _SliverAppBarSampleState();
}

class _SliverAppBarSampleState extends State<SliverAppBarSample> {
  double _textScale = 1.0;
  bool _isLarge = false;

  void _toggleLargeFont(bool isLarge) {
    isLarge ? _textScale = 1.2 : _textScale = 1.0;
    setState(() {
      _isLarge = isLarge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: _textScale,
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueAccent.withOpacity(0.3),
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 100,
              toolbarHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('記事カテゴリー'),
                background: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          stops: const [
                            0.5,
                            1,
                          ],
                          colors: [
                            Colors.grey.withOpacity(0),
                            Colors.black38,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // background: Container(
                // ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                '文字を大きく',
                              ),
                              Switch(
                                  value: _isLarge, onChanged: _toggleLargeFont),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text('Sept. 29 2020',
                                    style: GoogleFonts.lato()),
                              ),
                              IconButton(
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        ],
                      ),
                      const Text('記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル'),
                      const Divider(
                        height: 30,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: const NetworkImage(
                                'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                            radius: 26,
                            backgroundColor: Colors.grey[200],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [Text('山田 太郎'), Text('ITジャーナリスト')],
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text('350'),
                          const SizedBox(
                            width: 16.0,
                          ),
                          const Icon(Icons.comment, color: Colors.blueAccent),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text('25'),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        '私は場合おもにその周旋めという事の所を受けですな。もし今日を通用違いはとにかく同じ意見たたほどをさて行くでしょをは懊悩おっしゃれませつで、実際とはできるでななくっです。釣に申し上げたら事はすでに前をちょうどないたた。同時に岡田さんが吟味落語それだけ批評にしでしょ秩序漠然たる一団私か発展にという皆経過たないなたから、このほかは私か人飯にして、大森君の事に主義の私の無論ご汚辱として私手がご誘惑でしようにぼんやりお学問で述べべきでて、毫もさぞ満足としたているたので出ないた。もしくはまたはお主義の向いのはこう馬鹿としたて、その賞には見えですでという辞令にいうておきました。こんな日言葉の日その国家も私ごろをさましかと三宅さんに知れでます、expectsの当時ですというご講演ますうならが、人間の以上が陰に場合までの個人を十月聴こけれどもいるて、それほどの今に描いからこうした中をどうもしましなと行かましのないと、ないたたて全くご個人できるだ訳たなけれた。つまり通りか無事か尊重が流れるなつつ、今ごろ力をしばいるない上を肝不足の場合で見たなけれ。時間でももちろんいうがつけよたますないなけれて、どうも勢い作るば話はまだなかっですものた。しかもご学習が食っからもいならはずんて、下働きでは、さぞこれか愛するからあっせよですた知れせないですと下げて、支はもつからしまいたくっます。いよいよしかるにさえ同時にウォーズウォースというくれますて、そこをも生涯上かも私のお病気はないししまうんまし。私もそのうち発展の事がご記憶はしていでたくますありと、五一の自我にこう重んずるましという諷刺たて、しかしその人の自力をしがらて、だれかを私の名に養成にしていうのたなと反抗云いて批評充たす来ますあっ。教師にそこで大森さんにあるいは一応あるたものなかっでない。岡田さんははっきりろを申し上げて知れでものならずです。（また人で倒さためですなけれたてなかっはいうだなて、）それほど立てるでモーニングに、ジクソンの相場でもするて投げといった、自我の変化も昔の中でもし生きのにありでが説明院しけれどもいれずについてご評語たものなけれ。',
                      )
                    ],
                  ),
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
