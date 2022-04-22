# HealthKitSample

## このプロジェクトについて

HealthKit を介した健康データの取得方法を確認しながら、HealthKit の大まかな世界観を理解するためのもの。<br>

## このプロジェクトで出来ること

- アプリから HealthKit の認証を行う
- アプリで取得している健康データは「歩数」と「ワークアウト」の 2 種類
  - 健康データの取得管理は「HealthKit.swift」で行っている
    - 「歩数」は画面に表示
    - 「ワークアウト」はログで表示
- 端末と HealthKit 連携ステータスを別のビューで表示している

## メモ

- 公式ドキュメント
  - https://developer.apple.com/documentation/healthkit
  - 現状、日本語文献はあまり多くない
- HealthKit の対応・非対応のハンドル
  - 端末が HealthKit に対応しているかどうか、HealthKit を許可しているかどうかをうまくハンドルする必要ある
- HealthKit からのデータをいじる際はクロージャーを介して行うことが多い（UI の更新時は注意）
- HealthKit の認証画面はアップルが用意してる物を使う。デザイン変更できない

## HealthKit で取得可能なデータ一覧

- https://qiita.com/sato-shin/items/d7a0099750a0b9eddfd1

## スクリーンショット

| Main Screen                                                                                             | Status Screen                                                                                               | Authorization Screen                                                                                                      |
| ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| ![Main Screen](https://github.com/maecha/HealthKitSample/blob/master/RepoAssets/img1.jpg "Main Screen") | ![Status Screen](https://github.com/maecha/HealthKitSample/blob/master/RepoAssets/img2.jpg "Status Screen") | ![Authorization Screen](https://github.com/maecha/HealthKitSample/blob/master/RepoAssets/img3.png "Authorization Screen") |

## HealthKit 参考記事

- https://www.raywenderlich.com/459-healthkit-tutorial-with-swift-getting-started
- https://qiita.com/sato-shin/items/1fed497d2c2b8042632c
