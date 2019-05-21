module ValidatesService
  attr_accessor :error, :card_set

  def card_size
    if @card_set.split.size == 5
      true
    else
      @error = "5つのカード指定文字を半角スペース区切りで入力してください.（例：S1 H3 D9 C13 S11）"
      false
    end
  end

  def card_combination
    key1 = [1, 2, 3, 4, 5]
    value1 = @card_set.split
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
        a.push("#{n}番目のカード指定文字が不正です。(#{@card_set.split[n - 1]})")
      end

      order_error = a.join("")
      all_order_error = "#{order_error}半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。"
      @error = all_order_error.chomp.html_safe
      false
    end
  end

  def card_overlap
    if @card_set.split.size == @card_set.split.uniq.size
      true
    else
      @error = "カードが重複しています"
      false
    end
  end

end
