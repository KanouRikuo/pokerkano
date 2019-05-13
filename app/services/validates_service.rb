module ValidatesService

  def valid1(card)
    if card.split.size == 5
      true
    else
      @error = "5つのカード指定文字を半角スペース区切りで入力してください.（例：S1 H3 D9 C13 S11）"
      false
    end
  end

  def valid2(card)
    key1 = [1, 2, 3, 4, 5]
    value1 = card.split
    array = [key1, value1].transpose
    h = Hash[*array.flatten]
    numbers = h.inject([]) do |arr, (key, val)|
      arr << key unless val =~ /\A[SHDC]([1-9]|1[0-3])\z/
      arr
    end

    if numbers == []
      true
    else
      a = []
      numbers.each do |n|
        a.push("#{n}番目のカード指定文字が不正です。(#{card.split[n - 1]})")
      end

      error1 = a.join("")
      error2 = "#{error1}半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。"
      @error = error2.chomp.html_safe

      false
    end
  end

  def valid3(card)
    if card.split.size == card.split.uniq.size
      true
    else
      @error = "カードが重複しています"

      false
    end
  end

end
