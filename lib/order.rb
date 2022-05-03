class Order 
  attr_reader :basket

  def initialize
    @total = 0
    @menu = Menu.new.dishes
    @basket = []
  end

  def choose_dish(dish)
    @basket << dish
  end

  def total
    @menu.each do |dish, price|
      @basket.each do |selected_dish|
        @total += price if selected_dish == dish
      end
    end
    "Your basket's total is £#{@total}."
  end

  def check_basket
    @basket
  end
end
