require_relative 'menu'

class Order

  include Menu
  attr_accessor :customer_order

  def initialize
    @customer_order = {}
    text
  end

  def text
    puts "This is our takeaway menu for today:"
    show_menu
    customer_selection
  end

  def show_menu
    DISHES.map { |name, price| puts "#{name} - £#{price}" }
  end

  def add_dish
    @customer_order[@dish] = @quantity
  end

  def customer_selection
    while true do
      puts "Pick a dish you'd like the add or type 'done' to finish your order."
      @dish = gets.chomp
      puts "Select quantity of dish"
      @quantity = gets.chomp
      if @dish == "done"
        break
      elsif DISHES.keys.include? @dish
        add_dish
      else !DISHES.keys.include? @dish
        puts "This item isn't on the menu, please select something else."
      end
    end
  end


  def order_price
    prices = []
    @customer_order.each do |name, quantity|
    price_of_item = DISHES[name]
    price = price_of_item * quantity.to_f

    prices.push(price)
    end
     total = prices.sum
     puts "The total price of your order is £#{total.ceil(2)}"
  end

end
