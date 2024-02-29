import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internationalization_flutter/app_locale.dart';
import 'package:internationalization_flutter/flavor_config.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;
  BannerConfig? bannerConfig;

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<AppLocale>(context);
    bannerConfig ??= _getDefaultBanner();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body:Stack(
        children: [
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(FlavorConfig.instance.name,style: TextStyle(color: Colors.cyanAccent,fontSize: 24),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('English'),
                  CupertinoSwitch(
                    onChanged: (bool value) {
                      value == true ? language.changeLocale(Locale('ar')) : language.changeLocale(Locale('en'));
                    },
                    value: language.locale == Locale('en') ? false : true,
                  ),
                  Text('Arabic'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!.helloWorld),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Override the locale to [es]',
                ),
              ),
              // Used when a section of app needs to be localized to different locale than that of device
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Localizations.override(
                  context: context,
                  locale: const Locale('es'),
                  // Using a Builder here to get the correct BuildContext.
                  child: Builder(
                    builder: (BuildContext buildContext){
                      return Text(AppLocalizations.of(buildContext)!.helloWorld);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Message with Parameter(s)',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    AppLocalizations.of(context)!.hello('Flutter'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.amountBalance(120000000),
                ),
              ),
            ],
          ),
        ),
          FlavorConfig.isProduction()?Container():_buildBanner(context)
        ]
      )
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance.name,
        bannerColor: FlavorConfig.instance.color
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: bannerConfig!.bannerName,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig!.bannerColor
        ),
      ),
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;
  BannerConfig({
    required String this.bannerName,
    required Color this.bannerColor});
}