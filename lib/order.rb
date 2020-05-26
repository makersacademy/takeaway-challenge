require_relative 'menu'
require_relative 'send_sms.rb'


class Order

  attr_reader :customer_basket, :basket_subtotal
  
  def initialize 
    @customer_basket = []
    @basket_subtotal = []
    @menu = Menu.new.menu_list
    @restaurant_name = Menu.new.take_away_name
  end

  # def show_menu
  #   Menu.new.show_list
  # end

  def select_items(customer_choice) 
    raise "Invalid number, please choose again" if customer_choice > @menu.length

    @menu.each do |choice|
      if customer_choice == choice[:item_number]
        customer_basket << choice
      end
    end
  end

  def customer_order_summary
    @customer_basket.each do |order|
      return "#{order[:item]}, price £#{order[:price]}"
    end
  end
  
  def subtotal
    @customer_basket.each do |value| 
      basket_subtotal << (value[:price].to_i) 
      return basket_subtotal.sum 
    end
  end
end
