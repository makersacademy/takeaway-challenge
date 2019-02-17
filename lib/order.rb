class Order
  def initialize
    @menu = Menu.new
    @total = 0
    @basket = []
  end

  def show_menu
    @menu.show
  end

  def add(meal, quantity)
    basket_add(meal, quantity)
    quantity.times do
      @total += @menu.full_menu[meal]
    end
    "Your total cost is £#{@total}"
  end

  def basket_add(meal, quantity)
    @basket << "#{quantity} portion(s) of #{meal}"
  end

  def verify_price(meal, quantity)
    "Your total is £#{@total} - #{meal} (£#{@menu.full_menu[meal]}) x#{quantity} = £#{quantity * @menu.full_menu[meal]}"
  end
end
