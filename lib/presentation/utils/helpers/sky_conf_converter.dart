/// 空の信頼度を自然言語のメッセージに変換するヘルパークラス
class SkyConfConverter {
  static String convertToMessage(int confidence) {
    if (confidence >= 70) {
      return 'この写真には空に似た物体が写っているようです。もう少し広い空を撮影してみてください。';
    } else if (confidence >= 55) {
      return 'この写真にはあまり空が写っていないようです。空がより多く写るように撮影してみてください。';
    } else if (confidence >= 40) {
      return 'この写真には空がほぼ写っていないみたいです。ぜひ、空を撮ってみましょう！';
    } else if (confidence >= 25) {
      return 'この写真には空がほとんど写っていません。空を撮影する際は、カメラを上に向けてみてください。';
    } else {
      return 'この写真には空が写っていないようです。空の写真を撮影してください。';
    }
  }
}
