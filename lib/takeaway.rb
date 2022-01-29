require_relative 'order'

class Takeaway
  attr_accessor :order
  
  def initialize
    @menu = {
      Pizza: 9.99,
      Kebab: 5.00,
      Chips: 2.20
    }
    @order = []
  end

  def show_menu
    @menu.each { |item, price| puts "#{item} = £#{price}" }
  end

  def add(item, amount = 1)
    @order << "#{amount}x #{item}"
  end

end
