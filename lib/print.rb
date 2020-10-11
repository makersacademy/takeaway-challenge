require_relative 'basket'

class Print

  def print_menu(menu)

    menu.each do |key, value|
     puts key + ": " + "$#{value}"
    end

  end

  def print_order_total(order_total)
    puts "Your order total is #{order_total}"
  end

  def print_basket(basket)
    i = 1
    basket.each do |item|
        puts i.to_s + "." + item
        i += 1
    end

end

end