# flutter_app_study

学习flutter

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


常用命令：
flutter doctor //检测flutter运行环境

flutter run //运行

flutter build ios --release //iOS打包 -lstdc++

flutter build apk //安卓打包

flutter clean //清理工程 

flutter pub cache clean //删除所有缓存的包以获取更多可用磁盘空间或解决某些问题

flutter pub update //更新应用的库
flutter pub get //安装应用的库


//打包
flutter build apk
//打google play上架的aab包
flutter build appbundle

//打制定 arm arm64的包
flutter build apk --target-platform android-arm,android-arm64