module ValidatesService

  def valid1(card)
    if card.split.size == 5
      true
    else
      @error = "5つのカード指定文字を半角スペース区切りで入力してください.（例：S1 H3 D9 C13 S11）"
      flash.now[:notice] = "#{@error}"
      false
    end
  end

  def valid2(cards)
    key1 = [1,2,3,4,5]
    value1 = cards.split
    array = [key1, value1].transpose
    h = Hash[*array.flatten]
    numbers = h.inject([]) do |arr , (key , val)|
      arr << key unless val =~  /\A[SHDC]([1-9]|1[0-3])\z/
      arr
      p "arr"
      p arr
    end
    p "numbers"
    p numbers.sort
    if numbers == []
      true
    else
      a = []
      numbers.each do |n|
        a.push("#{n}番目のカード指定文字が不正です。(#{@content1.cards.split[n-1]})")
      end

      error1 = a.join("<br>")
      @error2 = "#{error1}<br>半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。"

      flash.now[:notice]=@error2.chomp.html_safe
      false
    end
  end
    # cards.split.each_with_index {|card,i|
    #   if card =~  /\A[SHDC]([1-9]|1[0-3])\z/
    #     p "cards[i]"
    #     p "#{card}"
    #     p "#{i}"
    #     true
    #   else
    #     @error = "半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。#{i+1}番目のカード指定文字が不正です。(#{card})"
    #     p "cards[uuu]"
    #     p "#{card}"
    #     p "#{i}"
    #     p "@error"
    #     flash.now[:notice] = "#{@error}"
    #     render "complete"
    #     false
    #   end }

      # numbers.each {|a|
      #   @error = []
      # @errors = "半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。#{a}番目のカード指定文字が不正です。"
      # error << @errors
      # p"@error"
      # p error
      # flash.now[:notice] = "#{@errors}"
      #
      # }



    # if ------
    #
    # true
    # else
    #   @error = "半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。#{i+1}番目のカード指定文字が不正です。(#{card})"
    #   flash.now[:notice] = "#{@error}"
    #   false
    # end


    # i = 0
    # cards.split.each do |card|
    # i += 1
    # if card =~  /\A[SHDC]([1-9]|1[0-3])\z/
    #   true
    # else
    #   @error = "半角英字大文字のスート（S,H,D,C）と数字（1〜13）の組み合わせでカードを指定してください。#{i+1}番目のカード指定文字が不正です。(#{card})"
    #   flash.now[:notice] = "#{@error}"
    #   false
    # end





    # p @error
    # flash.now[:notice] = "#{@error}"


  def valid3(card)
    if card.split.size == card.split.uniq.size
      true
    else
      @error = "カードが重複しています"
      flash.now[:notice] = "#{@error}"
      false
    end
  end
end