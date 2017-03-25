class Menu
# class responsible for loading and showing menu
require_relative 'order'

attr_reader :menu, :new_order, :selected_item

  def initialize(order_class: Order)
    @menu = []
    @order_class = order_class
    @selected_item
  end

  def create_new_order
    @new_order = @order_class.new
  end

  def open
    load_menu
    menu.each_with_index do |menu, index|
      puts "#{index + 1}. #{menu[:item]}, £#{menu[:price]}"
    end
  end

  def select_item(item_number)
    item_by_number(item_number)
    @new_order.add_item(@selected_item)
  end

  def review_order
    @new_order.show_basket
  end

  def remove_item(item_number)
    @new_order.delete_item(item_number)
  end




private

attr_writer :menu, :selected_item

  def load_menu(filename = "./lib/menu.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      item, price = line.chomp.split(',')
      @menu << {item: item, price: price}
    end
    file.close
  end

  def item_by_number(item_number)
    @selected_item = menu[item_number-1]
  end

end
