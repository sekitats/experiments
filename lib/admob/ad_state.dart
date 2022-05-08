import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  static String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : Platform.isIOS
          ? 'ca-app-pub-3940256099942544/2934735716'
          : throw UnsupportedError('Unsupported platform Web なので');

  BannerAdListener get adListener => _adListener;
  final BannerAdListener _adListener = BannerAdListener(
    onAdLoaded: (ad) => print('Ad loaded: ${ad.adUnitId}.'),
    onAdClosed: (ad) => print('Ad closed: ${ad.adUnitId}.'),
    onAdFailedToLoad: (ad, error) =>
        print('Ad failed to load: ${ad.adUnitId}, $error.'),
    onAdOpened: (ad) => print('Ad opened: ${ad.adUnitId}.'),
    // onAppEvent: (ad, name, data) =>
    //     print('App event : ${ad.adUnitId}, $name, $data'),
    // onApplicationExit: (ad) => print('App Exit: ${ad.adUnitId}.'),
    // onNativeAdClicked: (nativeAd) =>
    //     print('Native ad Clicked: ${nativeAd.adUnitId}'),
    // onNativeAdImpressoin: (nativeAd) =>
    //     print('Native ad impression: ${nativeAd.adUnitId}'),
    // onRewardedAdUserEarnedReward: (ad, reward) => print(
    //     'User rewarded: ${ad.adUnitId}, ${reward.amount} ${reward.type}.'),
  );
}
