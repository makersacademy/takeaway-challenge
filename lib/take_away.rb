require 'twilio-ruby'
require './lib/menu.rb'
require './lib/confrimation_message.rb'

class TakeAway

  attr_reader :basket, :menu, :show_menu, :bill, :total, :confirmation_sms

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @bill = []
    @total = 0
  end

  def view_menu
    menu.show_menu
  end

  def place_order(dish, quantity)
    sum = menu.price_of_dish(dish).to_f * quantity.to_f
    basket << "#{dish} X #{quantity} = £#{sum}"
    @bill << sum
    @total += (menu.price_of_dish(dish).to_f * quantity.to_i)
    "#{quantity} X #{dish} added to your basket"
  end

  def check_order
    print "#{basket.join("\n") }\n"
    print "Total = £#{@total}"
  end

  def confirm_order
    puts 'Would you like to place this order'
    puts 'Enter y for Yes and n to start again, then hit Enter...'
    check_answer == true ? confirmation_sms : check_order
    puts 'Thank you for your order'
  end

private

  def check_answer
    return true if gets.chomp == 'y'
  end
end
