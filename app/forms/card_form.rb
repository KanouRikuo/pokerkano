# class CardsValidator < ActiveModel::EachValidator
#   include ActiveModel::Model
#   def validate_each(cards, card, value)
#     if !(validates :cards, format: { with:/\A\w\w\w \w\w\w \w\w\w \w\w\w \w\w\w\z/ })
#       # cards.errors[:card]
#       errors.add("5つのカード指定文字を半角スペース区切りで入力してください。")
#     elsif validates :cards, format: { with:/\A[SHDC]([1-9]|1[0-3])\s[SHDC]([1-9]|1[0-3])\s[SHDC]([1-9]|1[0-3])\s[SHDC]([1-9]|1[0-3])\s[SHDC]([1-9]|1[0-3])\z/ }
#       errors.add("半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。")
#
#       elsif
#     end
#   end
#
#   def vaild1
#     if  :cards, format: { with:/\A\w\w\w \w\w\w \w\w\w \w\w\w \w\w\w\z/ })
#     end
#   end
#
#
# end

class CardForm

  include ValidatesService
  attr_accessor :cards

  def initialize(card_chr)
    @cards = card_chr
  end

end
# def get_card
#   @card2
# end
#
# def set_car = (card_chr)VV
#   @card2 = card_chr
# end










