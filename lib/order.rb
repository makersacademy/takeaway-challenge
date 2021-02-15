require_relative 'menu'

class Order

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def read_menu
    puts @menu.items.collect { |item| "#{item[:dish]}: #{item[:price]}" }
    "What would you like?"
  end

  def add(dish, qty = 1)
    @dish = dish
    @basket << { :dish => dish, :qty => qty }
    "#{dish} * #{qty} added to basket"
  end

  def basket_summary

    end
  end

end
