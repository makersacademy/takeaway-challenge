require_relative "menu.rb"
class Order
  attr_reader :basket, :menu
  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def get_available_dishes
    @menu.dishes.select{ |dish| dish.available == true}
  end
  
  def add_to_basket(item, count = 1)
    count.times do
      @basket << {item.name.to_sym => item.price}
    end
  end
  
  def find_dish(item)
    available_dishes = get_available_dishes
    wanted_dish = available_dishes.select{ |dish| dish.name == item.to_sym }
    wanted_dish[0]
  end


end