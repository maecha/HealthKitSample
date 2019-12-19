# HealthKitSample

## このプロジェクトについて

HealthKitのサンプルを作成して、HealthKitを介した健康データの取得方法を確認する。<br>
また、HealthKitの大まかな世界観を理解するためのものである。<br>
まだ穴だらけなコードだけど許して。<br><br>
HealthKitを使うのでのテストは実機を推奨。<br><br>
Firebaseと連携しようとした片鱗があるけど気にしないでね（詰まってけっこう時間溶かしてしまった・・・）

## このプロジェクトで出来ること

- アプリからHealthKitの認証を行う
- アプリで取得している健康データは「歩数」と「ワークアウト」の2種類
    - 健康データの取得管理は「HealthKit.swift」で行っている
        - 「歩数」は画面に表示
        - 「ワークアウト」はログで表示
- 端末とHealthKitの連携ステータスを別のビューで表示している 

## メモ

- HealthKitの対応・非対応のハンドル
    - 端末がHealthKitに対応しているかどうか、HealthKitを許可しているかどうかをうまくハンドルする必要ある
- HealthKitからのデータをいじる際はクロージャーを介して行うことが多い（UIの更新時は注意）
- HealthKitの認証画面はアップルが用意してる物を使う。デザイン変更できない

## HealthKitで取得可能なデータ一覧

- https://qiita.com/sato-shin/items/d7a0099750a0b9eddfd1

## スクリーンショット 

![Main Screen](https://github.com/seiyamaeda/garage/blob/master/screenshots/IMG_1422.jpg "Main Screen")

![Status Screen](https://github.com/seiyamaeda/garage/blob/master/screenshots/IMG_1423.jpg "Status Screen")

![Authorization Screen](https://github.com/seiyamaeda/garage/blob/master/screenshots/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202019-12-19%20at%2015.45.50.png "Authorization Screen")
