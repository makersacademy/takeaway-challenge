require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_item(item, quantity = 1)
    @basket[item] = @basket[item] + quantity
    "You have added #{quantity} #{item}#{quantity > 1 ? "s" : nil} into your basket"
  end

  def total_order    
    total = []
    @basket.each do |item, quantity|
      total.push(@menu.items[item] * quantity) 
    end
    total.sum
  end
end 
