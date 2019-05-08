class JudgeService

  def initialize(card1)

    chr = card1.split
    number_a = chr[0].match(/\d+/)
    number_b = chr[1].match(/\d+/)
    number_c = chr[2].match(/\d+/)
    number_d = chr[3].match(/\d+/)
    number_e = chr[4].match(/\d+/)
    @number = "#{number_a} #{number_b} #{number_c} #{number_d} #{number_e}"
    @number_x = @number.split.map!(&:to_i).sort!.reverse!


    str = card1.split
    chr_a = str[0].match(/[SHDC]/)
    chr_b = str[1].match(/[SHDC]/)
    chr_c = str[2].match(/[SHDC]/)
    chr_d = str[3].match(/[SHDC]/)
    chr_e = str[4].match(/[SHDC]/)
    chr = "#{chr_a} #{chr_b} #{chr_c} #{chr_d} #{chr_e}"
    @suit = chr.split

    @number_of_sets_a = @number_x.each_with_object(Hash.new(0)){|v,o| o[v]+=1}
    @number_of_sets_b = @number_of_sets_a.each_with_object([]) do |(key, val), arr|
      arr << val

    end

    @number_of_sets_c = @number_of_sets_b.sort.reverse

    p "@number_x"
    p @number_x
    p "@number_of_sets_a"
    p @number_of_sets_a
    p "@number_of_sets_b"
    p @number_of_sets_b
    p "@number_of_sets_c"
    p @number_of_sets_c

  end

  def birds

    character1(@suit)
    number1
    number2
    number3
    number4
    number5
    number6

    p "@straightccc"
    p @straight
    p "@flushccc"
    p @flush

     @result = ""

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

    p @result

  end


  def character1(char)

    if char[0] == char[1] && char[1] == char[2] && char[2] == char[3] && char[3] == char[4]
      @flush = true
    else
      @flush = false
    end

  end

  def number1
    if @number_of_sets_c == [3,2]
      @straight = false
    end

  end

  def number2
    if @number_of_sets_c == [3,1,1]
      @straight = false
    end
  end

  def number3
    if @number_of_sets_c == [2,2,1]
      @straight = false
    end
  end

  def number4
    if @number_of_sets_c　== [2,1,1,1]
      @straight = false
    end
  end

  def number5
    if @number_of_sets_c == [4,1]
      @straight = false
    end
  end

  def number6
    a = []
    4.times do |j|
      a.push("#{@number_x[j]- @number_x[j+1]}")
      p "a"
      p a
    end
    if a == ["1","1","1","1"]
      @straight = true
    else
      @straight = false

    end

  end

  def animal

    end

  end