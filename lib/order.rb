class Order
  def initialize
    @menu = Menu.new
    @total = 0
    @vindaloo = 0
    @chips = 0
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
    @vindaloo += quantity if meal == "Vindaloo"
    @chips += quantity if meal == "Chips"
    "#{@vindaloo} x Vindaloo and #{@chips} x Chips so far"
  end

  def verify_price
    "Your total is £#{@total} - #{@vindaloo} lots of Vindaloo at £#{@vindaloo * @menu.full_menu["Vindaloo"]}, and #{@chips} lots of Chips at £#{@chips * @menu.full_menu["Chips"]}"
  end
end
