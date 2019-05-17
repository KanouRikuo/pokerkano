module API
  module Ver1
    class Users < Grape::API

      include ValidatesService

      resources :cards do
        desc '成功する時"result"を返す、失敗した時に"error"を返す'
        params do
          requires :cards, type: Array[String]
          # requires :result_list, type: Array[String]
        end
        post '/check' do

          # 配列handsを定義しparamsを代入する(type: Array(String))
          hands = params[:cards]

          @result_list = []
          # @result_list1 = []
          hands.each do |card_set|
            # p card_set

             @result_list.push JudgeService.new(card_set)
             # @result_list1.push JudgeService.new(card_set)
          end


          # 配列cardsの長さ分役判定・強さ判定を実施する
          @result_list.each do |card|
            if card.valid1 && card.valid2 && card.valid3
              card.judge_strength
            else
              card.error
              card.strength = -1
            end
          end

          # p "@result_list"
          # p @result_list
          # p "@result_list1"
          # p @result_list1

          cards = []
          # # 配列cardsの中で最も強い役の手札にbest: trueをつける
          JudgeService.judge_best(@result_list)
          # p @result_list[2].error
          #

          #
          #   p "@result_list"
          # # @result_list[1].card_set
          @result_list.each do |card|
            hash = {}
            hash1 = {}
            if card.valid1 && card.valid2 && card.valid3
              hash1.store("card_set",card.card_set)
              hash1.store("result",card.result)
              hash1.store("best",card.best)
              hash.store("cards", hash1)
            else
              hash1.store("card_set",card.card_set)
              hash1.store("error",card.error)
              hash.store("error", hash1)
            end
            cards << hash
          end
          # Hash[*cards]
          # # Hash[]
          cards
          # end
          # @result_list
          # p @result_list

            # p result_list1.to_a

          # p @result_list.best
# p JudgeService.judge_strongest(@result_list)
#           if card.valid1 && card.valid2 && card.valid3
#             @result_list[:card_set, :result, :best]
#             present @result_list, with: Ver1::Entities::UsersEntity
          # else Entities::V1::UserEntity
          #   @result_list[:card_set, :result, :best]
          # end
        end
      end
    end
  end
end


# hand1 = hands.split
# result = []
# hash = {}
# strength = []

          #
          #
          #
          # @result_list = []
          # hands.each do |card_set|
          #   card2 = CardForm.new(card_set)
          #
          #   if valid1(card2.cards) && valid2(card2.cards) && valid3(card2.cards)
          #     card3 = JudgeService.new(card2.cards)
          #     card3.hand = card3.birds
          #     card3.card = card2.cards
          #
          #     case card3.hand
          #     when "ストレートフラッシュ"
          #       card3.number = 9
          #     when "フォー・オブ・ア・カインド"
          #       card3.number = 8
          #     when "フルハウス"
          #       card3.number = 7
          #     when "フラッシュ"
          #       card3.number = 6
          #     when "ストレート"
          #       card3.number = 5
          #     when "スリー・オブ・ア・カインド"
          #       card3.number = 4
          #     when "ツーペア"
          #       card3.number = 3
          #     when "ワンペア"
          #       card3.number = 2
          #     else "ハイカード"
          #       card3.number = 1
          #     end
          #
          #     @result_list << card3.card
          #     @result_list << card3.hand
          #     strength << card3.number
          #
          #   # @result_list = @cards
          #     card3 = JudgeService.new(card2.cards)
          #     card3.msg = @error
          #     @result_list << card3.msg
          #     # end
          #
          #   end
          #   end
          #
          # strength.each_with_index{|val,index| hash[index] = val}
          #
          #
          # hands.each do |card_set|
          #   card2 = CardForm.new(card_set)
          #   card3 = JudgeService.new(card2.cards)
          #   hash.each {|key, value|
          #
          #     if strength.max == value
          #       card3.best = true
          #     else
          #       card3.best = false
          #     end
          #
          #     @result_list << card3.best
          #   }
          # end
          #

          #
          # strength.max
          # hands1.count

#
# {
#     "result": [
#         {
#             "card": "H1 H13 H12 H11 H10",
#             "hand": "ストレートフラッシュ",
#             "best": true
#         },
#         {
#             "card": "H9 C9 S9 H2 C2",
#             "hand": "フルハウス",
#             "best": false
#         }
#     ],
#
#     "error": [
#         {
#             "card": "C13 D12 C11 8 H7",
#             "msg": "4番目のカード指定文字が不正です。 (8)"
#         }
#