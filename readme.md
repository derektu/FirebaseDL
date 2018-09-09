# Firebase DynamicLink README

Reference:

- [https://www.youtube.com/watch?v=sFPo296OQqk](https://www.youtube.com/watch?v=sFPo296OQqk)
- [https://firebase.google.com/docs/dynamic-links/](https://firebase.google.com/docs/dynamic-links/)

## Setup

- Project name: FirebaseDLDemo
- DynamicLink
    - domain: https://firebasedldemo.page.link
    - deeplink格式: "https://idv.derektu.FirebaseDLDemo/<userid>", where <userid> is a number
    - 重要參數: efr=1會直接連到appstore, 不加這個參數的話則會顯示一個
    - [範例: 連到 /1234 with apppreview](https://firebasedldemo.page.link/?link=https://idv.derektu.FirebaseDLDemo/1234&apn=idv.derektu.firebasedldemo&isi=1023598964&bi=idv.derektu.FirebaseDLDemo)
    - [範例: 連到 /5678 without apppreview](https://firebasedldemo.page.link/?link=https://idv.derektu.FirebaseDLDemo/5678&apn=idv.derektu.firebasedldemo&isi=1023598964&bi=idv.derektu.FirebaseDLDemo&efr=1)
- iOS
    - bundle id: idv.derektu.FirebaseDLDemo
    - store id: 1023598964 (目前國泰開戶的store id)
- Android
    - package name: idv.derektu.firebasedldemo

## How to build

- for iOS

```
$ cd FirebaseDLDemo
$ pod install
$ pod update ## this is very very important
$ open FirebaseDLDemo.xcworkspace
```



