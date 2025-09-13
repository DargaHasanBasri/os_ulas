/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart' as _lottie;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_back_arrow.png
  AssetGenImage get icBackArrow =>
      const AssetGenImage('assets/icons/ic_back_arrow.png');

  /// File path: assets/icons/ic_bus.png
  AssetGenImage get icBus => const AssetGenImage('assets/icons/ic_bus.png');

  /// File path: assets/icons/ic_camera.png
  AssetGenImage get icCamera =>
      const AssetGenImage('assets/icons/ic_camera.png');

  /// File path: assets/icons/ic_check_circle.png
  AssetGenImage get icCheckCircle =>
      const AssetGenImage('assets/icons/ic_check_circle.png');

  /// File path: assets/icons/ic_down_arrow.png
  AssetGenImage get icDownArrow =>
      const AssetGenImage('assets/icons/ic_down_arrow.png');

  /// File path: assets/icons/ic_down_drop_down_arrow.png
  AssetGenImage get icDownDropDownArrow =>
      const AssetGenImage('assets/icons/ic_down_drop_down_arrow.png');

  /// File path: assets/icons/ic_error.png
  AssetGenImage get icError => const AssetGenImage('assets/icons/ic_error.png');

  /// File path: assets/icons/ic_feed_back.png
  AssetGenImage get icFeedBack =>
      const AssetGenImage('assets/icons/ic_feed_back.png');

  /// File path: assets/icons/ic_filter.png
  AssetGenImage get icFilter =>
      const AssetGenImage('assets/icons/ic_filter.png');

  /// File path: assets/icons/ic_location.png
  AssetGenImage get icLocation =>
      const AssetGenImage('assets/icons/ic_location.png');

  /// File path: assets/icons/ic_lock.png
  AssetGenImage get icLock => const AssetGenImage('assets/icons/ic_lock.png');

  /// File path: assets/icons/ic_refresh.png
  AssetGenImage get icRefresh =>
      const AssetGenImage('assets/icons/ic_refresh.png');

  /// File path: assets/icons/ic_right_error_arrow.png
  AssetGenImage get icRightErrorArrow =>
      const AssetGenImage('assets/icons/ic_right_error_arrow.png');

  /// File path: assets/icons/ic_search.png
  AssetGenImage get icSearch =>
      const AssetGenImage('assets/icons/ic_search.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    icBackArrow,
    icBus,
    icCamera,
    icCheckCircle,
    icDownArrow,
    icDownDropDownArrow,
    icError,
    icFeedBack,
    icFilter,
    icLocation,
    icLock,
    icRefresh,
    icRightErrorArrow,
    icSearch,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/img_onboarding_first.png
  AssetGenImage get imgOnboardingFirst =>
      const AssetGenImage('assets/images/img_onboarding_first.png');

  /// File path: assets/images/os_ulas_app_logo.jpg
  AssetGenImage get osUlasAppLogo =>
      const AssetGenImage('assets/images/os_ulas_app_logo.jpg');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogo,
    imgOnboardingFirst,
    osUlasAppLogo,
    splashLogo,
  ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/anim_confetti.json
  LottieGenImage get animConfetti =>
      const LottieGenImage('assets/lottie/anim_confetti.json');

  /// List of all assets
  List<LottieGenImage> get values => [animConfetti];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)?
    frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
