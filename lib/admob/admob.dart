import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_state.dart';

class Admob extends StatefulWidget {
  const Admob({Key? key}) : super(key: key);

  @override
  State<Admob> createState() => _AdmobState();
}

class _AdmobState extends State<Admob> {
  late BannerAd _ad;

  bool _isAdLoaded = false;

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  @override
  void initState() {
    super.initState();

    // final adState = Provider.of<AdState>(context, listen: false);
    _ad = BannerAd(
      adUnitId: AdState.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget _banner = _isAdLoaded && _ad != null
    //     ? SizedBox(height: 50)
    //     : Container(height: 50, child: AdWidget(ad: _ad));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admob Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_isAdLoaded)
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: _ad.size.width.toDouble(),
                  height: _ad.size.height.toDouble(),
                  child: AdWidget(ad: _ad),
                ),
              ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
