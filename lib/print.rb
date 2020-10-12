require_relative 'basket'

class Print

  def print_menu(menu)

    menu.each do |key, value|
     puts key + ": " + "$#{value}"
    end

  end

  def print_basket(basket, order_total)
    puts 'Your Basket:'
    basket.each do |hash|
        hash.each do |item, quantity|
        puts item + ": x" + quantity.to_s
        end
    end
    print_order_total(order_total)
  end

  private 

  def print_order_total(order_total)
    puts "Your order total is $#{order_total}"
  end

end