## model

- MVVM の M
- freezed で生成したクラスを置く
- 基本的には firebase の DB で定義したモデルやその構造体の型が定義されるはず
- その他、view の表示で必要なデータ構造を型定義する
- モデル名でディレクトリを切り、その中に同名のファイルを作成する
- `flutter pub run build_runner build`で`g.dart`と`freezed.dart`を生成

