class Environments {
  static const String PRODUCTION = 'prod';
  static const String QAS = 'QAS';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.PRODUCTION;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': 'http://192.168.100.21:9003',
    },
    {
      'env': Environments.DEV,
      'url': 'http://68.183.188.213:8009',
    },
    {
      'env': Environments.QAS,
      'url': 'http://68.183.188.213:8009',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://pokeapi.co/api/v2',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}

enum ViewState { Idle, Busy }

enum FontType {
  bigTitleBold1,
  bigTitleBold2,
  bigTitle1,
  bigTitle2,
  bigTitleOp1,
  bigTitleOp2,
  bigTitle,
  bigTitleBold,
  bigTitleOp,
  titleBold,
  title,
  titleOp,
  smallTitleBold,
  smallTitle,
  smallTitleOp,
  subtitleBold,
  subtitle,
  subtitleOp,
  bodyBold,
  body,
  bodyOp,
  captionBold,
  caption,
  captionOp,
}

enum TitleName {
  login,
  role,
  home,
  scan,
  account,
}

enum ButtonType {
  solidWithIcon,
  outlineWithIcon,
  solidWithText,
  outlineWithText,
  solidWithTextAndIcon,
  outlineWithTextAndIcon,
  solidWithIconAndText,
  outlineWithIconAndText,
}

enum TextAlignment {
  start,
  end,
  center,
}

enum ResponsiveUI {
  mobile,
  tablet,
  desktop,
}

enum IsActive {
  active,
  inactive,
}
