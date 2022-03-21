## repository

- 外部サービスとの連携用
- データの取得 → repository、データの定義 → model のイメージ
- Firebase を使用する場合、ここに Firebase からのデータ取得のロジックを書く
- その他、google map api など、外部との連携で必要となるロジックを書く
- model 単位でファイルを切っていく
    - `xxx_repository.dart`