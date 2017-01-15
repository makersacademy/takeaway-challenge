require_relative 'menu'

class Takeaway
attr_reader :menu_object, :order_array

  def initialize
    @menu_object = Menu.new
    @ordered = []
  end

  def add_dish(name, price)
    @menu_object.add(name, price)
  end

  def show_menu
    raise "No dishes available: Please add dishes to the menu" if @menu_object.show_menu_array.empty?
    @menu_object.show_menu_array.each do |x|
      puts "#{x[:name]} : £#{x[:price]}"
    end

  end

# order will use the index of menu_array
# to decide which dishes to order
  def add_to_order(order)
    order_array = []
    order_array = order.split(",").map(&:to_i)
    order_array.each do |x|
      show_menu.each_with_index { |val, index|
        if (x - 1 == index)
          @ordered << val
        end
      }
    end
    @ordered
  end

  def basket
    raise "No Dishes Selected: Please add a dish to your order" if @ordered.empty?
    @ordered
  end

  def total_basket
    total_basket = 0
    @ordered.each do |x|
      total_basket = total_basket + x[:price]
    end
    @total_basket
    return "Your total - £#{total_basket}"
  end

  def checkout
    puts "Your order has been accepted, you will receive a text message confirmaton shortly!"
    @ordered
  end
end
