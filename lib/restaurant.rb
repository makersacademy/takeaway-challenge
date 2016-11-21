require_relative 'order'

class Restaurant

  attr_reader :new_order, :menu, :basket

  def initialize(order_klass)
    @menu = menu
    @basket = Hash.new(0)
  end

  def print_menu
    puts menu.map{ |food,price| "#{food}: £#{price}" }
  end

  def menu
    {
      pizza: 10,
      burger: 5,
      coke: 1
    }
  end

  def add_to_basket(input)
    basket[input.to_sym] += 1
  end

  def show_basket
    basket.each{|item, quantity| puts "#{quantity} #{item.to_s}#{quantity>1 ? 's' : ''}"}
  end




end
