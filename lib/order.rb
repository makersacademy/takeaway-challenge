class Order

  attr_reader :view_menu
  attr_reader :view_basket

  def initialize(view_menu = Menu.new.view)
    @view_menu = view_menu
    @view_basket = []
  end

  def select_dish(dish, quantity = 1)
    price = price_look_up(dish) * quantity
    @view_basket << { dish: dish, quantity: quantity, price: price }
  end

  def total
    @total = @view_basket.inject(0) {|sum, hash| sum + hash[:price]}
  end

  def total_checker(checker_class = TotalChecker)
    t = checker_class.new(@view_basket, @total).check
  end

  def place_order
    true
  end

private
  def price_look_up(dish)
    @view_menu.each do |e|
      e.select do |menu_dish, menu_price|
        return menu_price if menu_dish == dish
      end
    end
  end

end
