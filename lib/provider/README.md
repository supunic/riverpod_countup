## provider

- riverpod の provider 定義ファイル
- view で使用する state の定義
- model、view でディレクトリ分け
    - model
        - model クラス を初期化して登録する
    - view
        - view で必要な state を登録する
    - それぞれ model 単位、view 単位でファイルを切っていく
    - `xxx_provider.dart`
- view_model などで provider が必要だったらディレクトリ追加していく
