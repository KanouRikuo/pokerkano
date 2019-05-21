class PostsController < ApplicationController

  include ValidatesService

  def index

  end

  def complete
# 元々はCardFormでインスタンスを作ってそれを代入していたが、わかりやすいようにしていただけでそれをする必要がなかったので削除した。# @card1 = CardForm.new(params[:card])
    card = JudgeService.new(params[:card])
    if card.card_size && card.card_combination && card.card_overlap
      flash.now[:notice] = "#{card.role_judgment}"
      render "index"
    else
      flash.now[:notice] = "#{card.error}"
      render "index"
    end

  end

end