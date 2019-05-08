class JudgeService

  def initialize(card1)

    num = card1.split
    number_0 = num[0].match(/\d+/)
    number_1 = num[1].match(/\d+/)
    number_2 = num[2].match(/\d+/)
    number_3 = num[3].match(/\d+/)
    number_4 = num[4].match(/\d+/)
    @number = "#{number_0} #{number_1} #{number_2} #{number_3} #{number_4}"
    @numbers = @number.split.map!(&:to_i).sort!.reverse!


    chr = card1.split
    chr_0 = chr[0].match(/[SHDC]/)
    chr_1 = chr[1].match(/[SHDC]/)
    chr_2 = chr[2].match(/[SHDC]/)
    chr_3 = chr[3].match(/[SHDC]/)
    chr_4 = chr[4].match(/[SHDC]/)
    chr = "#{chr_0} #{chr_1} #{chr_2} #{chr_3} #{chr_4}"
    @characters = chr.split

    number_of_sets_a = @numbers.each_with_object(Hash.new(0)) {|number, overlap| overlap[number] += 1}
    number_of_sets_b = number_of_sets_a.each_with_object([]) do |(key, val), arr|
      arr << val

    end

    @number_of_sets_c = number_of_sets_b.sort.reverse


  end

  def birds

    flush?(@characters)

    straight?

    judge

  end

  private

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
  case @result

  when "ストレートフラッシュ" then
    @straight == true && @flush == true
  when "フォー・オブ・ア・カインド" then
    @straight == false && @flush == false && @number_of_sets_c == [4, 1]
  when "フルハウス" then
    @straight == false && @flush == false && @number_of_sets_c == [3, 2]
  when "フラッシュ" then
    @straight == false && @flush == true
  when "ストレート" then
    @straight == true && @flush == false && @number_of_sets_c == [1, 1, 1, 1, 1]
  when "スリー・オブ・ア・カインド" then
    @straight == false && @flush == false && @number_of_sets_c == [3, 1, 1]
  when "ツーペア" then
    @straight == false && @flush == false && @number_of_sets_c == [2, 2, 1]
  when "ワンペア" then
    @straight == false && @flush == false && @number_of_sets_c == [2, 1, 1, 1]
  else
    "ハイカード"
  end
end
end