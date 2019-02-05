# frozen_string_literal: true

# onscreen messages
class PrintOut
  def checkout
    print "(type 'checkout' to submit order)\n"
  end

  def close
    wipe
    print "\n     Ruby's Ramen!\n-----------------------\n"
    print "Thank you for visiting.\nPlease come again soon.\n\n"
    farewell
  end

  def empty
    print "There's nothing in your basket.\n"
  end

  def exit_message
    print "'Exit' to leave.\n\n"
  end

  def how_many_would_you_like
    print "...and how many would you like?\n"
  end

  def match_menu_format(user_input)
    user_input.split.map(&:capitalize).join(' ')
  end

  def message_content(total, now = Time.now + 3600)
    currency = format('%.2f', total)
    "\n\nRuby's Ramen!\n\nYour order total is £#{currency}." \
    "Your order will be delivered by #{now.strftime('%H:%M')}"
  end

  def oops
    print "Did you make a mistake?\n"
    print "(type 'cancel' to start over)\n"
  end

  def receipt_header
    print "             Your Order\n------------------------------------\n"
  end

  def welcome_message
    print "\n      Welcome to Ruby's Ramen!\n"
    print "------------------------------------\n"
  end

  def what_is_your_mobile_number
    wipe
    print "What is your mobile number?\n(e.g. 01234567890)\n"
  end

  def what_would_you_like
    print "What would you like?\n"
  end

  def you_entered_zero
    print "You cannot add 0 items to an order.\n"
  end

  def wipe
    system 'clear'
  end

  def farewell
    exit
  end
end
