class Basket
  def initialize
    @list = []
  end

  def store(item, n, price)
    @list << {:name => item, :number => n, :price => price.ceil(2)}
  end

  def show_basket
    @list.each do |x|
      puts "#{x[:name]} x #{x[:number]} = #{x[:price]}"
    end
  end
end
