class Takeaway
  attr_reader :menu
  attr_accessor :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def list_menu
    @menu.list
  end

  def add(dish)
    fail "#{dish} is not on the menu" if !@menu.dishes.key?(dish)
    @basket << dish
  end

  def total
    @basket
    basket.map { |key| @menu.dishes[key] }.sum
  end

  def check_total(num)
    num.to_i
    if num == total
      true
    end
  end
end
