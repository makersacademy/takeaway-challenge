require_relative 'order'
require 'twilio-ruby'

class Confirmation

  def confirmation_of_order(saved_order)
    if saved_order.price == 0
      saved_order.total_price
    end
      puts "Do you confirm your order of #{saved_order.basket} for the value of #{saved_order.price}?"
      puts "Press enter to confirm"
      answer = gets.chomp.to_s
      if answer == ""
        puts "Thank you, please wait for confirmation text."
        confirmation_text
      else
        "Order not confirmed"
      end
  end

  def confirmation_text
    "Text"
  end

end
