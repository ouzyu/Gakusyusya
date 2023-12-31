# がくしゅうしゃ
![title_image_for_github](https://github.com/ouzyu/Gakusyusya/assets/129580397/6eb1b213-0a74-4a72-bd67-285d7cd1f284)
サイトURL:https://gakusyusya.com/ (働き始め更新できない為、停止しています)
## サイト概要
### サイトテーマ
キャラクターのアニメーションを用いて、子供たちが楽しく勉強出来る事を目的とした、学習時間の記録と管理を行うサイトです。

### テーマを選んだ理由
学童保育の支援員として働いていた際に児童たちの宿題を指導していたのですが、
褒めてもらうなどして、自信がつかないと宿題の出来ない子たちや、つまらないと投げ出してしまう子たちが何人かいました。
私はそんな子供たちの為に、楽しみながら学習を進められるようなサービスを作りたいと考えました。
そして、自らが積み上げた学習の記録を振り返る事で、自信をつけつつ学ぶことの楽しさも知って貰えたらと思い、がくしゅうしゃを作成しました。

### ターゲットユーザ
- 宿題や学習に苦手意識をもつ小学校1年生から3年生程の児童
- 子供の学習方法に工夫を施したい保護者の方

### 主な利用シーン
- 宿題を行う際のタイムキーパーやモチベーション維持
- 学習の記録を数値化し、実績として振り返る時

## 設計書
- ER図
![Gakusyusya_er_graph drawio](https://github.com/ouzyu/Gakusyusya/assets/129580397/e896f912-cd33-4f20-a0b4-f014a4de7a62)
- 管理者側UIフロー
![Gakusyusya_Admin_UIフロー drawio](https://github.com/ouzyu/Gakusyusya/assets/129580397/ab6110c6-4982-47cc-828e-ccbbde13d83a)
- ユーザー側UIフロー
![Gakusyusya_User_UIフロー drawio](https://github.com/ouzyu/Gakusyusya/assets/129580397/b8d03713-6bee-4765-baa7-52e8dbf33f82)

- [ワイヤーフレーム(閲覧にはFigmaアカウントが必要です)](https://www.figma.com/file/wmUrhU66a6K21xuso6iyvb/Gakusyusya_wireframe?type=design&node-id=19%3A7&mode=design&t=dcEuRNoMayndmceK-1)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1j0O0XZ-fZttLLpBUQvT6pn8Jo8ZmGXgYNXGtYQ37TJI/edit?usp=sharing)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/14rNsCNkWDJqcEqb43ymJtHAwY94dvT5eDOl0NgDopIg/edit?usp=sharing)
- [テスト仕様書](https://docs.google.com/spreadsheets/d/1AeBx2qTEoZ3EpG8P17JaH5_3Afv23vZJ/edit?usp=sharing&ouid=114789396950183428579&rtpof=true&sd=true)
- [WBS](https://docs.google.com/spreadsheets/d/13xHDjOi6o5Bwp1dwTuyY8KJmIZlT4b7MCKG3yg7knvs/edit?usp=sharing)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- アニメーション、グラフィックは全て自作となります。

## 試用してみる
ゲストログイン機能を実装しており、ユーザー情報の変更以外は全て試用することが出来ます。

※クローンを行う際は管理者側でActorやMapを用意しなければUser側は正常に動作しません。seed.rbファイルを用意している為、クローン後にそちらをご利用ください。

[管理者サインインページ](https://gakusyusya.com/admins/sign_in)

パスとemailは、rails db:seed後に下記を入力してください。
- email: mail@1
- pass: 123456

同様に、User側にもゲスト以外でアカウントを用意してあります。併せてご確認ください。
- email: mail@1
- pass: 123456