class PostsController < ApplicationController

  include ValidatesService

  def index
    # @content1 = CardForm.new(params[:card])
    # p "@content1.cards"
    # p @content1.cards
    # p "@content1"
    # p @content1
    #
    # if valid1(@content1.cards) && valid2(@content1.cards) && valid3(@content1.cards)
    #   @content2 = JudgeService.new(@content1.cards)
    #   flash.now[:notice] = "#{@content2.birds}"
    #   # redirect_to :action => "index"
    #   render "index"
    # else
    #   render "index"
    # end
    end

  def complete

    @content1 = CardForm.new(params[:card])
    p "@content1.cards"
    p @content1.cards
    p "@content1"
    p @content1

    if valid1(@content1.cards) && valid2(@content1.cards) && valid3(@content1.cards)
      @content2 = JudgeService.new(@content1.cards)
      flash.now[:notice] = "#{@content2.birds}"
      # redirect_to :action => "index"
      render "index"
    else
      render "index"
    end


  end
end



# 質問
# １。@content.birdsのbirdsはメソッドの名前を表すけど
# @errorは上のままでいいのか
# ２。なんで@content2.birdsは書かないといけないのか

# class Judge
#
#   include Mod1,Mod2,Mod3,Mod4,Mod5,Mod6,Mod7
#
#   @number = @cards.match(/\d+/).split
#   @suit = @cards.match(/SHDC/).split
#   @number_of_sets = @number.each_with_object(Hash.new(0)){|v,o| o[v]+=1}
#
#
#   def birds
#     if @straight = true && @flush = true
#       puts "ストレートフラッシュ"
#
#       elseif @straight = false && @flush = false && @number_of_sets = [4, 1]
#       puts "フォー・オブ・ア・カインド"
#
#       elseif @straight = false && @flush = false && @number_of_sets = [3, 2]
#       puts "フルハウス"
#
#       elseif @straight = false && @flush = true
#       puts "フラッシュ"
#
#       elseif @straight = true && @flush = false
#       puts "ストレート"
#
#       elseif @straight = false && @flush = false && @number_of_sets = [3, 1, 1]
#       puts "スリー・オブ・ア・カインド"
#
#       elseif @straight = false && @flush = false && @number_of_sets = [2, 2, 1]
#       puts "ツーペア"
#
#       elseif @straight = false && @flush = false && @number_of_sets = [2, 1, 1, 1]
#       puts "ワンペア"
#
#     else
#       puts "ハイカード"
#     end


#
#   end
# end
#
# module Mod1
#   def character1(number)
#     if number[1] == number[2] && number[2]== number[3] && number[3]== number[4] && number[4]== number[5]
#       return true
#     else
#       return false
#     end
#
#   end
# end
#
#
#
# module Mod3
#   def number1
#     if @number_of_sets = [3,2]
#       @straight = false
#     end
#
#   end
# end
#
# module Mod4
#   def number2
#     if @number_of_sets = [3,1,1]
#       @straight = false
#     end
#   end
# end
#
# module Mod5
#   def number3
#     if @number_of_sets = [2,2,1]
#       @straight = false
#     end
#   end
# end
#
# module Mod6
#   def number4
#     if @number_of_sets = [2,1,1,1]
#       @straight = false
#     end
#   end
# end
#
# module Mod7
#   def number5
#     if @number_of_sets = [4,1]
#       @straight = false
#     end
#   end
# end
# module Mod8
#   def number6
#     if @number_of_sets = [1,1,1,1,1] && number
#       @straight = true
#     end
#   end
# end
#
