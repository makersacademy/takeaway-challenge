require './lib/dish'

class Takeaway

  attr_reader :menu, :basket_subtotal

  def initialize(menu)
    @menu, @basket_subtotal = menu, Hash.new(0)
  end

  def display_menu
    puts "Here is the menu: \n\n"
    @menu.each { |dish|
      puts "#{dish.name}".ljust(40) + "£#{dish.price}".ljust(70)
    }
    puts
  end

  def order(item, quantity = 1)
    @menu.each { |dish|
      if dish.name.downcase.start_with? item.downcase
        @basket_subtotal[dish] += quantity
        puts "#{quantity}x #{dish.name}(s) added to your basket. \n \n"
      end
    }
  end

  def show_basket
    puts "Your basket contains:"
    @basket_subtotal.each { |dish, quantity|
      puts "#{quantity} x #{dish.name} = £#{quantity * dish.price}"
    }
  end

  def total
    sum = 0
    @basket_subtotal.each { |dish, quantity|
      sum += quantity * dish.price
    }
    puts "Total: £#{sum.round(2)}"
  end

  def checkout
  end
end
