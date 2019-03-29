class Menu
  attr_reader :menu, :order

  def initialize
    @menu = [["fish", 5, 1], ["burger", 7, 1], ["pasta", 6, 1]]
    @order = []
  end

  def list_dishes
    @menu.each { |item| "#{item[0]} #{item[1]}" }
  end

  def order_dishes(dish, quantity = 1)
    menu.each { |item|
      if item[0] == dish
        @item = item
      end }
    @item[2] = quantity
    @order << @item
  end

end
