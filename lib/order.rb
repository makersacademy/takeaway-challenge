require_relative 'menu' 
class Order
  attr_reader :dishes

  def initialize(menu)
    @menu = menu
    @dishes = {}
  end 

    def add_to_basket(item, quantity=1)
      fail 'The selected dish is not available' unless in_menu?(item)
      @dishes[item] = quantity
    end

    def total
      total_price_per_item.inject {|sum, item| sum + item }
    end 

    private

    attr_reader :menu

    def in_menu?(item)
      @menu.include?(item)
    end

    def total_price_per_item
      @dishes.map do |dish, quantity|
      @menu[dish] * quantity
      end 
    end
end 