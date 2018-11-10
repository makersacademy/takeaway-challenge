class Order

  DEFAULT_TOTAL = 0

  attr_reader :basket, :menu, :total

  def initialize(menu)
    @menu = menu
    @basket = []
    @total = DEFAULT_TOTAL
  end

  def add(item)
    @menu.list.each do |dish, price|
      @basket << [dish, price] if item == dish
    end
  end
  
end


# total = 0
# basket.each do |item, price|
#   puts "#{item}, #{price}"
#   total += price
# end
# puts total
