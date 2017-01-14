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
    @menu_object.show_menu_array
  end

# order will use the index of menu_array
# to decide which dishes to order
  def order(order)
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
end
