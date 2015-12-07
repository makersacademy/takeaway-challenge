class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"starter" => 5, "mains" => 10, "desert" => 3}
  end

  def show_dishes
    dishes.each do |dish, value|
      puts "#{dish} : #{value}"
    end
  end

  def check_dishes_are_on_menu(order_as_hash)
    order_as_hash.each do |dish, _quantity|
      fail "Unable to place order: dish not on menu" unless dishes.key?(dish)
    end
  end

  def calculate_order_total(order_as_hash)
    total = 0
    order_as_hash.each {|dish, quantity| total += dishes[dish] * quantity}
    total
  end
end
