class Order
  attr_reader :dishes

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = Hash.new(0)
  end 

    def add_to_basket(item, quantity=1)
      fail 'The selected dish is not available' unless in_menu?(item)
      @dishes[item] = quantity
    end

    def total
      total_price_per_item.inject {|sum, item| sum + item }
    end 

    # private

    attr_reader :menu

    def in_menu?(item)
      @menu.include?(item)
    end

    def total_price_per_item
      @dishes.map do |dish, quantity|
        @menu.price(dish) * quantity
      end 
    end 

end 

order = Order.new({pita: 4, musaka: 5})
order.add_to_basket(:pita, 3)
order.add_to_basket(:musaka, 2)
p order.total_price_per_item