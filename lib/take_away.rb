class TakeAway
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def read_menu
    @menu.display
  end

  def order(dish, quantity = 1)
    quantity.times{ @basket << @menu.slice(dish) }
    "#{quantity}x #{dish.downcase}(s) added to your basket"
  end

  # def basket_summary
  #   current_basket = []
  #   @basket.each do |food|
  #     food.each do |dish, price|
  #       if !current_basket.include? dish
  #         food[:quantity] = 1
  #         current_basket << food
  #       else
  #         current_basket[dish] + price
  #         current_basket[:quantity] += 1
  #       end
  #     end
  #   end
  # end

end
