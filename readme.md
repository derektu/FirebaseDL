# Firebase DynamicLink README

Reference:

- [https://www.youtube.com/watch?v=sFPo296OQqk](https://www.youtube.com/watch?v=sFPo296OQqk)
- [https://firebase.google.com/docs/dynamic-links/](https://firebase.google.com/docs/dynamic-links/)

## Setup

- Project name: FirebaseDLDemo
- DynamicLink
    - domain: https://firebasedldemo.page.link
    - deeplink參數: "https://idv.derektu.FirebaseDLDemo/\<userid\>", where \<userid\> is a number
    - 範例1: 傳入 /1234, with apppreview
        - [https://firebasedldemo.page.link/?link=https://idv.derektu.FirebaseDLDemo/1234&apn=idv.derektu.firebasedldemo&isi=1023598964&bi=idv.derektu.FirebaseDLDemo](https://firebasedldemo.page.link/?link=https://idv.derektu.FirebaseDLDemo/1234&apn=idv.derektu.firebasedldemo&isi=1023598964&bi=idv.derektu.FirebaseDLDemo)
    - 範例2: 傳入 /5678, without apppreview, 注意多"efr=1"這個參數
        - [https://firebasedldemo.page.link/?link=https://idv.derektu.FirebaseDLDemo/5678&apn=idv.derektu.firebasedldemo&isi=1023598964&bi=idv.derektu.FirebaseDLDemo&efr=1](https://firebasedldemo.page.link/?link=https://idv.derektu.FirebaseDLDemo/5678&apn=idv.derektu.firebasedldemo&isi=1023598964&bi=idv.derektu.FirebaseDLDemo&efr=1)
- iOS
    - bundle id: idv.derektu.FirebaseDLDemo
    - store id: 1023598964 (目前國泰開戶App的store id)
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



