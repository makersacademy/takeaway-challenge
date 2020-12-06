require_relative './menu.rb'
require_relative './invoice.rb'

class Order
  attr_reader :total, :order_summary, :order_output

  def initialize(menu = Menu.new, invoice = Invoice.new)
    @menu = menu
    @order = []
    @invoice = invoice
    self.welcome
  end

  def welcome
    puts "Welcome! Please use view_menu to see the menu.\n" +
    "To add a dish to your order, use select(dish, quantity)\n" +
    "To place your order, use place_order.\n"
  end

  def view_menu
    print @menu.view
  end

  def select(item, quantity = 1)
    choice = item.downcase.to_sym
    quantity.times { @order << @menu.select(choice) }
    "#{quantity} #{item.downcase}(s) added to your order."
  end

  def place_order
    calculate_total(summarise(@order.dup))
    prints_order_summary(summarise(@order.dup))
    # fail if @total is not corrected - I don't understand what 2 things we're comparing

    @invoice.send_text
  end

  # This method converts the order, which is currently an array of instances of
  # the Dish class, to an array of hashes containing the item, price and quantity.
  # Used to make calculate total and print order easier to code.
  def summarise(order)
    @order_summary = []
    # iterate through each dish on menu and count quantity in order
    @menu.dishes.values.each do |dish|
      @order_summary << {
        :item => dish.name,
        :price_per_item => dish.price,
        :quantity => order.count { |choice| choice.name == dish.name }
      }
    end
    @order_summary
  end

  def calculate_total(order)
    @total = @invoice.calculate(order)
  end

  def prints_order_summary(order)
    @order_output = []
    order.each do |summary|
      unless summary[:quantity] == 0
        @order_output << "#{summary[:item]} x #{summary[:quantity]}"
      end
    end
    puts "You have ordered:\n" + order_output.join(",\n") +
    ".\nThe total comes to £#{@total}."
  end

  def order
    @order.dup
  end
end
