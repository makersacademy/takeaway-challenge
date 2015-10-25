require './lib/menu'
require './lib/dish'

class Takeaway
  attr_reader :menu, :order
  def initialize
      @menu = [{ name: "Hamburger", price: 1},
        {name: "Pizza", price: 2},
        {name: "Hotdog", price: 2},
        {name: "Tacos", price: 3},
        {name: "Nachos", price: 1}
      ]
      @order = []
  end

  def list_dishes
    @menu.map{ |dish| p "#{dish[:name]}: £#{dish[:price]}"}*", "
  end

  def add(term)
    @order << @menu.select{|dish| dish[:name] == term}
    @order.flatten!
  end
end
