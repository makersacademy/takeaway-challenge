require_relative 'menu.rb'

class Order

  attr_reader :menu
  attr_reader :current_order

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = {}
  end

  def select(wanted_dish, amount)
    menu.dishes.each { |menu_dish, price| 
      if wanted_dish == menu_dish 
        @current_order[wanted_dish] = amount
      end
    } 
  end

  # def select(wanted_dish, amount)
  #   @menu.dishes.each{ |menu_dish, price| 
  #     if wanted_dish == menu_dish 
  #       amount.times{ @current_order.push({ wanted_dish => price }) }
  #     end
  #   } 
  # end

  def print_basket
    total = 0
    receipt = ""
    @current_order.each { |ordered_dish, amount|
      menu.dishes.each { |menu_dish, price|
      if ordered_dish == menu_dish
        amount.times { 
          total += price
          receipt << "#{ordered_dish} £#{price}\n"
        }
      end
      }
    }
    receipt << "Total £#{total}"
    puts receipt
    return receipt
  end

end