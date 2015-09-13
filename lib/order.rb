class Order 

  attr_accessor :basket
  attr_reader :total, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @total = 0.0
  end

  def check_dishes
    list_of_dishes = ''
    menu.dishes_available.each do |dish, price|
      list_of_dishes += ("#{dish} £#{price}\n")
    end
    list_of_dishes
  end

  def add_item(dish, quantity = 1)
    fail 'That item is not on the menu' unless menu.dishes_available.has_key?(dish)
    basket[dish] = quantity
    price = quantity * menu.dishes_available[dish]
    @total += price
  end

  def remove_item(dish, quantity = 1)
    fail 'Item was not in the basket' unless basket.include?(dish)
    fail 'You do not have that quantity of the item in the basket' if quantity > basket[dish]
    basket[dish] == 1 ? basket.delete(dish) : basket[dish] -= quantity
    price = quantity * menu.dishes_available[dish]
    @total -= price
  end

  def total_price_verified?
    basket_total = 0.0
    basket.each do |dish, quantity|
      basket_total += quantity * menu.dishes_available[dish]
    end
    basket_total == total ? true : false
  end

  private 



end