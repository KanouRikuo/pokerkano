class JudgeService
  include ValidatesService

  POKER_HAND = ["ハイカード", "ワンペア", "ツーペア", "スリー・オブ・ア・カインド",
                "ストレート", "フラッシュ", "フルハウス", "フォー・オブ・ア・カインド", "ストレートフラッシュ"]

  attr_accessor :card, :best, :strength, :hand, :result, :card_set

  def initialize(card_set)
    @card_set = card_set
  end

  def role_judgment

    # @numbersは、正規表現によって正しい数値を取り出した変数
    cards = @card_set.split
    numbers = []
    cards.each do |card|
      num = card.match(/\d+/)
      numbers << num[0].to_i
    end
    @numbers = numbers.sort!.reverse!

    # number_of_sets_aはハッシュの形で重なる回数を取り出す
    number_of_sets_a = @numbers.each_with_object(Hash.new(0)) {|number, overlap| overlap[number] += 1}

    # number_of_sets_bは配列の形で回数を取り出す
    number_of_sets_b = number_of_sets_a.each_with_object([]) do |(key, val), arr|
      arr << val
    end

    # number_of_sets_cは配列の形で回数をjudgeメソッドで判定のために順番に並べる
    @number_of_sets_c = number_of_sets_b.sort.reverse

    # @charactersは正規表現によって正しい文字を取り出した変数
    cards = @card_set.split
    character = []
    cards.each do |a_card|
      chr = a_card.match(/[SHDC]/)
      character << chr[0]
    end
    @characters = character

    flush?
    straight?
    judge

  end

  def judge_score
    @strength = POKER_HAND.index(@result)
  end

  def judge_strength
    role_judgment
    judge_score
  end


  def flush?

    if @characters[0] == @characters[1] && @characters[1] == @characters[2] && @characters[2] == @characters[3] && @characters[3] == @characters[4]
      @flush = true
    else
      @flush = false
    end

  end

  def straight?

    a = []
    4.times do |j|
      a.push("#{@numbers[j] - @numbers[j + 1]}")
    end
    if a == ["1", "1", "1", "1"]
      @straight = true
    else
      @straight = false
    end

  end

  def judge

    if @straight == true && @flush == true
      @result = POKER_HAND[8]
    elsif @straight == false && @flush == false && @number_of_sets_c == [4, 1]
      @result = POKER_HAND[7]
    elsif @straight == false && @flush == false && @number_of_sets_c == [3, 2]
      @result = POKER_HAND[6]
    elsif @straight == false && @flush == true
      @result = POKER_HAND[5]
    elsif @straight == true && @flush == false && @number_of_sets_c == [1, 1, 1, 1, 1]
      p @flush
      @result = POKER_HAND[4]
    elsif @straight == false && @flush == false && @number_of_sets_c == [3, 1, 1]
      @result = POKER_HAND[3]
    elsif @straight == false && @flush == false && @number_of_sets_c == [2, 2, 1]
      @result = POKER_HAND[2]
    elsif @straight == false && @flush == false && @number_of_sets_c == [2, 1, 1, 1]
      @result = POKER_HAND[1]
    else
      @result = POKER_HAND[0]
    end
  end

  def self.judge_best(cards)
    scores = []
    cards.each do |card|
      scores.push card.strength
    end
    high_score = scores.max
    cards.each do |card|
      if card.strength == high_score
        card.best = true
      else
        card.best = false
      end
    end
  end
end
