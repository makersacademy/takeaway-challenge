require_relative 'menu'

class Order
attr_reader :grand_total

  def initialize(menu = Menu.new)
    @grand_total = 0.00
    @order_prices = []
    @basket = []
    @quantities_list = []
    @menu = menu
    @menu.display
    clients_order
  end

  def clients_order
    puts "Please enter you orders' numbers one by one. When finish, type 'checkout'."
    while true do
      clients_choice = STDIN.gets.chomp
        if 0 < clients_choice.to_i && clients_choice.to_i <= @menu.list.length
          add_to_basket(clients_choice.to_i, quantities)
          puts "To continue your order, type another dish number or type 'checkout'."
        elsif clients_choice.downcase == "checkout"
          place_order(@basket, @quantities_list, @grand_total)
          break
        else
          puts "I did not understand your command. Please try again."
        end
    end
  end

  def quantities
    puts "Please enter your wished quantity:"
    while true do
      quantity = STDIN.gets.chomp
      if quantity.to_i == nil || quantity.to_i == 0
        puts "Require item quantity to be a number above 0"
      else
        @quantities_list <<  quantity.to_f
        return quantity
        break
      end
    end
  end

  def add_to_basket(order, quantity)
    @grand_total += (@menu.prices[order - 1] * quantity.to_f)
    @order_prices << @menu.prices[order - 1]
    @basket << (@menu.list[order - 1]) + "X#{quantity}"
    puts "Your current total is #{@grand_total}."
  end

  def place_order(basket, quantities, total)
    puts basket
    n = 0
    prices_with_quantities = []
    @order_prices.each do |price|
      prices_with_quantities << (price * quantities[n])
      n += 1
    end
    prices_with_quantities.inject(:+) == total ? Text.new : raise("Sum dishes and total don't match.")
  end
end