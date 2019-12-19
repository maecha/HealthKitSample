# HealthKitSample

## このプロジェクトについて

HealthKitのサンプルを作成して、HealthKitを介した健康データの取得方法を確認する。<br>
また、HealthKitの大まかな世界観を理解するためのものである。<br>
まだ穴だらけなコードだけど許してね。<br>
Firebaseと連携しようとした片鱗があるけど気にしないでね。

## このプロジェクトで出来ること

- アプリからHealthKitの認証を行う
- アプリで取得している健康データは「歩数」と「ワークアウト」の2種類
    - 健康データの取得管理は「HealthKit.swift」で行っている
        - 「歩数」は画面に表示
        - 「ワークアウト」はログで表示
- 端末とHealthKitの連携ステータスを別のビューで表示している 
- 

## HealthKitで取得可能なデータ一覧

- https://qiita.com/sato-shin/items/d7a0099750a0b9eddfd1

## スクリーンショット 

![Main Screen](https://github.com/seiyamaeda/garage/blob/master/screenshots/IMG_1422.jpg "Main Screen")

![Status Screen](https://github.com/seiyamaeda/garage/blob/master/screenshots/IMG_1423.jpg "Status Screen")
