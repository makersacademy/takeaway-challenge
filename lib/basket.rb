class Basket
  def initialize
    @list = []
  end

  def store(item, n, price)
    if @list.any? {|x| x[:name] == item}

      @list.each do |x|
        if x[:name] == item
          totalnum = x[:number] + n
          x[:number] = totalnum
          x[:price] = totalnum * price
        end
      end

    else
      @list << {:name => item, :number => n, :price => price}
    end
  end

  def show_basket
    @list.each do |x|
      puts "#{x[:name]} x #{x[:number]} = #{'%.2f' % x[:price] }"
    end
  end

  def total
    sum = 0
    @list.each do |x|
      sum += x[:price]
    end
    sum
  end
end
