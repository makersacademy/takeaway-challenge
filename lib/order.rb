require_relative 'menu'

class Order

  attr_reader :add_total

  def initialize
    @menu = Menu.new
    @item = Hash.new(0)
    # Hash.new(0) sets default value for any key to 0, while {} sets nil
  end

  def chosen_dishes(dish, quantity = 1)
    @item[dish] += quantity.to_i
    puts "#{quantity} #{dish} added to your order"
  end

  def add_total
    total = 0
    @item.each do |item_key, item_value|
      @menu.menu_list.each do |menu_hash|
        if menu_hash[item_key]
          total += menu_hash[item_key] * item_value
        end
      end
    end
    # p total
  end
end

# order = Order.new
# order.add_total
