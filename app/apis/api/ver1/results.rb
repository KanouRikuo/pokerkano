# 各APIの実体を作成します。

module API
  module Ver1
    class Results < Grape::API

      include ValidatesService

      resources :cards do
        desc '成功する時"result"を返す、失敗した時に"error"を返す'
        # requires(*attrs, &block)
        # 入力必須とするパラメータと入力チェックを行うパラメータを指定する。

        params do
          requires :cards, type: Array[String]
        end

        post '/check' do
          # 配列handsを定義しparamsを代入して(type: Array(String))、配列cardsの長さ分役判定・強さ判定を実施する
          hands = params[:cards]
          @result_list = []
          hands.each do |card_set|
            card = JudgeService.new(card_set)
            if card.card_size && card.card_combination && card.card_overlap
              card.judge_strength
            else
              card.error
              card.strength = -1
            end
            @result_list.push card
          end

          # 配列cardsの中で最も強い役の手札にbest: trueをつける
          JudgeService.judge_best(@result_list)

          card_valid = []
          card_invalid = []
          result = {}

          @result_list.each do |card|
            hash_valid = {}
            hash_invalid = {}

            if card.card_size && card.card_combination && card.card_overlap
              hash_valid.store("card_set",card.card_set)
              hash_valid.store("result",card.result)
              hash_valid.store("best",card.best)
              card_valid << hash_valid
            else
              hash_invalid.store("card_set",card.card_set)
              hash_invalid.store("error",card.error)
              card_invalid << hash_invalid
            end

          end

          result.store("result", card_valid) unless card_valid == []
          result.store("error", card_invalid) unless card_invalid == []
          result

        end
      end
    end
  end
end
