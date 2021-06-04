require_relative 'menu'

class Order

  attr_reader :order, :basket, :total_cost

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
    @total_cost = 0
  end

  def read_menu(menu = @menu)
    menu.show_menu
  end

  def add_item(dish, quantity = 1)
    @basket[dish] += quantity
  end

  def show_basket
    @basket.each do |item, price|
      puts "£#{price} #{item}"
    end
  end




end
