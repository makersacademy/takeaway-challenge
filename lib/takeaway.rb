require_relative 'messager'
require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :basket


  def initialize(menu, messager)
    @menu = menu
    @basket = Order.new(menu)
    @messager = messager
  end

  def display_menu
    @menu.show_menu
  end

  def select_dishes(dish, amount)
    fail "#{dish} is not on the menu" if @menu.price_of(dish).nil?
    @basket.add(dish, amount)
  end

  def check(tot_customer)
    fail 'Total does not match!' if tot_customer != sum
    true
  end

  def complete_order
    send_text
    @basket = Order.new(@menu)
  end

  def send_text
    @messager.send_text
  end

  private
  def sum
    basket.total
  end

end
