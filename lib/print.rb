require_relative 'basket'

class Print

  def print(menu)

    menu.each do |key, value|
     puts key + ": " + "$#{value}"
    end

  end

  def print_order_total(order_total)
    puts "Your order total is #{order_total}"
  end

end