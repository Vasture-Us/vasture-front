<div style="text-align:center;">
    <img src="readme_assets/vasture-cover.png" width=600>
</div>

<br>

<div style="text-align:center;">

![badge](https://img.shields.io/badge/language-Dart@3.35.7-blue?logo=dart)
![badge](https://img.shields.io/badge/framework-Flutter-blue?logo=flutter)
![badge](https://img.shields.io/badge/DB,Storage-Supabase-lightgreen?logo=supabase)
</div>


<br>

## 😎 About Vasture
Vastureは「あなたの空と世界の空をつなげるSNSアプリ」です。

空の写真を撮ると、その日世界の誰かが撮ったもう一枚の「空」を見ることができ、**広大な空**を通じて**ちょっとしたつながり**を感じることができます。



<div style="text-align:center;">
    <img src="readme_assets/vasture-top.png" width=600>
</div>

<br>

## 🐊 Features
- **空を撮ると、その日世界で撮られた「違う空」を見つける機能**
    - ユーザーの撮った写真が即座に空かどうかを[自作AIモデル](https://github.com/Vasture-Us/vasture-back)で判別し、空以外であれば受け付けません
- **空の写真を天気と共に集め、保存する機能**
    - 何気なく撮ったあの空の情景を残すことで、その日の思い出や感情が雲のように湧き出てきます
- **ウェザーニューズ様のAPIを使用し、天気予報を表示する機能**
    - 天気によって画面の上部にあるシェイプの色が変わる仕様です

<br>

## 🍕 Reason
現在、私は15年間住んでいた、地元沖縄を離れ東京で1人で暮らしています。

ふと道端を歩いていて、空を見上げると孤独だったり寂しさが消え、**世界の広さやつながる感覚**をより多くの女性に届けたいと思い、開発しました。

<br>

### 📚 Folder Structure
コードがスパゲッティになってしまいがちなので、クリーンアーキテクチャで構成しました。UIとロジックを分離しています。

```python
└── 📁lib
    └── 📁core # アプリ内全体で使う定数やエラーの定義
        └── 📁config
        └── 📁constants
        └── 📁error
    └── 📁data
        └── 📁datasources # クライアントの実装関数 (repositoriesから呼び出される)
            └── 📁local
            └── 📁remote
        └── 📁models
        └── 📁repositories # domain層で定義したrepositoryの実装
    └── 📁domain
        └── 📁entities
        └── 📁repositories # 骨組みとなるrepository
        └── 📁usecases
    └── 📁presentation # UI周りを実装するプレゼン層
        └── 📁components
        └── 📁providers
        └── 📁screens
        └── 📁services
        └── 📁utils
            └── 📁helpers
            └── 📁routes
            └── 📁state
            └── 📁theme
    └── main.dart
```

<br>


### 🥞 Thank you so much for reading!