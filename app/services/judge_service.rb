class JudgeService
  include ValidatesService
  # attr_accessor :card, :hand, :best, :number, :msg
  POKER_HAND = ["ハイカード", "ワンペア", "ツーペア", "スリー・オブ・ア・カインド",
                "ストレート", "フラッシュ", "フルハウス", "フォー・オブ・ア・カインド", "ストレートフラッシュ"]

  attr_accessor :card, :best, :strength, :hand, :result, :card_set

  def initialize(card_set)
    @card_set = card_set
  end

    def birds

      card = @card_set.split
      number_0 = card[0].match(/\d+/)
      number_1 = card[1].match(/\d+/)
      number_2 = card[2].match(/\d+/)
      number_3 = card[3].match(/\d+/)
      number_4 = card[4].match(/\d+/)
      @number = "#{number_0} #{number_1} #{number_2} #{number_3} #{number_4}"
      @numbers = @number.split.map!(&:to_i).sort!.reverse!

      number_of_sets_a = @numbers.each_with_object(Hash.new(0)) {|number, overlap| overlap[number] += 1}
      number_of_sets_b = number_of_sets_a.each_with_object([]) do |(key, val), arr|
        arr << val
      end
      @number_of_sets_c = number_of_sets_b.sort.reverse

      chr_0 = card[0].match(/[SHDC]/)
      chr_1 = card[1].match(/[SHDC]/)
      chr_2 = card[2].match(/[SHDC]/)
      chr_3 = card[3].match(/[SHDC]/)
      chr_4 = card[4].match(/[SHDC]/)
      @character = "#{chr_0} #{chr_1} #{chr_2} #{chr_3} #{chr_4}"
      @characters = @character.split

      flush?(@characters)
      straight?
      judge

    end

    def judge_score()
      @strength = POKER_HAND.index(@result)
    end

    def judge_strength
      birds
      judge_score
    end


  def flush?(char)

    if char[0] == char[1] && char[1] == char[2] && char[2] == char[3] && char[3] == char[4]
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
      @result = "ストレートフラッシュ"


    elsif @straight == false && @flush == false && @number_of_sets_c == [4, 1]
      @result = "フォー・オブ・ア・カインド"


    elsif @straight == false && @flush == false && @number_of_sets_c == [3, 2]
      @result = "フルハウス"


    elsif @straight == false && @flush == true
      @result = "フラッシュ"


    elsif @straight == true && @flush == false && @number_of_sets_c == [1, 1, 1, 1, 1]
      @result = "ストレート"


    elsif @straight == false && @flush == false && @number_of_sets_c == [3, 1, 1]
      @result = "スリー・オブ・ア・カインド"


    elsif @straight == false && @flush == false && @number_of_sets_c == [2, 2, 1]
      @result = "ツーペア"


    elsif @straight == false && @flush == false && @number_of_sets_c == [2, 1, 1, 1]
      @result = "ワンペア"

    else
      @result = "ハイカード"
    end
  end


  class << self
      # def judge_strongest(cards)
      #   judge_best(cards)
      # end

      # private
      def judge_best(cards)
        scores = []

        cards.each do |card|
          scores.push card.strength
        end

        high_score =  scores.max

        cards.each do |card|
          if card.strength == high_score
            card.best = true
          else
            card.best = false
          end

        end

      end
    end










  #   case @result
  # when "ストレートフラッシュ" then
  #   @straight == true && @flush == true
  #   p @result
  # when "フォー・オブ・ア・カインド" then
  #   @straight == false && @flush == false && @number_of_sets_c == [4, 1]
  # when "フルハウス" then
  #   @straight == false && @flush == false && @number_of_sets_c == [3, 2]
  # when "フラッシュ" then
  #   @straight == false && @flush == true
  # when "ストレート" then
  #   @straight == true && @flush == false && @number_of_sets_c == [1, 1, 1, 1, 1]
  # when "スリー・オブ・ア・カインド" then
  #   @straight == false && @flush == false && @number_of_sets_c == [3, 1, 1]
  # when "ツーペア" then
  #   @straight == false && @flush == false && @number_of_sets_c == [2, 2, 1]
  # when "ワンペア" then
  #   @straight == false && @flush == false && @number_of_sets_c == [2, 1, 1, 1]
  # else
  #   "ハイカード"
  #   p @result
  # end

  end



