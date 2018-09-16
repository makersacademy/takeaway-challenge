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
    raise "Error, dish not available" if wanted_dish.empty?
    wanted_dish[0]
  end

  def show_menu
    menu_array = []
    @menu.dishes.each { |dish| menu_array << {dish.name => dish.price}}
    menu_array
  end

  def order_total
    total = 0
    @basket.each { |hash| 
      hash.each { |k, v|
        total += v
      }
    }
    total
  end

  


end