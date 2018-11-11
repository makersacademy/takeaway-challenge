require_relative 'menu.rb'

class Order

  attr_reader :my_order, :menu

  def initialize(menu = Menu.new, my_order = [])
    @menu = menu
    @my_order = my_order
  end

  def select(item)
    @menu.list.each do |hash|
      if item == hash[:item]
        @my_order << hash
      end
    end
    @my_order
  end

end
