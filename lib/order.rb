require_relative "menu.rb"
require_relative 'twilio'
class Order
  include Twilio
  attr_reader :basket, :menu, :orders
  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
    @orders = []
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

  def complete_order
    time = (Time.now + 3600).strftime("%H:%M")
    @orders << {time: @basket}
  end

  def reset_basket
    @basket = []
  end

  def send_order_message(number)
    send_message(number)
  end


end