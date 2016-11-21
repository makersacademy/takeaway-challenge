require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :menu, :basket

  def initialize(order_klass, menu_klass)
    @order_klass = order_klass
    @menu_klass = menu_klass
    @menu = menu_klass.list
    @basket = Hash.new(0)
  end

  def print_menu
    puts menu.map{ |food,price| "#{food}: £#{price}" }
  end

  def add_to_basket(input)
    basket[input.to_sym] += 1
  end

  def show_basket
    basket.each{|item, quantity| puts "#{quantity} #{item.to_s}#{quantity>1 ? 's' : ''}"}
  end

  def checkout(payment)
    @order = order_klass.new(basket, menu_klass, payment)
  end

  def print_total
    checkout(0)
    total = order.calculate_total
    puts "Your total is £%.2f" % total
  end

  private
  attr_reader :order_klass, :menu_klass, :order






end
