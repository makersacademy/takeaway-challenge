class Takeaway
  attr_accessor :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def view_menu
    @menu.print
  end

  def add(dish)
    fail "#{dish} is not on the menu" if !@menu.dishes.key?(dish)
    @basket.push(dish)
  end

  def calculate_total
    @basket.map do |item|
      @menu.dishes[item]
    end.sum
  end

  def check_total(num)
    num.to_i
    if num == calculate_total
      return true
    else
      return false
    end
  end
end
