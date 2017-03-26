class Menu

# class responsible for loading and showing menu

require_relative 'order'
require_relative 'confirm'

attr_reader :menu, :new_order, :selected_item, :test

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
    puts "============"
    puts "MENU"
    puts "============"
    menu.each_with_index do |menu, index|
      puts "#{index + 1}. #{menu[:item]}, £#{menu[:price]}"
    end
    puts "============"
  end

  def select_item(item_number)
    item_by_number(item_number)
    @new_order.add_item(@selected_item)
  end

  def remove_item(item_number)
    @new_order.delete_item(item_number)
  end

  def review_order
    puts "============"
    puts "YOUR BASKET"
    puts "============"
    @new_order.summary
    puts "============"
    @new_order.show_basket
    puts "============"
  end

  def confirm_order
    puts "============"
    puts "Please check your basket below and confirm you would like this to be delievered"
    review_order
    puts "============"
    puts "Y/N?"
    answer = gets.chomp.capitalize
    if answer == "Y"
      confirm = Confirm.new
      confirm.send
      "Your order has been placed and you will receive a text confirmation shortly."
    else
      "Your order has not been placed."
    end
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
