require_relative 'menu'

class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def add_item(dish_name, quantity = 1)
    if Menu::MENU_ITEMS.any? {|menu_item| menu_item[:name] == dish_name} == false
      raise "cannot find item #{dish_name} in the menu, please try again"
    else
      add_to_order(dish_name, quantity)
      confirm_item(dish_name, quantity)
     end
   end

  def view_basket
    basket.each do |item, qty|
      p "#{item} x #{qty} = £#{(Menu::MENU_ITEMS.find {|dish| dish[:name] == item }[:price] * qty)}"
    end
  end

  def sum_total
    prices = []
    basket.each{ |item, quantity| prices << (Menu::MENU_ITEMS.find {|dish| dish[:name] == item}[:price] * quantity)}
    @my_total = prices.sum
  end

  def total
    sum_total
    return "Total: £#{@my_total}"
  end

    def my_total
      @my_total
    end

  private

  def menu
    @menu
  end

  def check_in_menu(dish_name)
    if Menu::MENU_ITEMS.any? {|menu_item| menu_item[:name] == dish_name} == false
      raise_error "cannot find item #{dish_name} in the menu, please try again"
    end
  end

  def add_to_order(dish_name, quantity)
    if @basket.has_key?(dish_name)
      @basket[dish_name] += quantity
    else
      store_item(dish_name, quantity)
    end
  end

  def store_item(dish_name, quantity)
    @basket.store(dish_name, quantity)
  end

  def confirm_item(dish_name, quantity)
    return "#{quantity} x #{dish_name}(s) added to your basket"
  end

end
