require_relative 'order'
require_relative 'delivery_sms'

class Menu

  MENU = [
    { name: "Bertie Bott's Every Flavour Beans", price: 7 },
    { name: "Cauldron Cakes", price: 6 },
    { name: "Chocolate Frogs", price: 5 },
    { name: "Drooble’s Best Blowing Gum", price: 10 },
    { name: "Pumpkin Pasties", price: 5 },
    { name: "Licorice Wands", price: 9 }
  ]

  def initialize(order = Order.new, sms = DeliverySMS.new)
    @order = order
    @sms = sms
  end

  def see
    print_out
  end

  def choose(dish, quantity)
    dish_price_quantity = search_menu(dish, quantity)
    order.add(dish_price_quantity)
  end

  def confirm_order(customer_input_price)
    order.confirm(customer_input_price)
  end

  def see_sms
    sms.send_by_sms(print_out_sms)
  end

  private

  attr_reader :menu, :order, :sms

  def search_menu(dish, quantity)
    dish_price_quantity = []
    MENU.each do |item|
      dish_price_quantity = item if dish == item[:name]
    end
    dish_price_quantity[:quantity] = quantity
    dish_price_quantity
  end

  def print_out
    line_width = 40
    three_new_lines
    puts "Hogwarts Express Trolley"
    one_new_line
    MENU.each_with_index do |dish, index|
      print "#{index + 1}. #{dish[:name]}:".ljust line_width
      puts " #{dish[:price]} sickles".rjust line_width
    end
    three_new_lines
  end

  def print_out_sms
    string = ".\n\nHogwarts Express Trolley\n\n"
    MENU.each_with_index do |dish, index|
      string += "#{index + 1}. #{dish[:name]}:"
      string += " #{dish[:price]} silver sickles\n"
    end
    string
  end

  def three_new_lines
    puts "\n\n\n"
  end

  def one_new_line
    puts "\n"
  end
end
