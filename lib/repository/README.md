## repository

- 外部サービスとの連携用
- データの取得 → repository、データの定義 → model のイメージ
- Firebase を使用する場合、ここに Firebase からのデータ取得のロジックを書く
- その他、google map api など、外部との連携で必要となるロジックを書く
- 基本は model 単位でファイルを切りそう
    - api: `xxx_client.dart`
    - firebase: `xxx_repository.dart`
