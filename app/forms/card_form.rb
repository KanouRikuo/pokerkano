# class CardForm　
#
#   attr_accessor :cards
#   def initialize(card_chr)
#     @cards = card_chr
#   end
#
# end

# cardにたいしてがなんでcheck_valid_card_set、judge_strength使えんねん
#
# card_paramsコントローラーでは引数を取っているがメソッドを引数に取ることができるのか
# クラスメソッドにしている理由は何かあるのか
#
# @card_set がなんで使えるのかがわからない
# initilizeしないとattr_acessorは使えないのではないか
# @cards.push JudgeService.new(card_set: card_set)
#
# 今回は一個一個をpushしているのだが、それは通用するのか（自分としては通用しないと考えているのですが）
#
# card_setでnewしているけど何をしているのか
# 今回はentityで対処しようとしているけどそれを含めて今回とどう結びつけられるか
# 一方一番下ではクラスメソッドを使っているのはなぜか
# JudgeService.judge_strongest(@cards)
#
# entityを使う場合@result_list　はデータベースから撮ってきた奴だが今回はそれが無いから
# どうやって対処するべきか
#
# 今回ネックなのは、ベストをどこに書くかということ
# users.rbに書くとした時に、
# その上、CardFromが認識されていないのはなんでなのか
# そもそもservicesの書き方を考えるべきなのでは無いか
#
# judgeService
# の四十八行目はなんで引数のcard（なんのインスタンスでも無い）やつが
# 百二十五行目の@strengthを読んでこれるのか
#
# インスタンス変数の使い方をまだ習得できていない