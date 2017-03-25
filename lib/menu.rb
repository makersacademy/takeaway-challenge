class Menu
# class responsible for loading and showing menu

require_relative 'order'

attr_reader :menu

  def initialize(order_class: Order)
    @menu = []
    @order_class = order_class
  end


  def open
    load_menu
    menu.each_with_index do |menu, index|
      puts "#{index + 1}. #{menu[:item]}, £#{menu[:price]}"
    end
  end

  def add_item(item_number)
    item = menu[item_number-1]
    @new_order.add_item(item)
  end

  def new_order
    @new_order = @order_class.new
  end

private

attr_writer :menu

  def load_menu(filename = "./lib/menu.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      item, price = line.chomp.split(',')
      @menu << {item: item, price: price}
    end
    file.close
  end

end
