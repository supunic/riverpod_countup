## service

- ビジネスロジックの記述
- 基本 model 単位
    - freezed で model にするほど構造が複雑でないが、ロジックが必要なものなど
- model インスタンスのメソッドを定義する
- repository で取得したデータを model で定義したデータの構造体に詰め替える処理なども
    - [wip]何か bind 用のライブラリがあればそれを使いたい
- static メソッドのみの service は控える
